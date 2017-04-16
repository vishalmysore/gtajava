<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.sun.cnpi.rss.elements.Url"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.Authenticator"%>
<%@page import="java.net.PasswordAuthentication"%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%><html dir="ltr">

  <head>
    <title>Greater Toronto Area Java Professionals</title>
    
    <meta name="keywords" content="jobs, toronto, java ,toronto jobs, training, GTAJava, Greater Toronto Area Java, java jobs,J2ee, learn java,training" />

    <style type="text/css">
      @import "dojox/widget/Calendar/Calendar.css"; @import "dijit/themes/tundra/tundra.css";
      @import "dojo/dijit/themes/nihilo/nihilo.css";      
      @import"dojo/resources/dojo.css" @import "dojox/layout/resources/FloatingPane.css"
      @import "chat/chat.css"  @import "dojox/layout/resources/ResizeHandle.css";
    </style>
    <style type="text/css">
      body, html { font-family:helvetica,arial,sans-serif; font-size:90%; }
      span.ex2 { font: bold 10px/ 15px arial, sans-serif;
                          color: blue; }
      
                        
                          
    </style>


    <style type="text/css">
      html, body { width: 95%; height: 95%; margin: 0; }
    </style>
    <script type="text/javascript" src="dojo/dojo.js" djConfig="parseOnLoad:true">
    </script>
    <script src="gtajavascript.js">
    </script>
    
    

    <style type="text/css">


      input.groovybutton { font-size:9px; font-family:Arial Narrow,sans-serif; font-weight:bold; color:#330000;
      height:18px; background-color:#DDDDDD; border-style:ridge; }
      
      
     img.center {
               position:absolute;
               top:70%; /*change to fit*/
               left:75%;/*change for page*/
               }
  
  .altTextField {
            background-color: #ececec;
            font-family: verdana;
            font-size: 10pt;            
            font-weight: bold;            
            color: orange
       } 
    </style>

    <script language="javascript">
      function goLite(BTN)
      {
        dojo.byId(BTN).style.backgroundColor = "#888888";
        dojo.byId(BTN).style.borderStyle = "dotted";
      }

      function goDim(BTN)
      {
        dojo.byId(BTN).style.backgroundColor = "#DDDDDD";
        dojo.byId(BTN).style.borderStyle = "ridge";
      }
      
      
      
    </script>


  </head>

  <body class="tundra "> 
 
  
    <div dojoType="dijit.layout.BorderContainer" style="width: 100%; height: 100%;">
      <div dojoType="dijit.layout.ContentPane" region="top">
        <a href="http://www.GtaJava.com">
                          <img src="img/whitelogo.png" alt="" width="414" height="56" border="0" />
                        </a>
                        <img src="img/whatdoyouwant1.png" class="center" alt="" width="200" height="20" border="0" align="right" />
      </div>

      <div dojoType="dijit.layout.AccordionContainer" region="leading" style="width: 15%;">
       <div dojoType="dijit.layout.AccordionPane" title="Facts" >
       <ul align="left">
       <li>
       
       52 million Americans have hit the Internet in search of a job. That's a 60-percent jump over the number of people who used the Internet in their online job searches in March 2000.
       </li>
  <li>
       On an average day, more than 4 million people search out new opportunities on the Net.
  </li>
  <li>
       According to the study, 52 percent of the American workforce has Internet access at work
  </li>
  <li>
       According to Internet Business Network, 77% of Internet users who are looking for a job use the 'Net to do so. 
  </li>
  <li>

       The number of blue collared workers who went online in March 2000 were 6.3 million and in March 2001 was 9.5 million. 
  </li>
  <li>
       The Standard estimated that the online population in US at 128 million or 50% of population.  
  </li>
  <li>
      
        There was a 55.47% increase in the number of resumes posted in January 2009, compared to the number of resumes posted in December 2008
          </li>
  
       </ul>
       </div>
        <div dojoType="dijit.layout.AccordionPane" title="Sponsor Us" >
          Recruiters Can sponsor GTA Java for as little as "900 CENTS" Only. To know more please contact
        </br>
        <img src="emailid.png" alt="" width="80" height="25" />
      </div>
      <div dojoType="dijit.layout.AccordionPane" title="Contact">
        Our Contact Address:
      </br>
      <img src="emailid.png" alt="" width="80" height="25" />
    </div>

    <div dojoType="dijit.layout.AccordionPane" title="Linkedin">
      Join the the official GTA Java linked group today :
      <a href="http://www.linkedin.com/groupInvitation?groupID=1992440&sharedKey=54132C7F1138">
        Click here
      </a>
    </div>
    <div dojoType="dijit.layout.AccordionPane" title="Register">
      We believe in <a href="http://en.wikipedia.org/wiki/Gratis_versus_Libre#.22Free_as_in_beer.22_vs_.22Free_as_in_speech.22"> "Free as in speech as well as Free as in beer" .</a> So there's no process of registration!!!
    </div>

  </div>
  <div dojoType="dijit.layout.TabContainer" region="center">
    <div dojoType="dijit.layout.ContentPane" title="Jobs">
     <div align="left" >

     <div onmouseout="changeTextOnSliderBack()" onmouseover="changeTextOnSlider()" align="center" dojoType="dijit.form.HorizontalSlider" name="horizontal1" onChange="increasePrecentage(dojo.number.format(arguments[0]/100,{places:1,pattern:'#%'}));" value="10" maximum="100" minimum="0" pageIncrement="100" showButtons="true" intermediateChanges="true" slideDuration="100" style="width:100px; height: 10px; background-color: Silver; border: 4" id="slider1"></div><label for="slider1"><span class="ex2"></span></label><input readonly id="slider1input" style='background-color: Silver; font-style: italic; font-weight: bold; height: 21px; width: 98px; line-height: normal; font-size: 10px; font-family: "Times New Roman", Serif; color: Blue' size="4" value="Resume Match">&nbsp;&nbsp;&nbsp;  <input align="center" class="altTextField" id="searchText" type="text" value="Enter search Keyword" onfocus="clearValueInSearchBox(this)" onkeypress="onSearchEnter()" style='width: 129px; line-height: normal; color: Red; font-variant: normal; font-style: normal; font-size: 10px; font-family: "Times New Roman", Serif; font-weight: bold'><button dojoType="dijit.form.Button" onclick="searchStore()">Search</button><input align="center" id="previous" onClick="goBack()" type="button" class="groovybutton" disabled="disabled" value="Previous" align="top"><input align="center" id="next" onClick="goForward()" type="button" class="groovybutton" value="Next">&nbsp;&nbsp;<span id="jobsFoundSpan" style='background-color: Silver;  font-weight: bold;  line-height: normal; font-size: 12px; font-family: "Times New Roman", Serif; color: Blue' size="4" ></span>
		
			
			 
        
			
      </div>
        
  
      <div id="stackContainer" dojoType="dijit.layout.StackContainer">
        <div id="Page1" dojoType="dijit.layout.ContentPane" label="Jobs1" href="RSSFeedPane.jsp"  layoutAlign="none" style="height: 600px" preload="false" >
          
        </div>

        <div id="Page2" dojoType="dijit.layout.ContentPane"  href="RSSFeedPane2.jsp" preload="false">

          Add Your Custom Job feeds here !!
        </div>
        <div id="Page3" dojoType="dijit.layout.ContentPane" >
          Coming Soon!! <br>
          Add more of Your Custom Job feeds here !!
        </div>
      </div>



    </div>

    <!-- End of first Tab -->
    <div id="tab2" dojoType="dijit.layout.ContentPane" title="Conference" closable="true">
     <jsp:include page="chat/chat1.jsp" />
    </div>
    <div id="tab3" dojoType="dijit.layout.ContentPane" title="Virtual Interview" closable="true">
    </div>

    <div id="tab4" dojoType="dijit.layout.ContentPane" title="eLearning" closable="true">
    GTAJava is not a job board or a job posting website but a pilot project  for employment orchestration , Training and Learning ,     It's a Web 2.0 application which provides wide variety of services. One of the key innovative functionality named as Vstar 
    ( Virtual Screening, Training Analysis & Recruitment) was developed  owing to problems faced by both employees as well as employers.
    
    </div>

    <div id="tab5" dojoType="dijit.layout.ContentPane" title="Training" closable="true">
     <jsp:include page="Training.jsp" />
    </div>

    <div id="tab6" dojoType="dijit.layout.ContentPane" title="Consultants" closable="true">
    </div>

    <div id="tab7" dojoType="dijit.layout.ContentPane" title="History" closable="true">
      <span id="cost">
      </span>
    </div>

    <div id="tab8" dojoType="dijit.layout.ContentPane" title="About Us" closable="false">
      <jsp:include page="Aboutus.jsp" />
    </div>



  </div>


  <div dojoType="dijit.layout.ContentPane" region="trailing" style="width:200px;" id="container1" border="2">
    <div 
        dojoType="dijit.Tooltip"
        connectId="emailme"
        label="Drag and Drop Jobs to cart then email them to your email id">






    </div>
    <b>
     <span id="emailme" class="ex2"> My Job List </span>
    </b>
    <span id="status">
    </span>
    <!-- Drop Down -->


    <div dojoType="dijit.form.DropDownButton" class="ex2">
      <span >
        Email This List
      </span>
      <form>
        <div dojoType="dijit.TooltipDialog" id="dialog1" title="Login Form" execute="checkPw(arguments[0]);">




          <table>
            <tr>
              <td>
               <span class="ex2">
                  Your name
                  </span>
              </td>
              <td>
                <input dojoType="dijit.form.TextBox" type="text" name="oldpw">
              </td>
            </tr>
            <tr>
              <td>
               <span class="ex2">
                  Email Id:
                 </span>
              </td>
              <td>
                <input 
                    type="text"
                    name="newpw"
                    id="newpw"
                    dojotype="dijit.form.ValidationTextBox"
                    regexpgen="dojox.validate.regexp.emailAddress"
                    required="true"
                    invalidmessage="Invalid Email Address.">



              </td>
            </tr>
            <tr>
              <td>
                <span class="ex2">
                  Confirm Email Id:
                </span>
              </td>
              <td>
                <input 
                    type="text"
                    name="confirmpw"
                    dojotype="dijit.form.ValidationTextBox"
                    regexpgen="dojox.validate.regexp.emailAddress"
                    required="true"
                    invalidmessage="Invalid Email Address.">



              </td>
            </tr>
            <tr>
              <td>
                <span class="ex2">
                  Email Subject (optional):
                </span>
              </td>
              <td>
                <input type="text" name="emailsub" dojotype="dijit.form.TextBox">
                <input type="hidden" id ="ipadd" name="ipadd" value="<%=request.getRemoteAddr()%>">
              </td>
            </tr>
                 
            <tr>
              <td>
            <input dojoType="dijit.form.RadioButton" id="val1" name="group1" 
          checked="checked" value="html" type="radio" />
    <span class="ex2"> HTML </span>
    <input dojotype="dijit.form.RadioButton" id="val2"  name="group1" 
            value="pdf" type="radio" />
    <span class="ex2"> PDF </span>
    <input dojotype="dijit.form.RadioButton" id="val3"  name="group1" 
                       value="xls" type="radio" />
    <span class="ex2"> EXCEL </span> 
            </td>
            </tr>
            
            <tr>
              <td>
                <input 
                    id="cb"
                    dojotype="dijit.form.CheckBox"
                    name="developer"
                    checked="false"
                    value="on"
                    type="checkbox"
                />
              </td>
              <td>
                <span class="ex2">
                  Accept Terms and Condition
                   </span>
              </td>
            </tr>


            <tr>
              <td colspan="2" align="center">
                <button dojoType="dijit.form.Button" type="submit">
                  Send
                </button>
              </td>

            </tr>
          </table>
        </div>
      </form>
    </div>


    <!-- Drop Down -->
    <!-- Drop Down Apply -->
    <!-- Drop Down Apply -->

    <div >
      <img src="img/cart.GIF" id="cart" alt="cart" width="50" height="56" />
      <span class="ex2" id="dragjobshere"></span>
    </div>
  </div>
  <div dojoType="dijit.layout.ContentPane" region="bottom">
    <img src="emailid.png" alt="" width="80" height="25" />
  </div>
</div>
</body>


<!--  Right click Menu Items -->
<ul dojoType="dijit.Menu" id="tree_menu" style="display: none;">
  <li dojoType="dijit.MenuItem" onClick= "showNote()" >
  Add Notes
</li>
<li dojoType="dijit.MenuItem" disabled="true">
Expert Learn
</li>
<li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconCopy" onClick= "myId('connect_to_recruiter')" >
Connect To Recruiter
</li>
<li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconCopy" onClick= "myId('discuss')" >
Discuss
</li>
<li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconPaste" onClick= "myId('training')" >
Training
</li>
<li dojoType="dijit.PopupMenuItem">
<span>
  Resume
</span>
<ul dojoType="dijit.Menu" id="submenu2">
  <li dojoType="dijit.MenuItem" onClick= "myId('apply_directly')">
  Apply Directly
</li>
<li dojoType="dijit.MenuItem" onClick= "myId('match')">
Match
</li>
<li dojoType="dijit.PopupMenuItem" >
<span>
  KeyWord Match
</span>
<ul dojoType="dijit.Menu" id="submenu4">
  <li dojoType="dijit.MenuItem" onClick= "myId('all_keywords')" >
  All Keywords
</li>
<li dojoType="dijit.MenuItem" onClick= "myId('specific_keywords')" >
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
  <li dojoType="dijit.MenuItem" disabled="true" onClick= "myId('download_resumes')" >
  Download Resumes
</li>
<li dojoType="dijit.MenuItem" disabled="true" onClick="myId('connect_to_candidates')" >
Connect to Candidates
</li>
<li dojoType="dijit.MenuItem" disabled="true" onClick= "myId('virtual_interview')" >
Virtual Interview
</li>
</ul>
</li>
</ul>

<!-- End of Right click Menu Items -->

<!-- Dialog box for information -->
<div id="dialogInfo" title="This feature is coming soon" dojoType="dijit.Dialog" closable="false">
 <div id="infodiv" dojoType="dijit.layout.ContentPane" width="50" height="50"> <p>Information Details</p></div>
 
</div>
<!-- end of Dialog box for information -->

<!-- Dialog box for Jobdetails -->
<div id="dialogJobDetails" title="Job Details" dojoType="dijit.Dialog" width="50" height="50">

       
</div>
<!-- end of Dialog box for Jobdetails -->

<!-- Editor for Notes -->
<div  id="dialogColor" title="Add Notes to This Job" dojoType="dijit.Dialog">
<form>
    <div dojoType="dijit.Editor" id="editor"
  plugins="['undo','redo','selectAll','|','bold','italic','underline','strikethrough','|','createLink']">
  <p>Add Notes to the Job </p>
</div>
<div align="center">

        <input 
             align="center"
            id="save"
            onClick="hideNote('save')"
            type="button"
            class="groovybutton"

            value="Save"
            onMouseOver="goLite(this.id)"

            onMouseOut="goDim(this.id)"/>
        <input 
             align="center"
            id="cancel"
             onClick="hideNote('cancel')"
            type="button"
            class="groovybutton"

            value="Cancel"


             onMouseOver="goLite(this.id)"

            onMouseOut="goDim(this.id)"/>


      </div>
</form>
</div>
<!-- End of Editor for Notes -->


</html>
