<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Task Steps                         -->
<!ELEMENT steps-informal (p?, (ol|ul))        >
<!ATTLIST steps-informal
             %localization;
             %filters;
             %reuse;
             class CDATA "- topic/section task/steps-informal ">