<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Task Context                         -->
<!ELEMENT context (%all-blocks;)*        >
<!ATTLIST context
             %localization;
             %filters;
             %reuse;
             class CDATA "- topic/section task/context ">