<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" exclude-result-prefixes="tei">
   <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jul 24, 2012</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p></xd:p>
      </xd:desc>
   </xd:doc>
   
 <!-- VARIABLE CSS RULES -->
      
   <xsl:variable name="bodyRule">
      body {
      font-family: Times, 'Times New Roman', serif;
      font-size: 1em;
      width: 800px;
      margin-left: 50px;
      margin-right: 50px;
      margin-top: 100px;
      }
   </xsl:variable>
   <xsl:variable name="navBarRule">
      #navBar {
      position: fixed;
      top: 120px;
      float : left;
      text-align : left;
      /* margin-left: 10px; */
      margin-top:0px;
      background-color: rgba(255, 255, 255, 1);
      }
      #viewMenu {
      position: fixed;
      top:140px;
      left: 865px;
      width:150px;
      margin-top: 0px;
      }     
      .close {
      position: absolute;
      top: 90px;
      right: 260px;
      color: #f1f1f1;
      font-size: 36px;
      font-weight: bold;
      transition: 0.3s;
      z-index: 2;
      }
      .description {
      position: absolute;
      top: 90px;
      right: 650px;
      color: #f1f1f1;
      font-size: 16px;
      font-weight: bold;
      transition: 0.3s;
      z-index: 2;
      }
   </xsl:variable>
   <xsl:variable name="maintextRule">
      #maintext {
      float:right;
      width:610px;
      margin-top:35px;
      margin-left:20px;
      padding:5px;
      background-color: rgba(209,209,209, 0.5);
      -webkit-border-radius: 10px;
      -moz-border-radius: 10 px;
      border-radius: 10px;	
      }
   </xsl:variable>
      
   <!-- 
   
   HTML WRAPPER: Note that this section (between the xsl:template tags) 
   places the entire contents enclosed within the TEI Header into 
   the body element of the HTML page. 
   
   -->
   <xsl:template match="/">
      <html>
         <head>
            <!-- Populate meta element with keywords -->
            <xsl:element name="meta">
               <xsl:attribute name="name">keywords</xsl:attribute>
               <xsl:attribute name="content">
                  <xsl:for-each select="//tei:keywords[@scheme='#LCSH']/tei:term">
                     <xsl:choose>
                        <xsl:when test="current()=//tei:keywords[@scheme='#LCSH']/tei:term[1]">
                           <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
                     </xsl:choose>
                  </xsl:for-each>
               </xsl:attribute>
            </xsl:element>
            <title>
               <xsl:value-of
                  select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            
            <!-- LOCAL JS CALLS -->
            <link rel="stylesheet" href="jquery-ui.css"/>
            <link href="hawthorne_letters.css" rel="stylesheet"/>
            <script src="jquery-1.8.3.min.js"/>
            <script src="jquery-ui-1.9.2.custom.js"/>
                        
            <!-- CALL VARIABLES -->  
            <style>
               <xsl:value-of select="$maintextRule"/>
               <xsl:value-of select="$navBarRule"/>
               <xsl:value-of select="$bodyRule"/>
            </style>
            
            <!-- DECLARE FONTS-->
            <link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'/>
            <link href='http://fonts.googleapis.com/css?family=Fanwood+Text' rel='stylesheet'/>
            
         </head>
         
         <!-- BUILD THE BODY OF THE HTML PAGE -->
         
         <body>
            
            <!-- BUILD THE MENUBAR -->
            <div id="skiptocontent"><a href="#maincontent">skip to main content</a></div>       
            <div class="masthead">
               <div id="navigation">
                  <ul class="nav">
                     <li class="link"><a class="main"  href="./hawthorne_letters.html#HawthorneIntro">Historical Introduction</a>
                        <ul class="sub">
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Editorial Introduction</a>
                        <ul class="sub">
                           <li><a href="./hawthorne_letters.html#projectDescription">Project Description</a></li>
                           <li><a href="./hawthorne_letters.html#source">The Source Document</a></li>
                           <li><a href="./hawthorne_letters.html#edition">The Electronic Edition</a></li>
                           <li><a href="./hawthorne_letters.html#worksCited">Works Cited</a></li>
                           <li><a href="./hawthorne_letters.html#peopleMentioned">People Mentioned</a></li>
                           <li><a href="./hawthorne_letters.html#organizationsMentioned">Organizations Mentioned</a></li>
                           <li><a href="./hawthorne_letters.html#placesMentioned">Places Mentioned</a></li>
                           <li><a href="./hawthorne_letters.html#revision">Revision History</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Views of the Letters</a>
                        <ul class="sub">
                           <li><a href="./hawthorne_reading.html">By Letter</a></li>
                           <li><a href="./hawthorne_diplomatic.html">By MS Page</a></li>
                           <li><a href="./hawthorne_splitview.html">Facsimile/Text</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Appendices</a>
                        <ul class="sub">
                           <li><a href="./hawthorne_appendices_markup.html">Markup Guidelines</a></li>
                           <li><a href="./hawthorne_appendices_hand.html">Hawthorne's Hand</a></li>
                           <li><a href="./hawthorne_appendices_msimages.html">Images of the MS Pages</a></li>
                           <li><a href="./hawthorne_appendices_maps.html">Maps</a></li>
                           <li><a href="./hawthorne_appendices_acknowledgements.html">Acknowledgements</a></li>
                           <li><a href="./hawthorne_appendices_editors.html">About the Editors</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Source Files</a>
                        <ul class="sub">
                           <li><a href="./hawthorne_letters.xml">TEI: Source Markup</a></li>
                           <li><a href="./hawthorne_view_common.xsl">XSL: Base Stylesheet</a></li>
                           <li><a href="./hawthorne_view_diplomatic.xsl">XSL: MS Page View</a></li>
                           <li><a href="./hawthorne_view_reading.xsl">XSL: Entry View</a></li>
                           <li><a href="./hawthorne_view_splitview.xsl">XSL: Text/Facs View</a></li>
                           <li><a href="./hawthorne_view_edintro.xsl">XSL: Ed. Intro</a></li>
                           <li><a href="./hawthorne_letters.css">CSS: Style Sheet</a></li>
                           <li><a href="./hawthorne_letters.odd.txt">ODD: TEI Customization</a></li>
                           <li><a href="./hawthorne_letters.rnc.txt">RNC: Schema</a></li>
                        </ul>
                     </li>
                  </ul> <!-- End ul class nav -->
               </div> <!-- End div id navigation -->
               
               <div id="titleBar">
                  <p style="text-align: center"><span class="projectTitle">My Dear Elizabeth:<br/>Letters from Sophia Peabody Hawthorne to Elizabeth Palmer Peabody, 1837-1868</span></p>
                  <hr style="border: 2px solid crimson;"/>
               </div> <!-- END titleBar -->
            </div> <!-- END masthead -->
       
            <!-- BUILD THE VERTICAL IMAGE BAR -->
            
            <div id="navBar">
               
               <div id="display1"><!-- Begin display1 -->
                  <button class="modalb" id="b1"><img id="myImg1" src="image_Sophia_Peabody_Hawthorne.jpg" alt="Portrait of Sophia Peabody Hawthorne (ca. 1845)." title="Portrait of Sophia Peabody Hawthorne (ca. 1845)" width="100"/></button>
                  <div id="myModal1" class="modal">
                     <a href="image_Sophia_Peabody_Hawthorne_longdesc.html" class="description">[Description]</a><br/>
                     <button class="modalb close" onclick="document.getElementById('myModal1').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img1" src="image_Sophia_Peabody_Hawthorne.jpg" alt="Portrait of Sophia Peabody Hawthorne (ca. 1845)."/>
                     <div id="caption1">
                        Portrait of Sophia Peabody Hawthorne (ca. 1845).
                        <br/>Frontispiece, <cite>Nathaniel Hawthorne and His Wife: A Biography</cite>, Vol. II (1891),<br/> by Julian Hawthorne 
                     </div>
                  </div> <!-- End myModal1 -->
               </div> <!-- End display1 -->
               
               <!-- Begin display2 -->
               <div id="display2">
                  <button class="modalb" id="b2"><img id="myImg2" src="image_Elizabeth_Palmer_Peabody.jpg" alt="Portrait of Elizabeth Palmer Peabody (ca. 1894)." title="Portrait of Elizabeth Palmer Peabody (ca. 1894)" width="100"/></button>
                  <div id="myModal2" class="modal">
                     <a href="image_Elizabeth_Palmer_Peabody_longdesc.html" class="description">[Description]</a><br/>
                     <button class="modalb close" onclick="document.getElementById('myModal2').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img2" src="image_Elizabeth_Palmer_Peabody.jpg" alt="Portrait of Elizabeth Palmer Peabody (ca. 1894)."/>
                     <div id="caption2">
                        Portrait of Elizabeth Palmer Peabody (ca. 1894).<br>Library of Congress Prints and Photographs Online Catalog</br>
                     </div>
                  </div> <!-- End myModal2 -->
                  <script>		
                     // Get the second modal
                     var modal2 = document.getElementById('myModal2');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img2 = document.getElementById('b2');
                     var modalImg2 = document.getElementById("img2");
                     var captionText2 = document.getElementById("caption2");
                     img2.onclick = function(){
                     modal2.style.display = "block";
                     modalImg2.src = this.img.src;
                     captionText2.innerHTML = this.alt;
                     }
                     
                     // Get the span element that closes the modal 
                     var span = document.getElementsByClassName("close")[0];
                     
                     // When the user clicks on span (x), close the modal 
                     span.onclick = function() {
                     modal2.style.display = "none";
                     }
                  </script>
               </div> <!-- End display2 -->
               
               <!-- Begin display3 -->         
               <div id="display3">
                  <button class="modalb" id="b3"><img id="myImg3" src="image_Mary_Peabody_Mann.jpg" alt="Portrait of Mary Tyler Peabody Mann (undated)" title="Portrait of Mary Tyler Peabody Mann (undated)" width="100"/></button>
                  <div id="myModal3" class="modal">
                     <a href="image_Mary_Peabody_Mann_longdesc.html" class="description">[Description]</a><br/>
                     <button class=" modalb close" onclick="document.getElementById('myModal3').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img3" src="image_Mary_Peabody_Mann.jpg" alt="Portrait of Mary Tyler Peabody Mann (undated)"/>
                     <div id="caption3">
                        Portrait of Mary Tyler Peabody Mann (undated)<br/><cite>The Bostonian</cite> v.3, no.4, Jan. 1896
                     </div>
                  </div> <!-- End myModal3 -->
                  <script>
                     
                     // Get the modal
                     var modal3 = document.getElementById('myModal3');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img3 = document.getElementById('b3');
                     var modalImg3 = document.getElementById("img3");
                     var captionText3 = document.getElementById("caption3");
                     img3.onclick = function(){
                     modal3.style.display = "block";
                     modalImg3.src = this.img.src;
                     captionText3.innerHTML = this.alt;
                     }
                     
                     // Get the span element that closes the modal
                     var span = document.getElementsByClassName("close")[0];
                     
                     // When the user clicks on span (x), close the modal
                     span.onclick = function() {
                     modal3.style.display = "none";
                     }
                  </script>
               </div> <!-- End display3 -->
               
               <!-- Begin display4 -->
               
               <div id="display4">
                  <button class="modalb" id="b4"><img id="myImg4" src="image_Hawthorne_children.jpg" alt="Una, Julian, and Rose Hawthorne, ca. 1862" title="Una, Julian, and Rose Hawthorne, ca. 1862" width="100"/></button>
                  <div id="myModal4" class="modal">
                     <a href="image_Hawthorne_children_longdesc.html" class="description">[Description]</a><br/>
                     <button class="modalb close" onclick="document.getElementById('myModal4').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img4" src="image_Hawthorne_children.jpg" alt="Una, Julian, and Rose Hawthorne, ca. 1862"/>
                     <div id="caption4">
                        Photograph of Una, Julian, and Rose, Hawthorne's children, ca. 1862<br/>
                        Photograph by Silsbee and Case<br/>
                        http://www.hawthorneinsalem.org/images/image.php?name=MMD368
                     </div> <!-- End myModal4 -->
                     <script>
                        
                        // Get the modal
                        var modal4 = document.getElementById('myModal4');
                        
                        // Get the image and insert it inside the modal - use its "alt" text as a caption
                        var img4 = document.getElementById('b4');
                        var modalImg4 = document.getElementById("img4");
                        var captionText4 = document.getElementById("caption4");
                        img4.onclick = function(){
                        modal4.style.display = "block";
                        modalImg4.src = this.img.src;
                        captionText4.innerHTML = this.alt;
                        }
                        
                        // Get the span element that closes the modal
                        var span = document.getElementsByClassName("close")[0];
                        
                        // When the user clicks on span (x), close the modal
                        span.onclick = function() {
                        modal4.style.display = "none";
                        }
                     </script>
                  </div> <!-- End modal4 -->
               </div> <!-- End display 4 -->
               
               
               <!-- Begin display5 -->
               <!-- 
                  
                  <div id="display5">
                  <button class="modalb" id="b5"><img id="myImg5" src="image_sscox_illus_Pompeii.jpg" alt="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854)" title="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854)" width="100"/></button>
                  <div id="myModal5" class="modal">
                     <a href="image_sscox_illus_Pompeii_longdesc.html" class="description">[Description]</a><br/>
                     <button class="modalb close" onclick="document.getElementById('myModal5').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img5" src="image_sscox_illus_Pompeii.jpg" alt="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854) "/>
                     <div id="caption5">
                        A Villa in Pompeii<br/>Illustration from <cite>A Buckeye Abroad</cite> <br/>Cincinnati: Moore, Anderson, 1854
                     </div>
                  </div> <!-\- End myModal5 -\->
                  <script>
                     
                     // Get the modal
                     var modal5 = document.getElementById('myModal5');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img5 = document.getElementById('b5');
                     var modalImg5 = document.getElementById("img5");
                     var captionText5 = document.getElementById("caption5");
                     img5.onclick = function(){
                     modal5.style.display = "block";
                     modalImg5.src = this.img.src;
                     captionText5.innerHTML = this.alt;
                     }
                     
                     // Get the span element that closes the modal
                     var span = document.getElementsByClassName("close")[0];
                     
                     // When the user clicks on span (x), close the modal
                     span.onclick = function() {
                     modal5.style.display = "none";
                     }
                  </script>
               </div>
               --> 
               <!-- End display5 -->
               <script>
                  // Get the first modal
                  var modal1 = document.getElementById('myModal1');
                  
                  // Get the image and insert it inside the modal - use its "alt" text as a caption
                  var img1 = document.getElementById('b1');
                  var modalImg1 = document.getElementById("img1");
                  var captionText1 = document.getElementById("caption1");
                  img1.onclick = function(){
                  modal1.style.display = "block";
                  modalImg1.src = this.img.src;
                  captionText1.innerHTML = this.alt;
                  }
                  
                  // Get the span element that closes the modal
                  var span = document.getElementsByClassName("close")[0];
                  
                  // When the user clicks on span (x), close the modal
                  span.onclick = function() {
                  modal1.style.display = "none";
                  }
               </script>
               
            </div> <!-- End div id NavBar -->
            
            <!-- END THE VERTICAL IMAGE BAR -->
            <!-- START RIGHT MENU -->   
            <div id="viewMenu">
               <div class="container">
               <p class="aboutView"><a href="#view">About this page.</a></p>
                  <p class="font-size-label">Font Size <button id="up">+</button> <button id="down">-</button></p>
                  <!--<p id="font-size"></p>-->
                  <p style="font-size:smaller">
                     <strong>Edited by</strong><br/>
                     Michael Albrecht<br/>
                     Karen D. Anderson<br/>
                     Sue Carlson<br/>
                     David Carrino<br/>
                     John DiCamillo<br/>
                     Anthony DiCola<br/>
                     Thomas J. Firestone<br/>
                     Joseph P. Frazee<br/>
                     Krista L. Havrilla<br/>
                     Stacy R. Haynes<br/>
                     Marianne Johnson<br/>
                     Sean O'Reilly<br/>
                     Jose A. Orozco<br/>
                     Christopher R. B. Pinner<br/>
                     Michelle R. Soell<br/>
                     Chris Stull<br/>
                     H. Lewis Ulman<br/>
                  </p>
                  <!-- Start NINES Widget -->
                  <form method="get"
                     style="font-size-adjust:none;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.231;color:#000000;"
                     action="http://www.nines.org/search">
                     <div
                        style="background:url(image-widget_tower_white.jpg) no-repeat scroll left top;height:56px;width:157px;font-size:12px;margin:0;padding:125px 0 0 22px;text-align:left;font-family:'Times New Roman',Times,serif;font-size-adjust:none;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.231;color:#000000;">
                        <a href="http://nines.org"
                           style="text-decoration:none; float:left; margin-top:-125px; height:120px; width:120px;"
                           >&#160;</a>
                        <input type="text" name="q" onclick="this.form.target='_blank';return true;"
                           size="16" maxlength="255" value=""
                           style="width:100px;-x-system-font:none;font-family:arial,helvetica,clean,sans-serif;font-size-adjust:none;font-stretch:normal;font-style:normal;font-variant:normal;font-weight:normal;line-height:normal;margin:0;margin-top:3px;margin-bottom:5px;padding:0;text-align:left;color:#000000;" />
                        <input type="submit" value="Search NINES"
                           style="width:100px;padding:1px;-x-system-font:none;font-family:arial,helvetica,clean,sans-serif;font-size:99%;font-size-adjust:none;font-stretch:normal;font-style:normal;font-variant:normal;font-weight:normal;line-height:normal;margin:0;margin-left:7px;text-align:left;color:#000000;"
                        />
                     </div>
                  </form>
                  <!-- End NINES Widget -->
                  <!-- END RIGHT MENU -->
               </div> <!-- End div class "container" -->
            </div> <!-- End div id "View Menu" -->
              
   <xsl:element name="div">
   <xsl:attribute name="id">maintext</xsl:attribute>
      <xsl:element name="div"><xsl:attribute name="id">maincontent</xsl:attribute></xsl:element>
     <!-- Order and apply templates for the sections of the header you wish to include. -->
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:projectDesc"/>
            <xsl:apply-templates
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:editorialDecl"/>

