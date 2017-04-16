<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.sun.cnpi.rss.elements.Url"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.Authenticator"%>
<%@page import="java.net.PasswordAuthentication"%>
<%@taglib uri="/WEB-INF/rssutils.tld" prefix="rss"%>
<html xmlns="http://www.w3.org/1999/xhtml" >
  <head>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <meta name="Robots" content="NOINDEX" />
    <meta http-equiv="PRAGMA" content="NO-CACHE" />



    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <style type="text/css">

      @import "dojox/widget/Calendar/Calendar.css"; @import "dijit/themes/tundra/tundra.css"; 
      @import "dojo/resources/dojo.css" @import "dojox/layout/resources/FloatingPane.css";
    </style>
    <script type="text/javascript" src="dojo/dojo.js" djConfig="parseOnLoad:true">
    </script>
    <script type="text/javascript" src="gtajavascript.js"></script>
      
   

                      <title>
                        Greater Toronto Area Java Professionals (Beta)
                      </title>
                      <style type="text/css" media="screen">
                        <!--
                          /* body and font definitions */html { padding: 0px; margin: 0px; } body { background-color:
                          #e1ddd9; font-size: 12px; font-family: Verdana, Arial, SunSans-Regular, Sans-Serif; color:
                          #564b47; padding: 0px; margin: 0px; } p,h2,pre { margin: 0px; padding: 5px 20px 5px 20px; } a
                          { color: #ff66cc; font-size: 11px; background-color: transparent; text-decoration: none; } pre
                          { color: #564b47; font-size: 11px; background-color: transparent; font-family: Courier,
                          Monaco, Monospace; } .alignright { margin-top: 0; text-align: right; font-size: 10px; } h2 {
                          font-size: 14px; padding-top: 10px; text-transform: uppercase; color: #564b47;
                          background-color: transparent; } h1 { font-size: 11px; text-transform: uppercase; text-align:
                          right; color: #564b47; background-color: #90897a; padding: 5px 15px; margin: 0px } strong {
                          font-size: 13px; } /* positioning-layers static and absolute */ #left { position: absolute;
                          left: 0px; width: 190px; color: #564b47; margin: 0px; padding: 0px; } #content { margin: 0px
                          190px 0px 190px; border-left: 2px solid #564b47; border-right: 2px solid #564b47; padding:
                          0px; background-color: #ffffff; } span.ex2 { font: italic bold 8px/ 15px arial, sans-serif;
                          color: blue; } #right { position: absolute; right: 0px; width: 190px; color: #564b47; margin:
                          0px; padding: 0px; } /* ]]> */
                        -->
                      </style>
                    </head>

                    <body class="tundra">
                    
                   

                      <p align="right">
                        <br />
                        <a href="http://www.GtaJava.com">
                          <img src="logonew.png" alt="" width="414" height="56" border="0" />
                        </a>
                      </p>
                      <h1>
                        For Java People, From Java People
                      </h1>


                      <div id="left">
                        <jsp:include page="LeftPanel.jsp" />
                      </div>

                      
                      <div id="right" >
                        <h2>
                          Sponsor Us
                        </h2>
                        <pre>

                          Sponsor ship details
                          <br>

                          to come soon
                        </pre>
                      </div>
                     
                      <div id="content">
                        <h3>
                          What do you want to do today ?
                        </h3>
                        <div 
                            id="mainTabContainer"
                            dojoType="dijit.layout.TabContainer"
                            style="width: 800px; height: 800px">

                          <div 
                              id="tab1"
                              dojoType="dijit.layout.ContentPane"
                              title="Jobs"
                              selected="true"
                              closable="true">

                           <jsp:include page="RSSFeedPane.jsp" />
                            
                          </div>
                          <!-- End of first Tab -->
                          <div id="tab2" dojoType="dijit.layout.ContentPane" title="Conference" closable="true">
                            Welcome to GTA Java state of art conferencing system. This system is specially designed for
                            next generation communication between
                          </div>
                          <div id="tab3" dojoType="dijit.layout.ContentPane" title="Virtual Interview" closable="true">
                          </div>

                          <div id="tab4" dojoType="dijit.layout.ContentPane" title="eLearning" closable="true">
                          </div>

                          <div id="tab5" dojoType="dijit.layout.ContentPane" title="Training" closable="true">
                          </div>

                          <div id="tab6" dojoType="dijit.layout.ContentPane" title="Consultants" closable="true">
                          </div>

                          <div id="tab7" dojoType="dijit.layout.ContentPane" title="History" closable="true">
                            <span id="cost"></span>
                          </div>
                          
                          <div id="tab8" dojoType="dijit.layout.ContentPane" title="About Us" closable="false">
                          <jsp:include page="Aboutus.jsp" />
                          </div>

                        </div>
                        <!-- end of center column -->
                        
                        
                      </div>


                      <h1>
                        <img src="emailid_brown.png" alt="" width="100" height="25" border="0" />
                        : All Rights Unreserved : GTA Java
                      </h1>

                      <!--  Right click Menu Items -->
                      <ul dojoType="dijit.Menu" id="tree_menu" style="display: none;">
                        <li dojoType="dijit.MenuItem" onClick= myId(); >
                        Add Notes
                      </li>
                      <li dojoType="dijit.MenuItem" disabled="true">
                      Expert Learn
                    </li>
                    <li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconCut" onClick= myId(); >
                    Connect To Recruiter
                  </li>
                  <li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconCopy" onClick= myId(); >
                  Discuss
                </li>
                <li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconPaste" onClick= myId(); >
                Training
              </li>
              <li dojoType="dijit.PopupMenuItem">
              <span>
                Resume
              </span>
              <ul dojoType="dijit.Menu" id="submenu2">
                <li dojoType="dijit.MenuItem">
                Apply Directly
              </li>
              <li dojoType="dijit.MenuItem">
              Match
            </li>
            <li dojoType="dijit.PopupMenuItem">
            <span>
              KeyWord Match
            </span>
            <ul dojoType="dijit.Menu" id="submenu4">
              <li dojoType="dijit.MenuItem" onClick= myId(); >
              All Keywords
            </li>
            <li dojoType="dijit.MenuItem" onClick= myId(); >
            Specific KeyWords
          </li>
        </ul>
      </li>
    </ul>
  </li>
  <li dojoType="dijit.PopupMenuItem">
  <span>
    I am Employer
  </span>
  <ul dojoType="dijit.Menu" id="submenu3" style="display: none;">
    <li dojoType="dijit.MenuItem" disabled="true" onClick= myId(); >
    Download Resumes
  </li>
  <li dojoType="dijit.MenuItem" disabled="true" onClick= myId(); >
  Connect to Candidates
</li>
<li dojoType="dijit.MenuItem" disabled="true" onClick= myId(); >
Virtual Interview
</li>
</ul>
</li>
</ul>

<!-- End of Right click Menu Items -->

</body>
</html>

