<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Lightweight DITA Map                              -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      XXX                                               -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an
      appropriate system identifier:
PUBLIC "-//OASIS//ELEMENTS XDITA Map//EN"
      Delivered as file "map.mod"                                  -->

<!-- ============================================================= -->
<!-- SYSTEM:     Lightweight DITA                                  -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for Lightweight DITA maps              -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             XXXX                                              -->
<!--                                                               -->
<!--             (C) OASIS                                         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    25 Nov 2014 KJE: Upload files to DITA TC SVN repo          -->
<!--    16 May 2016  MG: Upload files to GitHub repo               -->
<!--    04 Jun 2017  AH: Added <keydef> and <linktext>             -->
<!--    11 Jun 2017 KJE: Added headers and update logs             -->
<!--    13 Jun 2017  CE: Added XDITA constraint token              -->
<!--    13 Jun 2017  CE: Made map ID optional                      -->
<!--    13 Jun 2017  CE: Added props to <keydef>                   -->
<!--    14 Jun 2017  CE: Added <image>, <alt>, and <xref> to <ph>  -->
<!--    14 Jun 2017  CE: Added @format and @scope to elements with -->
<!--                     @href                                     -->
<!--    14 Jun 2017  CE: Added localization attributes to elements -->
<!--                     that might include content                -->
<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains "">
<!ENTITY xdita-constraint "(map xdita-c)">
<!ENTITY excluded-attributes "">

<!-- ============================================================= -->
<!--                    EXTENSION POINTS                 -->
<!-- ============================================================= -->

<!ENTITY % ph  "ph">
<!ENTITY % data  "data">
<!ENTITY % filter-adds " ">

<!-- ============================================================= -->
<!--                    COMMON DECLARATIONS                       -->
<!-- ============================================================= -->

<!ENTITY % common-inline  "#PCDATA|%ph;|image|%data;">
<!ENTITY % all-inline  "#PCDATA|%ph;|alt|image|xref|%data;">


<!--common attributes-->
<!ENTITY % filters
            'props      CDATA                              #IMPLIED
             %filter-adds;                          ' >
<!ENTITY % reuse
            'id      NMTOKEN                            #IMPLIED
             conref  CDATA                              #IMPLIED  ' >
<!ENTITY % reference-content
            'href      CDATA                            #IMPLIED
             format    CDATA                            #IMPLIED
             scope     (local | peer | external)        #IMPLIED '>
<!ENTITY % control-variables
            'keys      CDATA                            #IMPLIED '>
<!ENTITY % variable-content
            'keyref      CDATA                            #IMPLIED '>
<!ENTITY % variable-links
            'keyref      CDATA                            #IMPLIED '>
<!ENTITY % localization
            'dir         CDATA                              #IMPLIED
             xml:lang    CDATA                              #IMPLIED
             translate   CDATA                             #IMPLIED '>

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Map  -->
<!ELEMENT map		(topicmeta?, (topicref | keydef)*)  >
<!ATTLIST map
             xmlns:ditaarch CDATA #FIXED "http://dita.oasis-open.org/architecture/2005/"
	     ditaarch:DITAArchVersion CDATA "1.3"
             domains    CDATA                    "&xdita-constraint; &included-domains;"
             %localization;
             class CDATA "- map/map ">


<!--                    LONG NAME: Metadata-->
<!ELEMENT topicmeta     (navtitle?, linktext?, data*) >
<!ATTLIST topicmeta
             %localization;
             class CDATA "- map/topicmeta ">

<!--                    LONG NAME: Navigation title -->
<!ELEMENT navtitle (#PCDATA|%ph;)* >
<!ATTLIST navtitle
             %localization;
             class CDATA "- topic/navtitle ">

<!--                    LONG NAME: Link text-->
<!ELEMENT linktext     (#PCDATA | %ph;)* >
<!ATTLIST linktext
            %localization;
             class CDATA "- map/linktext ">

<!--                    LONG NAME: Data  -->
<!ELEMENT data             (#PCDATA|%data;)*        >
<!ATTLIST data
             name       CDATA                            #IMPLIED
             value      CDATA                            #IMPLIED
             href       CDATA                            #IMPLIED
             format     CDATA                            #IMPLIED
             scope      (local | peer | external)        #IMPLIED
             %variable-content;
             %localization;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/data ">

<!--                    LONG NAME: Phrase content  -->
<!ELEMENT ph             (%all-inline;)*        >
<!ATTLIST ph
             %localization;
             %variable-content;
             class CDATA "- topic/ph ">
             
<!--                    LONG NAME: Image  -->
<!ELEMENT image             (alt?)        >
<!ATTLIST image
             href       CDATA                            #IMPLIED
             format     CDATA                            #IMPLIED
             scope      (local | peer | external)        #IMPLIED
             height     NMTOKEN                          #IMPLIED
             width      NMTOKEN                          #IMPLIED
             %localization;
             %variable-content;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/image ">
             
             
<!--                    LONG NAME: Alternative content  -->
<!ELEMENT alt           (#PCDATA|%ph;|xref|%data;)*        >
<!ATTLIST alt
             %localization;
             %variable-content;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/alt ">
             
<!--                    LONG NAME: Reference  -->
<!ELEMENT xref          (%common-inline;)*        >
<!ATTLIST xref
             href       CDATA                            #IMPLIED
             format     CDATA                            #IMPLIED
             scope      (local | peer | external)        #IMPLIED
             %localization;
             %variable-links;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/xref ">



<!--                    LONG NAME: Topic or Map Reference  -->
<!ELEMENT topicref	(topicmeta?, topicref*)        >
<!ATTLIST topicref
             locktitle CDATA      			 #FIXED 'yes'
	           %reuse;
             %filters;
             %localization;
             %reference-content;
	           %control-variables;
             %variable-links;
             class CDATA "- map/topicref ">

<!--                    LONG NAME: Key Definition  -->
<!ELEMENT keydef	(topicmeta?, data*)        >
<!ATTLIST keydef
              %filters;
              %localization;
              href
                        CDATA
                                  #IMPLIED
              keys
                        CDATA
                                  #REQUIRED
              processing-role
                        CDATA       #FIXED      'resource-only'
              class CDATA "+ map/topicref mapgroup-d/keydef "
>
