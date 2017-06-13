<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Lightweight DITA Topic                            -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      XXX                                               -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an
      appropriate system identifier:
PUBLIC "-//OASIS//ELEMENTS XDITA Topic//EN"
      Delivered as file "topic.mod"                                -->

<!-- ============================================================= -->
<!-- SYSTEM:     Lightweight DITA                                  -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for Lightweight DITA topics            -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             XXXX                                              -->
<!--                                                               -->
<!--             (C) OASIS                                         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    25 Nov 2014 KJE: Upload files to DITA TC SVN repo          -->
<!--    13 Jul 2015  MG: Made <shortdesc> and <prolog> optional;   -->
<!--                     disabled nested topics                    -->
<!--    16 May 2016  MG: Upload files to GitHub repo               -->
<!--    10 Jul 2016  MG: Removed object element, renamed           -->
<!--                     table-blocks to simple-blocks, added fn   -->
<!--    26 Aug 2016  MG: Added template specialization markup;     -->
<!--                     added @outputclass; added @href to <data> -->  
<!--    19 Mar 2017  MG: Allow PCDATA in <data>                    -->
<!--    27 Mar 2017  CE: Added <data> to block entities            -->
<!--    28 Mar 2017  MG: Touch up <data> additions                 -->
<!--    31 Mar 2017  MG: Made <body> optional                      -->
<!--    09 May 2017  CE: Added @width and @height to <video> and   -->
<!--                     <audio>                                   -->
<!--    10 May 2017  CE: Added @iframe to <video>                  -->
<!--    11 May 2017  CE: Removed <fnref>                           -->
<!--    16 May 2017  CE: Removed @width and @height from <audio>   -->
<!--    29 May 2017  MG: Added fn-blocks entity; removed <param>,  -->
<!--                     <specmeta>,<specatt>; removed %spec-atts  -->
<!--    11 Jun 2017 KJE: Added headers and update logs             -->

<!-- ============================================================= -->
<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains "">
<!ENTITY xdita-constraint "(topic xdita-c)">
<!ENTITY excluded-attributes "">

<!-- ============================================================= -->
<!--                    EXTENSION POINTS                           -->
<!-- ============================================================= -->

<!ENTITY % ph    "ph">
<!ENTITY % data  "data">
<!ENTITY % fig   "fig">
<!ENTITY % filter-adds " ">

<!-- ============================================================= -->
<!--                    COMMON DECLARATIONS                        -->
<!-- ============================================================= -->

<!-- common content models -->

<!ENTITY % common-inline  "#PCDATA|%ph;|image|%data;">
<!ENTITY % all-inline  "#PCDATA|%ph;|image|xref|%data;">
<!ENTITY % simple-blocks  "p|ul|ol|dl|pre|audio|video|fn|note|%data;">
<!ENTITY % fn-blocks  "p|ul|ol|dl|%data;">
<!ENTITY % all-blocks  "p|ul|ol|dl|pre|audio|video|simpletable|fig|fn|note|%data;">
<!ENTITY % list-blocks "p|ul|ol|dl|pre|audio|video|simpletable|fig|note|%data;">
<!ENTITY % fig-blocks  "p|ul|ol|dl|pre|audio|video|simpletable|%data;">

<!-- common attributes -->
<!ENTITY % filters
            'props      CDATA                           #IMPLIED
             %filter-adds;                          ' >
<!ENTITY % reuse
            'id      NMTOKEN                            #IMPLIED
             conref  CDATA                              #IMPLIED  ' >
<!-- %fn-reuse; used for <fn> only, so you can remove this if you want -->
<!ENTITY % fn-reuse
            'conref  CDATA                              #IMPLIED  ' >
<!ENTITY % variable-content
            'keyref      CDATA                          #IMPLIED '>
<!ENTITY % variable-links
            'keyref      CDATA                          #IMPLIED '>
<!ENTITY % localization
            'dir         CDATA                          #IMPLIED
             xml:lang    CDATA                          #IMPLIED
             translate   CDATA                          #IMPLIED '>