<!--     THIS INFO COVERED IN EDITORIAL DECLARATION       
         <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:refsDecl"/>
-->      
      <hr style="border: 2px solid crimson;"/>
      <a id="worksCited"/>
            <h2>List of Works Cited</h2>
      <h3>Abbreviations Used in Notes</h3>
      <ul>
         <li>ANB <span style="font-style:italic">American National Biography</span> </li>
         <li>CEN <span style="font-style:italic">The Centenary Edition of the Works of Nathaniel Hawthorne</span></li>
         <li>DNB <span style="font-style:italic">Dictionary of National Biography</span> </li>
      </ul>
      <hr/>
            <xsl:apply-templates
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl[@type='workscited']"/>
      <h3>Collections of Sophia Peabody Hawthorne's Correspondence</h3>
      <xsl:apply-templates
         select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl[@type='manuscripts']"/>
      <hr style="border: 2px solid crimson;"/>
      <h2>Appendices</h2>            
            <xsl:apply-templates
               select="/tei:teiCorpus/tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson[@type='mentioned']"/>
      <xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"></xsl:apply-templates>
      <xsl:apply-templates
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:revisionDesc"/>
      <hr style="border: 2px solid crimson;"/>
      <p>
               <strong>About this Editorial Introduction</strong>
            </p>
            <p><a id="view"/>Text on this page is derived from the
               edition's XML source document, hawthorne_letters.xml, transformed
               via the hawthorne_view_edintro.xsl style sheet.</p>
            <hr/>
            <p>&#x2192; <a href="hawthorne_reading.html">Link to the text of the journal</a>.
            </p>
         </xsl:element> <!-- END maintext -->
         <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
         <script src="index.js"></script>
         </body>
      </html>
   </xsl:template>
   
   <!-- Format the introductory notes. -->
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']">
      <h2><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>Introduction: "A long—closely written letter"</h2>
      <hr/>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- Format information about your source document. -->
   <xsl:template
      match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']">
      <hr style="border: 2px solid crimson;"/>
      <a id="source"/>
      <h2>About the Source Documents</h2>
      <hr/>
      <p><strong>Title</strong>: <xsl:value-of select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/> 
         <br/><strong>Extent</strong>: <xsl:value-of select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:extent"/>
      </p>
      <p>See individual letters (under "Views of the Letters") for physical descriptions of each letter.</p>
         <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/refsDecl">
      <h3>Encoding Conventions</h3>
      <xsl:apply-templates/>      
   </xsl:template>
   
