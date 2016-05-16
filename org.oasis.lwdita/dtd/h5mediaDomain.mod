<!--html5 media domain - class prefix h5m-d -->
<!--add to object element in doctype shell (replacing object in doctypes): 
	audio|video 
-->
<!--add to included-domains in doctype shell:
	(topic h5m-d)
-->

<!--                    LONG NAME: Audio-->
<!ELEMENT audio (fallback?, controls?, source*, track*)        >
<!ATTLIST audio
             %filters;
             %reuse;
             class CDATA "+ topic/object h5m-d/audio ">

<!--                    LONG NAME: Video-->
<!ELEMENT video (fallback?, controls?, poster?, source*, track*)        >
<!ATTLIST video
             %filters;
             %reuse;
             class CDATA "+ topic/object h5m-d/video ">

<!--                    LONG NAME: Fallback -->
<!ELEMENT fallback		(%common-inline;)*        >
<!ATTLIST fallback
             %localization;
             class CDATA "+ topic/desc h5m-d/fallback ">

<!--                    LONG NAME: Display controls  -->
<!ELEMENT controls 	EMPTY        >
<!ATTLIST controls
             name       CDATA   			 #FIXED "controls"
             value      CDATA                            (y|n)  "y"
             class CDATA "+ topic/param h5m-d/controls ">

<!--                    LONG NAME: Poster image  -->
<!ELEMENT param		EMPTY        >
<!ATTLIST param	
             name       CDATA                            #FIXED "poster"
             value      CDATA                            #IMPLIED
             class CDATA "- topic/param h5m-d/poster ">

<!--                    LONG NAME: Source  -->
<!ELEMENT param		EMPTY        >
<!ATTLIST param	
             name       CDATA                            #FIXED "source"
             value      CDATA                            #IMPLIED
             class CDATA "- topic/param h5m-d/source ">

<!--                    LONG NAME: Track for captions  -->
<!ELEMENT param		EMPTY        >
<!ATTLIST param	
             name       CDATA                            #FIXED "track"
             value      CDATA                            #IMPLIED
             class CDATA "- topic/param h5m-d/track ">

