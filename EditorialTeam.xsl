<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="1.0" encoding="iso-8859-1" indent="no" media-type="text/html"/>
<!-- This style sheet is divided into the following sections:
   
   HTML WRAPPER
   EDITORIAL TEAM
   CHANGE HISTORY
            
-->
   <xsl:template match="/">
      <!-- 
      
      HTML WRAPPER: Note that this section (between the xsl:template tags) 
      places the entire contents enclosed within the text tags of your document into 
      the body tags of the Web page. 
      
      -->
      <html>
         <head>
            <title>
               <xsl:value-of select="//TEI.2/teiHeader/fileDesc/titleStmt/title"/>
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
<p align="center"><span class="ProjectTitle">My Dear Elizabeth</span><br/><br/>
  Letters from Sophia Peabody Hawthorne to Elizabeth Palmer
  Peabody, ca. 1837-1868</p>
<hr/>
            <p align="center"><a
               href="http://people.cohums.ohio-state.edu/ulman1/Sophia_Hawthorne_Letters/"
               target="self">Home</a> || Editorial Team
    <br/><br/><strong>This edition is still being developed. Please do not cite until this notice is
      removed.</strong>
  </p>
<hr/>
            <xsl:apply-templates/>
<hr/>
            <p align="left"><a href="http://people.cohums.ohio-state.edu/ulman1/Sophia_Hawthorne_Letters/" target="self">Home</a><br/>
<emph>Created: <xsl:apply-templates select="//profileDesc/creation/date"/></emph>
</p>   
         </body>
      </html>
   </xsl:template>
  <xsl:template match="titleStmt"><xsl:apply-templates/></xsl:template>
   <xsl:template match="titleStmt/title"><p><strong><xsl:apply-templates/></strong></p></xsl:template>
   <xsl:template match="editor"></xsl:template>
   <xsl:template match="principal"></xsl:template>
   <xsl:template match="titleStmt/respStmt/resp"><p><strong><xsl:apply-templates/></strong></p></xsl:template>
   <xsl:template match="name"><xsl:apply-templates/><br/></xsl:template>
   <xsl:template match="editionStmt"></xsl:template>
   <xsl:template match="extent"></xsl:template>
   <xsl:template match="publicationStmt"></xsl:template>
   <xsl:template match="seriesStmt"></xsl:template>
   <xsl:template match="notesStmt"></xsl:template>
   <xsl:template match="sourceDesc"></xsl:template>
   <xsl:template match="encodingDesc"></xsl:template>
   <xsl:template match="profileDesc"></xsl:template>
   <xsl:template match="revisionDesc">
   <br/> 
     <p> <strong>Change History</strong></p>
      <table width="90%">
   <tr><td><strong>Date</strong></td><td><strong>Role</strong></td><td><strong>Name</strong></td><td><strong>Change</strong></td></tr>
      <xsl:for-each select="change">
      <tr>
         <td><xsl:value-of select="date"/></td>
         <td><xsl:value-of select="respStmt/resp"/></td>
         <td><xsl:value-of select="respStmt/name"/></td>
         <td><xsl:value-of select="item"/></td>
      </tr>
      </xsl:for-each>
   </table>
   </xsl:template>
    <xsl:template match="text"></xsl:template>
</xsl:stylesheet>