<!-- Format the availability statement -->      
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability">
            <xsl:apply-templates/>
<!--      
      <p>
         <em>
            <xsl:value-of select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/>, <xsl:value-of
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>
         </em>
      </p>
-->   
   </xsl:template>

   <!-- Format information about your document. -->
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:projectDesc">
      <hr style="border: 2px solid crimson;"/>
      <a id="projectDescription"></a>
      <h2>Project Description</h2>
      <hr/>
         <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt">
      <hr style="border: 2px solid crimson;"/>
      <a id="edition"/>
      <h2>About the Electronic Edition</h2>
      <hr/>
      <p><strong>Preferred Citation</strong>: <xsl:value-of select="tei:title"/></p>
         <p><strong>Editors</strong>: <xsl:for-each select="tei:editor/tei:persName">
            <xsl:choose>
               <xsl:when test="current()=//tei:titleStmt/tei:editor[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.</p>
      <xsl:for-each select="tei:respStmt">
         <p>
      <strong><xsl:value-of select="tei:resp"/></strong>
      <xsl:for-each select="tei:persName">
            <xsl:choose>
               <xsl:when test="current()=//tei:respStmt/tei:persName[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.
         </p>
      </xsl:for-each>
      <p>
         <xsl:value-of
            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"
            disable-output-escaping="yes"/>
      </p>
      
