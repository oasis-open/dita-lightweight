<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Task Prerequisites                         -->
<!ELEMENT prereq (%all-blocks;)*       >
<!ATTLIST prereq
             %localization;
             %filters;
             %reuse;
             class CDATA "- topic/section task/prereq ">