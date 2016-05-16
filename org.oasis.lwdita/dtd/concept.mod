
<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Concept -->
<!ELEMENT concept	(title, shortdesc, conbody, concept*)  >
<!ATTLIST concept
             id         ID                                 #REQUIRED
             xmlns:ditaarch CDATA #FIXED "http://dita.oasis-open.org/architecture/2005/" 
	     ditaarch:DITAArchVersion CDATA "1.3"
             domains    CDATA                    "&included-domains;"
             %localization;
             class CDATA "- topic/topic concept/concept ">



<!--                    LONG NAME: Concept Body                            -->
<!ELEMENT conbody          ((%all-blocks;)*, section*)        >
<!ATTLIST conbody   
             %localization;
             class CDATA "- topic/body concept/conbody ">

