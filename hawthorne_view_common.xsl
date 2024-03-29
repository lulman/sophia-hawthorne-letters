<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="2.0" exclude-result-prefixes="tei">
   <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Feb 19, 2010</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p/>
      </xd:desc>
   </xd:doc>

   <!-- This style sheet is divided into the following sections:
      
      HTML WRAPPER
      MAJOR DOCUMENT STRUCTURES
      PAGE, COLUMN, AND LINE BREAKS
      MAJOR TEXTUAL STRUCTURES
      SORTING AND FORMATTING LISTS
      ANNOTATIONS
      MANUSCRIPT FEATURES
      MISCELLANEOUS TEXTUAL FEATURES
      IMAGES      
   -->
   <xsl:template match="/">
   <!-- HTML WRAPPER: Note that this template 
      places the entire contents enclosed within the text tags of your document into 
      the HTML of the Web page. 
   -->
<!--      <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
-->    <html>
         <head>
            <!-- Create the head of the HTML document -->
            <!-- First, populate meta element with keywords -->
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
            <!-- Grab title from the fileDesc element of the TEI header. -->
            <title>
               <xsl:value-of
                  select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            
            <!-- LOCAL JS CALLS -->
            <link rel="stylesheet" href="jquery-ui.css"/>
            <link href="hawthorne_letters.css" rel="stylesheet" type="text/css" />
            <script src="jquery-1.8.3.min.js"/>
            <script src="jquery-ui-1.9.2.custom.js"/>
            
            <!-- CREATE TOGGLE BUTTON FOR DIPLOMATIC/REGULARIZED SPELLING -->
<!--           <script>
               $(document).ready(function(){
               $("button").click(function(){
               $(".pencil").toggleClass("penciltoggle");
               $(".ink").toggleClass("inktoggle");
               });
               });
            </script>
-->            
            <!-- CALL VARIABLES (Needed here?) -->  
            <style>
               <xsl:value-of select="$maintextRule"/>
               <xsl:value-of select="$navBarRule"/>
               <xsl:value-of select="$bodyRule"/>
            </style>
            
                   
         </head>
         
         <!-- BUILD THE BODY OF THE HTML PAGE -->
         
         <body>
            <div id="skiptocontent"><a href="#maincontent">skip to main content</a></div>       
            
            <!-- BUILD THE MENUBAR -->
            <div class="masthead">
               <div id="navigation">
                  <ul class="nav">
                     <li class="link"><a class="main"  href="./hawthorne_letters.html#HawthorneIntro">Historical Introduction</a>
                        <ul class="sub">
                           <!-- 
                           <li><a href="./hawthorne_letters.html#letters">Letters and Letter Writing</a></li>
                           <li><a href="./hawthorne_letters.html#west">Tourism and Commerce</a></li>
-->                        
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
               
               <!-- BEGIN titleBar -->
               <div id="titleBar">
                  <p style="text-align: center"><span class="projectTitle">My Dear Elizabeth:<br/>Letters from Sophia Peabody Hawthorne to Elizabeth Palmer Peabody, 1837-1868</span></p>
                  <!-- Horizontal rule beneath page title -->
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
               <p class="aboutView"><a href="#View">About this view.</a></p>              
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
            
            <!--            <p style="text-align: center;">
               <span class="ProjectTitle">
                  <xsl:apply-templates
                     select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
               </span>
            </p>
-->
            <!-- Build the table of contents. -->
            <!-- Apply templates to the tei:body
            -->
            <xsl:element name="div"><xsl:attribute name="id">maintext</xsl:attribute>
               <xsl:element name="div"><xsl:attribute name="id">maincontent</xsl:attribute></xsl:element>
               <h1>Contents<!-- — <xsl:value-of select="$View"></xsl:value-of>--></h1>
               <hr/>
               <xsl:for-each select="/tei:teiCorpus/tei:TEI">
               <xsl:sort select="@n"></xsl:sort>
               &#xa4; <a>
                  <xsl:attribute name="href">#<xsl:value-of select="tei:text//tei:div[@type='letter']/@xml:id"></xsl:value-of>
                  </xsl:attribute>
                  <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"></xsl:value-of>
               </a>
               <br/>
               <p style="font-size:.85em;"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:p"/></p>
            </xsl:for-each>
            <br/>
               
               <!-- Horizontal rule following Table of Contents -->
               <hr style="border:2px solid crimson;"/>
               <h1>Letters</h1>
               
               <xsl:apply-templates select="/tei:teiCorpus/tei:TEI/tei:text/tei:body"/>
               
               <!-- Horizontal rule between text of letters and explanatory annotations -->
               <hr style="border:2px solid crimson;"/>
               
<!--            <!-\- Insert information from the <text> of each TEI element, wrapping each <text> in a div 
             of class "correspondence." -\->
            <xsl:for-each select="/tei:teiCorpus/tei:TEI/tei:text">
               <xsl:sort select="../@n"></xsl:sort>
               <div class="correspondence">
                  <xsl:apply-templates/>
               </div>
            </xsl:for-each>
