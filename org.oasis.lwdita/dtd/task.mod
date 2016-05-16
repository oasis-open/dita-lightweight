
<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Task-->
<!ELEMENT task		(title, shortdesc, taskbody, task*)  >
<!ATTLIST task
             id         ID                                 #REQUIRED
             xmlns:ditaarch CDATA #FIXED "http://dita.oasis-open.org/architecture/2005/" 
	     ditaarch:DITAArchVersion CDATA "1.3"
             domains    CDATA                    "&included-domains;"
             %localization;
             class CDATA "- topic/topic task/task ">



<!--                    LONG NAME: Task Body                            -->
<!ELEMENT taskbody      (prereq?, context?, steps-informal?, result?, example?, postreq?)>
<!ATTLIST taskbody
             %localization;
             class CDATA "- topic/body task/taskbody ">

