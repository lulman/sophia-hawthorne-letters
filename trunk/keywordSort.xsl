<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--
 This file can be modified to work with any XML file. 
 It performs a simple but useful function: it selects and pulls out any occurrence of whatever 
 element you specify within an XML file, sorts all occurrences of this element alphabetically, 
 and displays only the first occurrence of each unique value contained within that element. 
 This stylesheet is quite useful for tasks such as getting an alphabetized list of all names, subjects, etc.
 -->

<xsl:template match="/">

<html>
<head>
<title>Keywords</title>
</head>

<body>

<xsl:for-each select="//term">
<xsl:sort select="."/>
<xsl:variable name="keyword" select="."/>
<xsl:if test="not(preceding::image[keyword=$keyword])">
<xsl:value-of select="$keyword"/>
<br />
</xsl:if>
</xsl:for-each>


</body>
</html>
</xsl:template>



</xsl:stylesheet>