<!ENTITY % display-atts
             "scale ( 50|60|70|80|90|100|110|120|140|160|180|200 ) #IMPLIED
              frame ( all|bottom|none|sides|top|topbot )           #IMPLIED
              expanse ( column|page|spread|textline )              #IMPLIED">
<!ENTITY % fig.attributes
             "%display-atts;
              %localization;
              outputclass CDATA #IMPLIED">

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Topic  -->
<!ELEMENT topic   (title, shortdesc?, prolog?, body?)  >
<!ATTLIST topic
             id       ID          #REQUIRED
             xmlns:ditaarch CDATA #FIXED "http://dita.oasis-open.org/architecture/2005/"
	           ditaarch:DITAArchVersion CDATA "1.3"
             domains CDATA "&xdita-constraint; &included-domains;"
             outputclass  CDATA    #IMPLIED
             %localization;
             class CDATA "- topic/topic ">

<!--                    LONG NAME: Title -->
<!ELEMENT title (%common-inline;)* >
<!ATTLIST title
             %localization;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/title ">

<!--                    LONG NAME: Short description-->
<!ELEMENT shortdesc     (%all-inline;)* >
<!ATTLIST shortdesc
             %localization;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/shortdesc ">

<!--                    LONG NAME: Prolog-->
<!ELEMENT prolog (%data;)* >
<!ATTLIST prolog
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/prolog ">


<!--                    LONG NAME: Body                  -->
<!ELEMENT body          ((%all-blocks;)*, section*)        >
<!ATTLIST body
             %localization;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/body ">

<!--                    LONG NAME: Section             -->
<!ELEMENT section       (title?, (%all-blocks;)*)        >
<!ATTLIST section
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/section ">

<!--                    LONG NAME: Paragraph  -->
<!ELEMENT p             (%all-inline;)*        >
<!ATTLIST p
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/p ">


<!--                    LONG NAME: Unordered list  -->
<!ELEMENT ul             (li)*        >
<!ATTLIST ul
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/ul ">

<!--                    LONG NAME: Ordered list  -->
<!ELEMENT ol             (li)*        >
<!ATTLIST ol
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/ol ">


<!--                    LONG NAME: List item -->
<!ELEMENT li            (%list-blocks;)*        >
<!ATTLIST li
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/li ">

<!--                    LONG NAME: Description list -->
<!ELEMENT dl             (dlentry)*        >
<!ATTLIST dl
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/dl ">

<!--                    LONG NAME: Description entry -->
<!ELEMENT dlentry             (dt, dd)        >
<!ATTLIST dlentry
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/dlentry ">

<!--                    LONG NAME: Description term  -->
<!ELEMENT dt             (%all-inline;)*        >
<!ATTLIST dt
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/dt ">

<!--                    LONG NAME: Description   -->
<!ELEMENT dd             (%list-blocks;)*        >
<!ATTLIST dd
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/dd ">


<!--                    LONG NAME: Preformatted content -->
<!ELEMENT pre            (%all-inline;)*        >
<!ATTLIST pre
             xml:space  (preserve)               #FIXED 'preserve'
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/pre ">


<!--                    LONG NAME: Table -->
<!ELEMENT simpletable (sthead?, strow*)        >
<!ATTLIST simpletable
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/simpletable ">


<!--                    LONG NAME: Table header row -->
<!ELEMENT sthead (stentry*)        >
<!ATTLIST sthead
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/sthead ">

<!--                    LONG NAME: Table row -->
<!ELEMENT strow (stentry*)        >
<!ATTLIST strow
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/strow ">

<!--                    LONG NAME: Table cell -->
<!ELEMENT stentry (%simple-blocks;)*        >
<!ATTLIST stentry
             %localization;
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/stentry ">

<!ELEMENT fig   (title?, desc?, (%fig-blocks;|image|xref)*)    >
<!ATTLIST fig
             %fig.attributes;
             class CDATA "- topic/fig " >


<!--                    LONG NAME: Description  -->
<!ELEMENT desc		(%common-inline;)*        >
<!ATTLIST desc
             %localization;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/desc ">

