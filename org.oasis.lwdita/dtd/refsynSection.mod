<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Reference Syntax                         -->
<!ELEMENT refsyn (title?, (%all-blocks;)*)        >
<!ATTLIST refsyn
             %localization;
             %filters;
             %reuse;
             class CDATA "- topic/section reference/refsyn ">