<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0" xmlns="http://relaxng.org/ns/structure/1.0" exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Aug 29, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> Tim Grantham</xd:p>
            <xd:p><xd:b>Email:</xd:b> tim@precisioncontent.com</xd:p>
            <xd:p><xd:b>Organization:</xd:b> Precision Content Authoring Solutions Inc.</xd:p>
            <xd:p><xd:b>Version:</xd:b> 0.4</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:variable name="sequenceModels" select="'- topic/topic - topic/body - topic/section - topic/ul - topic/ol - topic/dl - topic/dlentry - topic/simpletable - topic/fig - topic/image + h5m-d/audio + h5m-d/video + h5m-d/track + h5m-d/source + h5m-d/poster + h5m-d/controls - topic/param '"/>
    <xsl:variable name="topicType" select="/*/@outputclass"/>

    <xsl:template match="/">
        <grammar xmlns="http://relaxng.org/ns/structure/1.0" xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0" datatypeLibrary="http://www.w3.org/2001/XMLSchema-datatypes">
            <!-- Include the RNG schema for the current template topic type -->
            <include href="{name(*)}Mod.rng"/>
            <!-- Generate domain specializations -->
            <xsl:for-each select="*/*[contains(@class, ' topic/prolog ')]/specmeta/*">
                <xsl:choose>
                    <xsl:when test="contains(@class, ' topic/data ')">
                        <define name="{@outputclass}">
                            <xsl:apply-templates select="."/>
                        </define>
                        <define name="data.elements.incl" combine="choice">
                            <choice>
                                <ref name="{@outputclass}"/>
                            </choice>
                        </define>
                    </xsl:when>
                    <xsl:when test="contains(@class, ' topic/ph ')">
                        <define name="{@outputclass}">
                            <xsl:apply-templates select="."/>
                        </define>
                        <define name="basic.ph" combine="choice">
                            <choice>
                                <ref name="{@outputclass}"/>
                            </choice>
                        </define>
                        <define name="small.basic.ph" combine="choice">
                            <choice>
                                <ref name="{@outputclass}"/>
                            </choice>
                        </define>
                    </xsl:when>
                    <xsl:when test="contains(@class, ' topic/props ')">
                        <define name="filter-atts" combine="interleave">
                            <optional>
                                <attribute name="{@outputclass}"/>
                            </optional>
                        </define>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <start combine="choice">
                <xsl:apply-templates/>
            </start>
        </grammar>
    </xsl:template>

    <xsl:template match="*">
        <xsl:choose>
            <!-- If this element is a new specialization, define it. -->
            <xsl:when test="@outputclass and @outputclass != ''">
                <xsl:choose>
                    <xsl:when test="@importance = 'optional'">
                        <optional>
                            <xsl:call-template name="specialize">
                                <xsl:with-param name="element" select="."/>
                            </xsl:call-template>
                        </optional>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="specialize">
                            <xsl:with-param name="element" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- This is a base element. -->
            <xsl:otherwise>
                <xsl:choose>
                    <!-- If this base element has any specialized descendants, we have to pull in the explicit definition for it from the base schema, then process this element's children so it can be remodeled. -->
                    <xsl:when test="descendant::*[@outputclass and @outputclass != '']">
                        <xsl:choose>
                            <xsl:when test="@importance = 'optional'">
                                <optional>
                                    <element name="{name()}">
                                        <ref name="{name()}.attlist"/>
                                        <xsl:apply-templates/>
                                    </element>
                                </optional>
                            </xsl:when>
                            <xsl:otherwise>
                                <element name="{name()}">
                                    <ref name="{name()}.attlist"/>
                                    <xsl:apply-templates/>
                                </element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- Since there are no specialized descendants, we can just pull in the element's definition implicitly. -->
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="@importance = 'optional'">
                                <optional>
                                    <ref name="{name()}"/>
                                </optional>
                            </xsl:when>
                            <xsl:otherwise>
                                <ref name="{name()}"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="specialize">
        <xsl:param name="element" as="element()"/>
        <element name="{@outputclass}">
            <!-- Define the @class attribute for it. -->
            <xsl:variable name="specType">
                <xsl:choose>
                    <!-- Domain specialization -->
                    <xsl:when test="parent::*[name() = 'specmeta']">+</xsl:when>
                    <!-- Whatever the source element's is -->
                    <xsl:otherwise>
                        <xsl:value-of select="substring(@class, 0, 2)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <optional>
                <attribute name="class" a:defaultValue="{concat($specType, substring(@class,2,string-length(@class)))}{$topicType}/{@outputclass} "/>
            </optional>
            <!-- Pull in the non-@class attributes from the element that this element is specialized from. -->
            <ref name="{name()}.attributes"/>
            <xsl:choose>
                <!-- Process sequence content models. -->
                <!-- Check for invalid values in the specmodel attibutes. -->
                <xsl:when test="(@specmodel = 'inherit' and descendant::*[@outputclass and @outputclass != ''] and contains($sequenceModels, @class)) or (@specmodel = 'choice' and contains($sequenceModels, @class)) or @specmodel = 'sequence'">
                    <xsl:if test="@specmodel = 'inherit' and descendant::*[@outputclass and @outputclass != ''] and contains($sequenceModels, @class)">
                        <xsl:message><xsl:value-of select="concat('WARNING: @specmodel should not be set to &quot;inherit&quot; on &lt;',name(),'>, since its base element has a content model of sequence and &lt;',@outputclass, '> has specialized child elements.')"/></xsl:message>
                        <xsl:message>Treating @specmodel attribute as having value 'sequence'.</xsl:message>
                        <xsl:comment><xsl:value-of select="concat('WARNING: @specmodel should not be set to &quot;inherit&quot; on &lt;',name(),'>, since its base element has a content model of sequence and &lt;',@outputclass, '> has specialized child elements.')"/></xsl:comment>
                        <xsl:comment>Treating @specmodel attribute as having value 'sequence'.</xsl:comment>
                    </xsl:if>
                    <xsl:if test="@specmodel = 'choice' and contains($sequenceModels, @class)">
                        <xsl:message><xsl:value-of select="concat('WARNING: @specmodel should not be set to &quot;choice&quot; on &lt;',name(),'>, since its base element has a content model of sequence.')"/></xsl:message>
                        <xsl:message>Treating @specmodel attribute as having value 'sequence'.</xsl:message>
                        <xsl:comment><xsl:value-of select="concat('WARNING: @specmodel should not be set to &quot;choice&quot; on &lt;',name(),'>, since its base element has a content model of sequence.')"/></xsl:comment>
                        <xsl:comment>Treating @specmodel attribute as having value 'sequence'.</xsl:comment>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:when>
                <!-- If the base element's content model is not a sequence, we can process "choice" on specmodel -->
                <xsl:when test="@specmodel = 'choice' and not(contains($sequenceModels, @class))">
                    <!-- Pull in the base element's content model -->
                    <!-- <ref name="{name(.)}.content"/> -->
                    
                    <!-- Add the children as choices -->
                    <zeroOrMore>
                        <choice>
                            <xsl:apply-templates/>
                        </choice>
                    </zeroOrMore>
                </xsl:when>
                <!-- We can safely process @specmodel set to "indhert" -->
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="descendant::*[@outputclass and @outputclass != '']">
                            <ref name="{name(.)}.content"/>
                            <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>
                            <ref name="{name(.)}.content"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </element>
    </xsl:template>

    <xsl:template match="specmeta"/>

    <xsl:template match="text()"/>

</xsl:stylesheet>
