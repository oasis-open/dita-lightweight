# MDITA \(MarkDITA\) Aug 24, 2016 draft

## Introduction

MDITA is not a new Markdown flavor. As a [Lightweight DITA](http://dita.xml.org/blog/overview-of-lightweight-dita-xdita-and-hdita) (LwDITA) model, its purpose is to simplify the process of authoring structured content. MDITA is designed in parallel with XDITA and HDITA as LwDITA models, i.e., it is not proposed as a standalone Markdown version of DITA. MDITA is an accessible point of entry to a DITA ecosystem, with an intended audience of developers and authors who write in Markdown and do not necessarily use XML. Source assets created in MDITA can become working topics or move up on a processing chain to authors/editors who transform them to XDITA or full DITA XML to take advantage of the standard's benefits. Topics authored in MDITA, however, do have constraints and are subject to validation when entering a DITA collection. As a work in progress, some validation and processing mechanisms for LwDITA are still under development.

MDITA tries to stick as close as possible to the [original Markdown syntax](http://daringfireball.net/projects/markdown/syntax) proposed by John Gruber; however, it acknowledges its limitations for structuring documentation beyond web articles. Thus, MDITA incorporates elements from John McFarlane's [Pandoc](http://johnmacfarlane.net/pandoc/) and [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/).

In the simplest MDITA workflow, a casual author can create a simple Markdown topic with [atx](http://www.aaronsw.com/2002/atx/intro) headers, paragraphs, and lists and 1\) incorporate it to an existing DITA collection, or 2\) create a new collection with Markdown files or a combination or Markdown and DITA XML. In MDITA, topics authored in Markdown are treated as if they were DITA XML topics, and benefit from DITA's known topic orientation and multichannel transformations through the [DITA Open Toolkit](http://www.dita-ot.org) and community plug-ins. More advanced authors can add Pandoc-like features to MDITA topics to take advantage of DITA's structural capabilities. This approach of treating Markdown files as if they were DITA XML gives MDITA authors options and possibilities beyond those of similar lightweight web-based documentation solutions like [MkDocs](http://www.mkdocs.org), or static website generators like [Jekyll](http://jekyllrb.com).

Most of the MDITA elements included in this article are available through a [transformation plug-in](https://github.com/jelovirt/dita-ot-markdown) compatible with version 2.1+ of the [DITA Open Toolkit](http://www.dita-ot.org).

## Structural elements

|XDITA|MDITA|
|-----|-----|
|topic|A heading one \(`# Title`\) indicates a new topic. A Pandoc title block \(`% Title`\) also initiates a topic.|
|title|Besides a heading one \(`# Title`\) or a Pandoc title block \(`% Title`\), a heading 2 \(`## Title`\) establishes the title of a topic embedded in a parent topic \(both in the same Markdown file\)|
|shortdesc|None. A simple paragraph can set the stage for a topic|
|body|None. Determined by opening heading 1 or title block|
|section|A Pandoc header attribute with the class “section”on a heading 2 creates a new section \(`## This is a section {.section}`\)|
|ul|\* or + or - indicate an unordered list item: `* Element1` is the same as `+ Element1` and `- Element1`; they will all produce the following: -   Element1. List items can include both inline and block elements.|
|ol|Numbers followed by a period \(in no particular order\) indicate an ordered list item. \(`1. Step1, 2.   Step2, 4. Step3 3. Step4 `\). List items can include both inline and block elements.|
|pre|Fenced code blocks following "a sequence of at least three consecutive backtick characters \(\`\) or tildes \(~\)," according to the CommonMark spec. \(`This is pre-formatted code `\).

### XDITA example:
```
<topic>
<title>The point of it all</title>
<shortdesc>I can sum it up here</shortdesc>
<body>
<p>I can say some more stuff</p>
<section>
<title>Stuff</title>
<p>And so on</p>
<ul>
<li><p>This</p></li>
<li><p>Is</p></li>
<li><p>A List</p></li>
</ul>
</section>
</body>
</topic>

```
### MDITA example:

```
# The point of it all

I can sum it up here

I can say some more stuff

## Stuff {.section}

And so on

-   This
-   Is
-   A List
```

|

## Specialized structural elements

|XDITA|MDITA|
|-----|-----|
|concept, task, reference|A Pandoc header attribute with the class "concept," "task," or "reference" on a heading 1 creates a specialized topic \(`# How to clean the car {.task}`\)|
|example|A Pandoc header 2 attribute with the class "example" \(`## This is an example {.example}`\)|
|context|Pandoc header 2 attribute with the class "context" \(`## Context {.context}`\)|
|prereq, postreq|Pandoc header 2 attributes with the class "prereq" \(`## Prerequisites {.prereq}`\) or "postreq" \(`## Before you go {.postreq}`\)|
|steps-informal|Ordered list items can represent steps as follows: \(`1.   Step1 2.   Step2 3.   Step3 `\) .

### XDITA example:
```
<task>
<title>How to do something</title>
<shortdesc>Introduction to something</shortdesc>
<taskbody>
<prereq>Find some time to do it</prereq>
<context>Be prepared to do it</context>
<steps-informal>
   <ol>
      <li>Plan it</li>
      <li>Do it</li>
   </ol>
</steps-informal>
</taskbody>
</task>
```

### MDITA example:

```
# How to do something {.task}

Introduction to something

## Prerequisites {.prereq}

Find some time to do it

## Context {.context}

Be prepared to do it

1.   Plan it
2.   Do it
```

## Inline markup

|XDITA|MDITA|
|-----|-----|
|em|Single asterisks or underscores \(\* emphasis \* or \_ emphasis \_\)|
|strong|Double asterisks or underscores \(\*\* strong \*\* or \_\_ strong \_\_\)|
|code|Backtick quotes \(The second line of the sample program code, ``Do forever``, represents the start of a loop construct\)|

## Tables

MDITA uses GitHub Flavored Markdown to include tables. The [GFM documentation on tables](https://help.github.com/articles/github-flavored-markdown/#tables) explains them as follows:

"You can create tables by assembling a list of words and dividing them with hyphens - \(for the first row\), and then separating each column with a pipe |"

**Note:** GFM tables only allow inline content.

## Images

|XDITA|MDITA|
|-----|-----|
|image|!\[alt text for an image\]\(images/image\_name.jpg\)|

## Maps

MDITA uses DITA Maps to organize Markdown topics and/or XDITA topics. A map can include only Markdown topics or a combination of Markdown and DITA. Topic references linking to a Markdown topic require a `format="markdown"` attribute.

**Example:**

```
<map>
<title>Topic collection</title>
<topicref href="c-first.md" format="markdown" />
<topicref href="t-second.dita" />
</map>
```

MDITA also uses simplified maps with Markdown-like links.

**Example:**

```
# Topic collection {.map}

-   [First concept](c-first.md)
-   [First task](t-first.md)
    -   [Second task](t-second.md)
```

## Attributes, linking, and content reuse

|XDITA|MDITA|
|-----|-----|
|id|`{#id}` Only applies to heading-level elements and fenced code blobks.|
|@outputclass|`{.class}` Only applies to heading-level elements and fenced code blocks. The classes "section," "example," "prereq," "context," "result," and "postreq" display special behaviors.|
|href|`[Local](test.*)`, where \* can be .dita, .xml, .html, or .md `[External](http://www.example.com/test.html)`|
|keyref|`[key]` will create a link to a keyref or topicref properly tagged as a key in a DITA map|
|conref|Similar to [GitHub's documentation reuse practices](https://github.com/blog/1939-how-github-uses-github-to-document-github), MDITA uses YAML files to group frequently used phrases. Based on [Jekyll's data files syntax](http://jekyllrb.com/docs/datafiles/), MDITA's phrases can be referenced in individual topics as follows:`{{ site.data.conrefs.phrases.downloadfile }}`|
