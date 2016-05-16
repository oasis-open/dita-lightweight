<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Task Postrequisites             -->
<!ELEMENT postreq (%all-blocks;)*        >
<!ATTLIST postreq
             %localization;
             %filters;
             %reuse;
             class CDATA "- topic/section task/postreq ">