<!--      <p>
         <xsl:value-of select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/>, <xsl:value-of
            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>
      </p>
-->      

   </xsl:template>
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:editorialDecl">
      <hr style="border: 2px solid crimson;"/>
      <h2>Editorial Method</h2>
      <hr/>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->
   
   <xsl:template match="tei:listBibl[@type='workscited']">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25"><a>
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
            <xsl:apply-templates/></p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="tei:listBibl[@type='manuscripts']">
         <xsl:for-each select="tei:bibl">
            <p class="hang25">
               <xsl:apply-templates/></p>
         </xsl:for-each>
   </xsl:template>
   
<!-- OLD PEOPLE MENTIONED TEMPLATE -->
 
<!--   <xsl:template match="tei:listPerson[@type='mentioned']">
      <a id="PeopleMentioned"/>
      <h3>List of People Mentioned in the Letters</h3>
      <xsl:for-each select="tei:person">
         <xsl:sort select="tei:persName"/>
         <p>
            <strong><xsl:value-of select="tei:persName"/></strong>
         <xsl:if test="tei:birth">
            <xsl:text> (b. </xsl:text><xsl:value-of
            select="tei:birth/tei:date[@when]"/><xsl:if test="tei:death"> - d. <xsl:value-of
               select="tei:death/tei:date[@when]"></xsl:value-of></xsl:if>)</xsl:if>.
          <xsl:apply-templates select="tei:note[@type='biographical']"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="tei:listPerson[@type='editors']"/>
