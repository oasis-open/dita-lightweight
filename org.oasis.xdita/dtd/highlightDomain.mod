<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Lightweight DITA Highlighting Domain              -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      XXX                                               -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an
      appropriate system identifier:
PUBLIC "-//OASIS//ELEMENTS XDITA Highlight Domain//EN"
      Delivered as file "highlightDomain.mod"                      -->

<!-- ============================================================= -->
<!-- SYSTEM:     Lightweight DITA                                  -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the LwDITA highlighting domain     -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             XXXX                                              -->
<!--                                                               -->
<!--             (C) OASIS                                         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    XX XXX XXXX XXX: Initial creation                          -->
<!--    11 Jun 2017 KJE: Added headers                             -->
<!-- ============================================================= -->

<!--                    LONG NAME: Bold content  -->
<!ELEMENT b             (%all-inline;)*        >
<!ATTLIST b
             %localization;
             %variable-content;
             class CDATA "- topic/ph hi-d/b ">

<!--                    LONG NAME: Italic content  -->
<!ELEMENT i             (%all-inline;)*        >
<!ATTLIST i
             %localization;
             %variable-content;
             class CDATA "- topic/ph hi-d/i ">

<!--                    LONG NAME: Underlined content  -->
<!ELEMENT u             (%all-inline;)*        >
<!ATTLIST u
             %localization;
             %variable-content;
             class CDATA "- topic/ph hi-d/u ">

<!--                    LONG NAME: Superscript content  -->
<!ELEMENT sup             (%all-inline;)*        >
<!ATTLIST sup
             %localization;
             %variable-content;
             class CDATA "- topic/ph hi-d/sup ">

<!--                    LONG NAME: Subscript content  -->
<!ELEMENT sub             (%all-inline;)*        >
<!ATTLIST sub
             %localization;
             %variable-content;
             class CDATA "- topic/ph hi-d/sub ">