-->            
            <!-- Insert, count, encode by cardinal position, and link the explanatory annotations. -->
            <xsl:element name="div"><!--<xsl:attribute name="class">contents-notes</xsl:attribute>-->
           <h1>Explanatory Annotations</h1>
               <hr/>
            <xsl:for-each select="//tei:TEI//tei:note[@resp='ed']">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a>
                        <xsl:attribute name="id">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:TEI//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a>
                        <xsl:attribute name="id">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:TEI//tei:note[@resp='ed']" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a>
                           <xsl:attribute name="id">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:TEI//tei:note[@resp='ed']" level="any"/>.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:otherwise>
               </xsl:choose>
             </xsl:for-each>
            </xsl:element> <!-- End of div Explanatory Annotations -->

               <hr style="border: 2px solid crimson;"/>
               <h2 style="text-align:center;">
                  About this View of the Journal
               </h2>
               <hr/>
               <p><a id="View"/><xsl:value-of select="$aboutView"/></p>
            <!-- Insert link to home page, creation date, and licensing statement.-->
               <p style="text-align: left;">
               <a href="#top"
                  target="_self">Top of Page</a>
               <br/>
               <br/>
               Created: <xsl:apply-templates
                     select="//tei:teiCorpus/tei:teiHeader/tei:profileDesc/tei:creation/tei:date"
                  />
            </p>
               <p style="text-align: center;">
               <xsl:value-of
                  select="//tei:teiCorpus/tei:teiHeader/tei:availability/tei:p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
          </xsl:element>
               <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
               <script src="index.js"></script>
         </body>
      </html>
   </xsl:template>

   <!-- MAJOR DOCUMENT STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->

   <xsl:template match="tei:body">
      <hr/>
      <xsl:apply-templates select="tei:div[@type='letter']"/>
      <xsl:apply-templates select="tei:postscript"/>
      <xsl:apply-templates select="tei:div[@type='address_and_postmarks']"/>
      <xsl:apply-templates select="tei:div[@type='enclosure']"/>
      <xsl:apply-templates select="tei:div[@type='envelope']"/>
   </xsl:template>
   <xsl:template match="tei:div[@type='envelope']">
      <div class="envelope">
      Envelope. <xsl:apply-templates
         select="ancestor::tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat"></xsl:apply-templates>
      <p>Return Address: 
      <xsl:choose>
         <xsl:when test="tei:ab[@type='returnAddress']">
         <xsl:apply-templates select="tei:ab[@type='returnAddress']"/>
         </xsl:when>
         <xsl:otherwise>
            N/A
         </xsl:otherwise>
      </xsl:choose></p>
      <p>Mailing Address: 
         <xsl:choose>
            <xsl:when test="tei:ab[@type='postalAddress']">
            <xsl:apply-templates select="tei:ab[@type='postalAddress']"/>
            </xsl:when>
            <xsl:otherwise>
               N/A
            </xsl:otherwise>
          </xsl:choose></p>
      <p>Postmark: 
         <xsl:choose>
            <xsl:when test="tei:ab/tei:stamp[@type='postmark']">
            <xsl:apply-templates select="tei:ab/tei:stamp[@type='postmark']"/>
            </xsl:when>
            <xsl:otherwise>
               N/A
            </xsl:otherwise>
         </xsl:choose></p>      
      <p>Cancellation: 
         <xsl:choose>
            <xsl:when test="tei:ab/tei:stamp[@type='cancellation']">
            <xsl:apply-templates select="tei:ab/tei:stamp[@type='cancellation']"/>
            </xsl:when>
            <xsl:otherwise>
               N/A
            </xsl:otherwise>
         </xsl:choose></p>      
      <p>Endorsement: 
         <xsl:choose>
            <xsl:when test="tei:ab[@type='endorsement']">
            <xsl:apply-templates select="tei:ab[@type='endorsement']"/>
            </xsl:when>
            <xsl:otherwise>
               N/A
            </xsl:otherwise>
          </xsl:choose></p>      
      </div>
   </xsl:template>
   <xsl:template match="tei:div[@type='enclosure']"/>
   <xsl:template match="tei:div[@type='letter']">
      <a class="TOCtarget">
         <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
      </a>
      <div class="letter">
      <xsl:apply-templates/>
      </div>
      <!-- Horizontal rule between body of letter and ms description -->
      <hr style="margin-left:200px;margin-right:200px;"/>
      <div class="msDesc">
         <span style="font-weight:bold;">MS Description. </span><xsl:apply-templates
         select="ancestor::tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:p"/>
      </div>
    </xsl:template>

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will be encoded, or whether they will be included, in your Web page. -->

   <xsl:template match="tei:ab/tei:persName">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:addrLine">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='letter']/tei:head">
      <p><xsl:apply-templates/></p>
   </xsl:template>
   <!-- Template rule for editorial divs in back matter -->

   <xsl:template match="tei:div[@type='editorial']">
      <hr/>
      <br/>
      <a>
         <xsl:attribute name="id">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='editorial']/tei:head">
      <h1>
         <xsl:apply-templates/>
      </h1>
   </xsl:template>
   
   <xsl:template match="//tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25">
            <a>
               <xsl:attribute name="id">
                  <xsl:value-of select="@xml:id"/>
               </xsl:attribute>
            </a>
            <xsl:apply-templates/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="tei:note[@type='introductory']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:note[@resp='ed']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:listPlace">
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"
               /></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"
                  /></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
               <xsl:value-of select="tei:country"/>
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: <xsl:value-of
                  select="tei:location/tei:geo"/>)</xsl:if>. <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- ANNOTATIONS -->

   <xsl:template match="tei:TEI//tei:ptr[@type='noteAnchor']">
      <a>
         <xsl:attribute name="id">p<xsl:value-of select="@target"></xsl:value-of>
         </xsl:attribute>
         <xsl:attribute name="class">notePointer</xsl:attribute>
      </a>
      <a>
         <xsl:attribute name="href">#n<xsl:value-of select="@target"/></xsl:attribute>
         <xsl:attribute name="class">annotation</xsl:attribute>
         <xsl:attribute name="title"><xsl:value-of select="normalize-space(following::tei:note[1])"></xsl:value-of></xsl:attribute>
         <sup>
            <xsl:number level="any" count="tei:TEI//tei:ptr[@type='noteAnchor']"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="tei:note[@xml:id]"/>
   
   <!-- Address and Postmarks -->
   
   <xsl:template match="tei:div[@type='address_and_postmarks']">
       <p><strong><xsl:apply-templates select="tei:figure[@rend='link']"/></strong></p>
      <p><strong>Mailing Address</strong>:
             <br/><xsl:apply-templates select="tei:ab[@type='postalAddress']"/>
      </p>
      <p><strong>Postmarks</strong>: 
               <xsl:apply-templates select="tei:ab/tei:stamp[@type='postmark']"/>
      </p>      
    </xsl:template>
   
   <xsl:template match="tei:ab/tei:stamp[@type='postmark']">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:ab/tei:stamp[@type='cancellation']">
      <br/><xsl:apply-templates/>
   </xsl:template>
   
   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <!-- Handshifts -->