<!--                    LONG NAME: Phrase content  -->
<!ELEMENT ph             (%all-inline;)*        >
<!ATTLIST ph
             %localization;
             %variable-content;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/ph ">

<!--                    LONG NAME: Image  -->
<!ELEMENT image             (alt?)        >
<!ATTLIST image
             href       CDATA                            #IMPLIED
             height     NMTOKEN                          #IMPLIED
             width      NMTOKEN                          #IMPLIED
             %localization;
             %variable-content;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/image ">

<!--                    LONG NAME: Alternative content  -->
<!ELEMENT alt           (%common-inline;)*        >
<!ATTLIST alt
             %localization;
             %variable-content;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/alt ">

<!--                    LONG NAME: Data  -->
<!ELEMENT data             (#PCDATA|%data;)*        >
<!ATTLIST data
             name       CDATA                            #IMPLIED
             value      CDATA                            #IMPLIED
             href       CDATA                            #IMPLIED
             %variable-content;
             outputclass  CDATA          #IMPLIED
             class CDATA "- topic/data ">

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


<!--                    LONG NAME: Audio -->
<!ELEMENT audio (fallback?, controls?, source*, track*)        >
<!ATTLIST audio
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             class CDATA "+ topic/object h5m-d/audio ">

<!--                    LONG NAME: Video -->
<!ELEMENT video (fallback?, controls?, poster?, source*, track*)        >
<!ATTLIST video
             %filters;
             %reuse;
             outputclass  CDATA          #IMPLIED
             height     NMTOKEN                          #IMPLIED
             width      NMTOKEN                          #IMPLIED
             iframe (yes|no) "no"
             class CDATA "+ topic/object h5m-d/video ">

<!--                    LONG NAME: Fallback -->
<!ELEMENT fallback		(%common-inline;)*        >
<!ATTLIST fallback
             %localization;
             outputclass  CDATA          #IMPLIED
             class CDATA "+ topic/desc h5m-d/fallback ">

<!--                    LONG NAME: Display controls  -->
<!ELEMENT controls 	EMPTY        >
<!ATTLIST controls
             name       CDATA   			#FIXED "controls"
             outputclass  CDATA          #IMPLIED
             class CDATA "+ topic/param h5m-d/controls ">
<!-- value      CDATA         (y|n)  "y" -->

<!--                    LONG NAME: Poster image  -->
<!ELEMENT poster		EMPTY        >
<!ATTLIST poster
             name       CDATA         #FIXED "poster"
             value      CDATA         #IMPLIED
             outputclass  CDATA          #IMPLIED
             class CDATA "+ topic/param h5m-d/poster ">

<!--                    LONG NAME: Source  -->
<!ELEMENT source		EMPTY        >
<!ATTLIST source
             name       CDATA           #FIXED "source"
             value      CDATA           #IMPLIED
             outputclass  CDATA          #IMPLIED
             class CDATA "+ topic/param h5m-d/source ">

<!--                    LONG NAME: Track for captions  -->
<!ELEMENT track		EMPTY        >
<!ATTLIST track
             name       CDATA           #FIXED "track"
             value      CDATA           #IMPLIED
             outputclass  CDATA          #IMPLIED
             class CDATA "+ topic/param h5m-d/track ">

<!--                    LONG NAME: Footnote  -->
<!ELEMENT fn ( %fn-blocks; )*  >
<!ATTLIST fn
             %localization;
             %filters;
             %fn-reuse;
             callout     CDATA          #IMPLIED
             outputclass CDATA          #IMPLIED
             id          NMTOKEN        #REQUIRED
             class       CDATA "- topic/fn ">


<!--                    LONG NAME: Note  -->
<!ELEMENT note ( %simple-blocks; )*  >
<!ATTLIST note
             %localization;
             %filters;
             %reuse;
             type (caution|warning|danger|trouble|notice|note) "note"
             outputclass  CDATA          #IMPLIED
             class        CDATA "- topic/note "
             >

