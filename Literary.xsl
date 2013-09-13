<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="1.0" encoding="iso-8859-1" indent="no" media-type="text/html"/>

   <!-- This style sheet is divided into the following sections:
   
   HTML WRAPPER
   MAJOR STRUCTURES  of the text (front, div1, back)
   PAGE, COLUMN, AND LINE BREAKS
   METADATA SUMMARY ITEMS
   MSS ITEMS
   MISCELLANEOUS
   IMAGES
   NOTES
   LETTERS
   TITLES
   TYPOGRAPHY
   TABLES
   LISTS
            
-->

   <!-- HTML WRAPPER: Note that this section (between the xsl:template tags) 
places the entire contents enclosed within the text tags of your document into 
the body tags of the Web page. -->

   <xsl:template match="/">
      <html>
         <head>
            <title>
               <xsl:value-of select="//text/body/div1/head"/>
            </title>
            <style> 

	      body { 
  	          margin:30px; 
	          background-color: #FFFFFF; 
	          width: 50em;
	          font-family: palatino, times, serif; 
		  }

	      p { 
		  }

	      div.pagebreak {
	          margin-top: 25px;
		  margin-bottom: 0px;
		  text-align: center;
		  }

	      hr { 
	          color: #888833; 
		  }

	      h1 {
		  }

	      h2 {
		  }

	      sup {
		  } 

	      img {
	          margin-top: 5px;
	          margin-bottom: 5px;
		  }
          
          .ProjectTitle {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 16pt;
	font-style: normal;
	font-weight: bolder;
	line-height: 18pt;
}

.hang {margin-left: 30px; text-indent: -15px;
} 

             
</style>
         </head>
         <body background="http://ts1.cohums.ohio-state.edu/images/people/ulman1/SHawthorne_Letters/Letter4_P2.jpg?qlt=75&amp;RGN=0.026,0.583,0.039,0.05&amp;cell=300,202&amp;cvt=jpeg">
<p align="center"><span class="ProjectTitle">My Dear Elizabeth</span><br/>
  Letters from Sophia Peabody Hawthorne to Elizabeth Palmer
  Peabody, ca. 1837-1868</p>
<hr/>
            <p align="center"><a href="http://people.cohums.ohio-state.edu/ulman1/Sophia_Hawthorne_Letters/" target="self">Home</a> || Views of this letter:
    Literary (current view) |
   <!-- 
   <A>
         <xsl:attribute name="HREF"><xsl:value-of select="TEI.2/@id"/>I.htm</xsl:attribute>
         <xsl:attribute name="target">self</xsl:attribute>
       Illustrative</A>&#x2003;|&#x2003;
   -->
    <A>
       <xsl:attribute name="HREF">http://suse1.cohums.ohio-state.edu/tomcat/cocoon/ulman1/<xsl:value-of select="TEI.2/@id"/>.philological</xsl:attribute>
         <xsl:attribute name="target">self</xsl:attribute>
       Philological</A> | <A>
          <xsl:attribute
             name="HREF">http://suse1.cohums.ohio-state.edu/tomcat/cocoon/ulman1/<xsl:value-of
                select="TEI.2/@id"/>.sideByside</xsl:attribute>
          <xsl:attribute name="target">self</xsl:attribute>
          Text / Page Image</A>
               
   <br/><br/><strong>This edition is still being developed. Please do not cite until this notice is
      removed.</strong>
   <!--    <A>
         <xsl:attribute name="HREF"><xsl:value-of select="TEI.2/@id"/>E.htm</xsl:attribute>
         <xsl:attribute name="target">self</xsl:attribute>
       Embellished</A>
   -->
 </p>
<hr/>
            <xsl:apply-templates select="//text"/>
<hr/>
<p align="left"><a href="home.htm" target="self">Home</a><br/>
<emph>Created: <xsl:apply-templates select="//profileDesc/creation/date"/></emph>
</p>   
         </body>
      </html>
   </xsl:template>

   <!-- MAJOR STRUCTURES: These elements include the front, back, and div1 
   elements of you XML documents in the result tree of your output.-->

   <xsl:template match="div1">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="back">
      <!-- Removed by -->
      <!-- <font size="-1"> -->
         <xsl:apply-templates/>
      <!-- </font> -->
   </xsl:template>
   <xsl:template match="front">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- PAGE, COLUMN, AND LINE BREAKS: These template rules determine how page breaks and
   line breaks will appear, or whether they will appear, in your Web page. -->

   <xsl:template match="pb">
     <xsl:apply-templates/>
    </xsl:template>
   <xsl:template match="lb">
     <!-- <br/>
      <xsl:value-of select="@n"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;-->
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="closer/lb">
      <br/>
      <!-- Removed by -->
      <!-- <xsl:value-of select="@n"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0; -->
   </xsl:template>
   <xsl:template match="//div1[@n='3']//lb">
  <xsl:apply-templates/> <br/>
   </xsl:template>
   <xsl:template match="seg[@type='softhyphen']">
   </xsl:template>
   <xsl:template match="p"><p style="text-indent: 24px"><xsl:apply-templates/></p></xsl:template>

   <!-- METADATA SUMMARY ITEMS: This section includes the title and extent 
   from the front section of your text in your output. -->

   <xsl:template match="front/div1/head/bibl/title">
      <xsl:apply-templates/>
