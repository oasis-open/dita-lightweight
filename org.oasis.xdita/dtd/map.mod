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

<!ENTITY % all-inline  "#PCDATA|%ph;|%data;">


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
             %variable-content;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/data ">

<!--                    LONG NAME: Phrase content  -->
<!ELEMENT ph             (%all-inline;)*        >
<!ATTLIST ph
             %localization;
             %variable-content;
             class CDATA "- topic/ph ">

<!--                    LONG NAME: Topic or Map Reference  -->
<!ELEMENT topicref	(topicmeta?, topicref*)        >
<!ATTLIST topicref
             locktitle CDATA      			 #FIXED 'yes'
	           %reuse;
             %filters;
             %reference-content;
	           %control-variables;
             %variable-links;
             class CDATA "- map/topicref ">

<!--                    LONG NAME: Key Definition  -->
<!ELEMENT keydef	(topicmeta?, data*)        >
<!ATTLIST keydef
              %filters;
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