<!--   <xsl:template match="tei:handShift"> [<xsl:value-of select="@new"/>] </xsl:template>-->
   <xsl:template match="tei:handShift"/>

   <!-- Gaps in your transcript of the source text (tears in the page, and so on). -->
   <xsl:template match="tei:gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ] </xsl:template>
   <xsl:template match="tei:damage"> [<em>Damage: <xsl:value-of select="@agent"/> (<xsl:value-of
            select="@extent"/>
         <xsl:value-of select="@unit"/>)</em>] </xsl:template>

   <!-- Editorial emendations -->
   <xsl:template match="tei:supplied"> [<i>
         <xsl:apply-templates/>
      </i>] </xsl:template>

   <!-- Additions by the author or another hand. -->
   <xsl:template match="tei:add">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Recoverable cancellations by the author or another hand are handled in individual views.
   <xsl:template match="tei:del"/>
   -->
   <!-- Unclear passages. -->
   <xsl:template match="tei:unclear"> [<xsl:apply-templates/>?] </xsl:template>

<!-- Nonstandard or erroneous text for which you have encoded a correct or regularized alternative. -->
<!--   
      <xsl:template match="tei:choice/tei:orig">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:reg"/>
   <xsl:template match="tei:distinct[@type='babyTalk']">
      <xsl:apply-templates/> [sic] 
   </xsl:template>
-->   
   <!-- Deal with sic/corr tags -->
   <xsl:template match="tei:choice/tei:sic">
      <xsl:apply-templates/> [<xsl:element name="span"><xsl:attribute name="style">font-style: italic;</xsl:attribute>sic</xsl:element>]
   </xsl:template>
   <xsl:template match="tei:choice/tei:corr"/>
   

   <!--MISCELLANEOUS TEXTUAL FEATURES. -->

   <!-- Quotes -->
   <xsl:template match="tei:q">
      <q>
      <xsl:apply-templates/>
      </q>
   </xsl:template>
   <xsl:template match="//tei:quote[@type='blockquote']">
      <p class="blockquote">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <!-- Abbreviations -->
   <xsl:template match="tei:choice/tei:abbr">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:expan"/>

   <!-- Passages in languages other than your document's base language. -->
   <xsl:template match="tei:foreign">
      <span style="font-style:italic">
         <xsl:apply-templates/>
      </span>
   </xsl:template>

   <!-- Names -->
   <xsl:template match="tei:rs">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:note/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:person/tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Text highlighted in the source document -->

   <xsl:template match="tei:hi[@rend='underlined']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->


   <xsl:template match="//tei:teiCorpus//tei:figure[@rend='link']"> 
      <xsl:element name="a">
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
<!--         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
-->         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </xsl:element></xsl:template>
   
   <xsl:template match="//tei:teiCorpus//tei:figure[@rend='embed']">
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
</xsl:stylesheet>
