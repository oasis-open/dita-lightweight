<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Task Result                         -->
<!ELEMENT result (%all-blocks;)*        >
<!ATTLIST result
             %localization;
             %filters;
             %reuse;
             class CDATA "- topic/section task/result ">