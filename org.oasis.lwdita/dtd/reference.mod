
<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Reference -->
<!ELEMENT reference	(title, shortdesc, refbody, reference*)  >
<!ATTLIST reference
             id         ID                                 #REQUIRED
             xmlns:ditaarch CDATA #FIXED "http://dita.oasis-open.org/architecture/2005/" 
	     ditaarch:DITAArchVersion CDATA "1.3"
             domains    CDATA                    "&included-domains;"
             %localization;
             class CDATA "- topic/topic reference/reference ">



<!--                    LONG NAME: Reference Body                            -->
<!ELEMENT refbody          (refsyn?, section*)        >
<!ATTLIST refbody   
             %localization;
             class CDATA "- topic/body reference/refbody ">