</xsl:template>
   <xsl:template match="front/div1/head/bibl/date">
      (<xsl:apply-templates/>). 
   </xsl:template>
   <xsl:template match="front/div1/head/bibl/abbr">
     <xsl:apply-templates/>.
   </xsl:template>
   <xsl:template match="front/div1/head/bibl/extent">
       <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="front/div1/p">
      <p>
         <xsl:apply-templates/>
      </p><hr/>
   </xsl:template>
   <xsl:template match="idno[@rend='suppress']"></xsl:template>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
   transcriptions of primary handwritten materials. -->

   <xsl:template match="hand">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Handshifts -->

   <xsl:template match="handshift">
      [
<xsl:value-of select="@new"/>
      ]
</xsl:template>

   <!-- Gaps in your transcript of the source text (unrecoverable 
   cancellations, tears in the page, and so on). -->

   <xsl:template match="gap"> <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ]</xsl:template>
  
    <!-- Additions by the author or another hand. -->

   <xsl:template match="add">
          <xsl:apply-templates/>
   </xsl:template>
 <xsl:template match="add[@place='infralinear']">
</xsl:template>

   <!-- Recoverable deletions by the author or another hand -->

   <xsl:template match="del">
      <!-- <S>
         <font color="red">
            <xsl:apply-templates/>
         </font>
      </S> -->
   </xsl:template>
   <!-- 
	<xsl:template match="del">
	</xsl:template> 
   -->
   <!-- Unclear passages. -->
   <xsl:template match="unclear">
         [<xsl:apply-templates/>?]
      </xsl:template>
   <!-- 
   <xsl:template match="orig">
         <xsl:apply-templates/> 
   </xsl:template> 
   -->
   <xsl:template match="orig">
      <xsl:value-of select="@reg"/>
   </xsl:template>
   <xsl:template match="orig[@rend='linebreak']">
      <xsl:value-of select="@reg"/>
      <br/>
   </xsl:template>

   <!-- Nonstandard or erroneous text for which you have encoded a correct alternative. -->

   <xsl:template match="sic">
      <xsl:apply-templates/>
   </xsl:template>
   <!--
   <xsl:template match="sic">
       <xsl:value-of select="@corr"/>
   </xsl:template> 
   -->
   <xsl:template match="corr">
      <xsl:value-of select="@sic"/> [sic] </xsl:template>
   <!-- 
     <xsl:template match="corr">
        	 <xsl:apply-templates/> 
     </xsl:template> 
   -->
   <!--
   <xsl:template match="fw">
       <p>
         <xsl:apply-templates/>
       </p>
   </xsl:template>
   -->

   <!--MISCELLANEOUS-->

   <!-- Quotes -->
   <xsl:template match="q">&quot;<xsl:apply-templates/>&quot;</xsl:template>
   <!-- Abbreviations -->
   <xsl:template match="abbr">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Passages in languages other than your document's base language. -->
   <xsl:template match="foreign">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- DIV HEADS -->

   <xsl:template match="head">
      <!-- Removed by -->
      <!-- <hr width="75%"/> -->
      <h2>
         <xsl:apply-templates/>
      </h2>
   </xsl:template>

   <!-- IMAGES (creates a link to a TrueSpectra image or an image on another 
   Web site [use caution with the latter]). -->

   <xsl:template match="figure">
      <A>
         <xsl:attribute name="HREF">http://ts1.cohums.ohio-state.edu/Images/people/ulman1/SHawthorne_Letters/<xsl:value-of select="figDesc/xref/@url"/><xsl:value-of select="head"/>,Arial,18,000000,100,Custom,bc,0,15,c,0,0,142,2,50,000000&amp;cvt=jpeg</xsl:attribute><xsl:attribute name="target">top</xsl:attribute>
         <xsl:value-of select="figDesc/xref"/>
      </A>
   </xsl:template>
   <!-- 
   <xsl:template match="figure">
	<A><xsl:attribute name="HREF"><xsl:value-of select="@entity"/>.jpg
	</xsl:attribute><center>
	<img><xsl:attribute name="src"><xsl:value-of select="@entity"/>.gif
	</xsl:attribute></img></center></A><br/>
   </xsl:template>     
   -->
   <!-- <xsl:template match="figDesc"></xsl:template> -->

   <!-- NOTES -->

   <xsl:template match="back/div1">
       <hr/>
       <xsl:apply-templates/>
       <br/>
   </xsl:template>
   <xsl:template match="note[@target]">
      <a><xsl:attribute name="href">#<xsl:value-of select="@target"/></xsl:attribute><sup><xsl:apply-templates/></sup></a>
   </xsl:template>
   <xsl:template match="note[@id]">
      <p class="hang"><a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute></a>
      <xsl:apply-templates/></p>
   </xsl:template>

   <!-- Added by -->
   
   <xsl:template match="xref">
      <a>
        <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
	<xsl:choose>
	  <xsl:when test="string-length(normalize-space(@imgref))">
	    <img>
	      <xsl:attribute name="src"><xsl:value-of select="@imgref"/></xsl:attribute>
	      <xsl:attribute name="alt"><xsl:apply-templates/></xsl:attribute>
	      <xsl:attribute name="border">0</xsl:attribute>
	      <xsl:attribute name="align">top</xsl:attribute>
	    </img>
          </xsl:when>
	  <xsl:when test="string-length(normalize-space(.)) > 0">
	      <xsl:apply-templates/>
	  </xsl:when>
          <xsl:otherwise>
	    <xsl:value-of select="@url"/>
          </xsl:otherwise>
	</xsl:choose>
      </a>
   </xsl:template>

   <!-- LETTERS: Handles elements specific to letters. -->

   <xsl:template match="opener">
     <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="salute"><xsl:apply-templates/></xsl:template>
   <xsl:template match="closer">
       <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="dateline">
         <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="dateline/date">
     <xsl:apply-templates/>
      <br/>
   </xsl:template>
   <xsl:template match="dateline/name">
      <xsl:apply-templates/>
      <br/>
   </xsl:template>
   <xsl:template match="signed">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- TITLES -->

   <xsl:template match="titlePart[@type='main']">
      <h3>
         <xsl:apply-templates/>
      </h3>
   </xsl:template>
   <xsl:template match="titlePart[@type='sub']">
      <h4>
         <xsl:apply-templates/>
      </h4>
   </xsl:template>