-->         
   
<!-- New People mentioned template -->
   
   <xsl:template match="tei:listPerson[@type='mentioned']">
      <hr/>
      <h3 id="peopleMentioned">List of People Mentioned</h3>
      <xsl:for-each select="tei:person">
         <xsl:sort select="tei:persName[1]"/>
         <p>
            <strong><xsl:value-of select="tei:persName"/></strong>
            <xsl:if test="tei:birth or tei:death">
               <xsl:choose>
                  <xsl:when test="tei:birth[@notAfter]"> (b. not before <xsl:value-of select="tei:birth/@notAfter"/></xsl:when>
                  <xsl:when test="tei:birth[@when]"> (b. <xsl:value-of select="tei:birth/@when"/></xsl:when>
                  <xsl:when test="tei:birth[@when-custom]"> (b. <xsl:value-of select="tei:birth/@when-custom"/></xsl:when>
                  <xsl:otherwise> (</xsl:otherwise></xsl:choose>
               <xsl:choose>
                  <xsl:when test="not(tei:birth)"></xsl:when>
                  <xsl:when test="not(tei:death)"></xsl:when>
                  <xsl:otherwise>; </xsl:otherwise>
               </xsl:choose>
               <xsl:choose>
                  <xsl:when test="tei:death[@notBefore]">d. not before <xsl:value-of select="tei:death/@notBefore"/></xsl:when>
                  <xsl:when test="tei:death[@when]">d. <xsl:value-of select="tei:death/@when"/></xsl:when>
                  <xsl:when test="tei:death[@when-custom]">d. <xsl:value-of select="tei:death/@when-custom"/></xsl:when>
                  <xsl:otherwise></xsl:otherwise></xsl:choose>)</xsl:if>.
            <xsl:apply-templates select="tei:note[@type='biographical']"/>
            <xsl:if test="tei:bibl"> (<xsl:apply-templates select="tei:bibl"/>)</xsl:if>.
         </p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:listOrg">
      <hr/>
      <h3 id="organizationsMentioned">List of Organizations Mentioned</h3>
      <xsl:for-each select="tei:org">
         <xsl:sort select="tei:orgName[1]"/>
         <p>
            <strong><xsl:value-of select="tei:orgName"/></strong>:
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
   
   <xsl:template match="tei:listPlace">
      <hr/>
      <h3 id="placesMentioned">List of Places Mentioned in the Letters</h3>
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName[1]"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"/></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"/></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
            <xsl:value-of select="tei:country"/> 
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: 
               <xsl:value-of select="tei:location/tei:geo"/>)</xsl:if>. 
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- Format information about the revision history of your document. -->
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:revisionDesc">
      
<!-- Moved to the section describing the electronic edition
         
         <hr style="border: 2px solid crimson;"/>
      <h2>License</h2>
      <p>
            <xsl:value-of
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"
               disable-output-escaping="yes"/>
         </p>
-->  
      <hr style="border: 2px solid crimson;"/>
      <a id="revision"/>
         <h2>Revision History</h2>
      <table style="width: 90%">
         <tr>
            <td>
               <h3>Date</h3>
            </td>
<!--
               <td>
               <h3>Role</h3>
            </td>
-->
            <td>
               <h3>Name</h3>
            </td>
            <td>
               <h3>Change</h3>
            </td>
         </tr>
         <xsl:for-each select="tei:change">
            <tr class="revTable" style="vertical-align:top">
               <td style="white-space: nowrap">
                  <xsl:value-of select="@when"/>
            </td>
               <td style="white-space: nowrap">
                  <xsl:value-of select="tei:roleName"/>
            </td>
            <td>
                  <xsl:value-of select="text()"/>
            </td>
            </tr>
         </xsl:for-each>
      </table>
      <p><br/></p>
   </xsl:template>

   <!-- Format miscellaneous elements -->
   <xsl:template match="tei:lb"><br/></xsl:template>
   <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>   
   <xsl:template match="tei:p[@rend='h3']">
      <xsl:element name="h3">
         <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="//tei:p[not(@xml:id='CreativeCommons') and not(@rend='h3') and not(@class='epigraph') and not(@rend='epigraph')]">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="tei:q[@rend='block']">
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:quote[@rend='blockquote']">
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="//tei:p[@rend='epigraph']">
      <p class="epigraph">
         <xsl:apply-templates/>
         <br/>
     </p>
   </xsl:template>
   
   <xsl:template match="//tei:p[@rend='namenote']">
      <p style="border-top:1px solid;border-bottom:1px solid;padding-top:5px;padding-bottom:5px">
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   
   <xsl:template match="tei:name">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:name[@type='ship']">
      <i><xsl:apply-templates/></i>
   </xsl:template>
   <xsl:template match="tei:foreign">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='italics']">
      <span style="font-style:italic">
         <xsl:apply-templates/>
      </span>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='underline']">
      <span style="text-decoration:underline">
         <xsl:apply-templates/>
      </span>
   </xsl:template>
   <xsl:template match="tei:emph[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <span style="font-style:italic">
         <xsl:apply-templates/>
      </span>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <span style="text-decoration:underline;">
         <xsl:apply-templates/>
      </span>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="tei:q">
      "<xsl:apply-templates/>"
   </xsl:template>
   <xsl:template match="tei:note[@type='introductory']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']"><cite><xsl:apply-templates/></cite></xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template> 
   
   <xsl:template match="tei:date">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->
   <xsl:template match="tei:figure[@rend='link']"> 
      <a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a></xsl:template>
   <xsl:template match="tei:figure[@rend='embed']">
      <div class="fl_img_right">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
               <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
         </img>
         <br/>
         <xsl:value-of select="tei:head"/>
      </div>
   </xsl:template> 
   
   <!-- Deal with sic/corr tags -->
   <xsl:template match="tei:choice/tei:sic">
      <xsl:apply-templates/> [<xsl:element name="span"><xsl:attribute name="style">font-style: italic;</xsl:attribute>sic</xsl:element>]
   </xsl:template>
   <xsl:template match="tei:choice/tei:corr"/>
   
  
   <!-- Suppress some unused elements in the XML file. -->
   <xsl:template match="tei:text"/>
   <xsl:template match="tei:editor"/>
   <xsl:template match="tei:principal"/>
   <xsl:template match="tei:editionStmt"/>
   <xsl:template match="tei:extent"/>
   <xsl:template match="tei:encodingDesc"/>
   <xsl:template match="tei:profileDesc"/>
   <xsl:template match="tei:idno"/>
   <xsl:template match="tei:publisher"/>
   <xsl:template match="tei:pubPlace"/>
   <xsl:template match="tei:publicationStmt/tei:date"></xsl:template>
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"/>
</xsl:stylesheet>