<!--Formatting for Lists of Works Cited.-->   

   <xsl:template match="//listBibl/bibl">
      <p>
         <xsl:apply-templates>
            <xsl:sort select="author"/>
            <xsl:sort select="title"/>
         </xsl:apply-templates>
      </p>
   </xsl:template>
   <xsl:template match="//listBibl/bibl/author">
      <xsl:apply-templates/>.
   </xsl:template>
   <xsl:template match="//listBibl/bibl/title">
      <i><xsl:apply-templates/>.</i>
   </xsl:template>
   <xsl:template match="//listBibl/bibl/editor">
      <xsl:apply-templates/>, eds.
   </xsl:template>
   <xsl:template match="//listBibl/bibl/pubPlace">
      <xsl:apply-templates/>:
   </xsl:template>
   <xsl:template match="//listBibl/bibl/publisher">
      <xsl:apply-templates/>,
   </xsl:template>
   <xsl:template match="//listBibl/bibl/date">
      <xsl:apply-templates/>.
   </xsl:template>
   <xsl:template match="//listBibl/bibl/titlePage">
      <center>
         <xsl:apply-templates/>
      </center>
   </xsl:template>
   <xsl:template match="//listBibl/bibl/biblScope[@type='URL']">
      [<a><xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute><xsl:apply-templates/></a>].   
   </xsl:template>
   <xsl:template match="//listBibl/bibl/biblScope[@type='DateOfVisit']">
       Date of visit: <xsl:apply-templates/>.
   </xsl:template>

   <!-- TYPOGRAPHY -->

   <xsl:template match="hi">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="hi[@rend='bold']">
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>
   <xsl:template match="hi[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="hi[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="hi[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="emph">
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>
   <xsl:template match="emph[@rend='bold']">
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>

   <!-- TABLES -->

   <xsl:template match="table">
      <table border="1">
         <xsl:apply-templates/>
      </table>
   </xsl:template>
   <xsl:template match="row">
      <tr>
         <xsl:apply-templates/>
      </tr>
   </xsl:template>
   <xsl:template match="cell">
      <td>
         <xsl:apply-templates/>
      </td>
   </xsl:template>

   <!-- LISTS -->

   <xsl:template match="list">
      <ul>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>
   <xsl:template match="item">
      <li>
         <xsl:apply-templates/>
      </li>
      <br/>
      <br/>
   </xsl:template>
</xsl:stylesheet>
