<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.net.Authenticator"%>



<%@page import="java.net.PasswordAuthentication"%>
<%@taglib uri="/WEB-INF/rssutils.tld" prefix="rss"%>
<%@ taglib uri="/WEB-INF/cachetag.tld" prefix="cache" %> 
<%@page import="com.example.TempJSPPageBean"%><head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
 <%!
                         boolean MASTERFLAG = true; //switiching this off will switch off everything even if they are true
 
                         boolean URL1FLAG = MASTERFLAG && true;
                         boolean workopolis =MASTERFLAG && true;
                         boolean wowjobs = MASTERFLAG && true;
                         boolean eluta = MASTERFLAG && true;
                         boolean simplyhired =MASTERFLAG && true;
                         boolean URL6Flag = MASTERFLAG && true;
                         
                         
                        // String URL1 = "http://www.simplyhired.ca/a/job-feed/rss/q-java/l-toronto";
                       //  String URL2 = "http://www.workopolis.com/rss.aspx?action=transfer&view=content/jobseeker/jobsearchviewrss&id=61810298";                         
                       //  String URL3 = "http://www.eluta.ca/rss?q=java+sort%3arank+location%3atoronto#";                         
                       //  String URL4 = "http://www.wowjobs.ca/wowrss.aspx?q=java&l=toronto&s=&sr=50&t=30&f=r&e=&si=a&dup=h";                         
                       //  String URL5 = "http://canada.jobisjob.com/rss?what=java&where=toronto";
                       //  String URL6 = "http://twitter.com/statuses/user_timeline/21480146.rss";
                        
                         String URL1 = "http://localhost:8080/NewTomcat5Project/MyRSS.xml";
                        String URL2 = "http://localhost:8080/NewTomcat5Project/SimlyHiredRss.xml";
                        String URL3 = "http://localhost:8080/NewTomcat5Project/Woropolis.xml";
                        String URL4 = "http://localhost:8080/NewTomcat5Project/MyRSS.xml";
                        String URL5 = "http://localhost:8080/NewTomcat5Project/MyRSS.xml";
                        String URL6 = "http://localhost:8080/NewTomcat5Project/MyRSS.xml";
                        
                        
                        
                    
   %>
  
  <cache:Cache refresh="600" 
scope="application" key="FeedSet1"> 
          
<div 
                                dojoType="dijit.layout.SplitContainer"
                                orientation="vertical"
                                sizerWidth="10"
                                activeSizing="true"
                                style="width: 700px; height: 500px;">





                              <div 
                                  dojoType="dijit.layout.SplitContainer"
                                  orientation="horizontal"
                                  sizerWidth="10"
                                  activeSizing="true"
                                  style="width: 700px; height: 180px;">



                                
                                <div dojoType="dijit.layout.ContentPane" sizeMin="5" sizeShare="5" >
                                        <div id="wishlistNode">
                                         </div>
		  
                                      <script type="dojo/method">
                                            fetchForPage(1,0,'wishlistNode');
                                      </script>
                                </div>
          
                               <div dojoType="dijit.layout.ContentPane" sizeMin="5" sizeShare="5" >
                                        <div id="wishlistNode1">
                                         </div>
		  
                                      <script type="dojo/method">
                                            fetchForPage(1,1,'wishlistNode1');
                                      </script>
                                </div>
                                
                                
                                
                                <div dojoType="dijit.layout.ContentPane" sizeMin="5" sizeShare="5" >
                                        <div id="wishlistNode2">
                                         </div>
		  
                                      <script type="dojo/method">
                                            fetchForPage(1,2,'wishlistNode2');
                                      </script>
                                </div>
                                
                                 
                              </div> <!-- Botton split pane -->
                              <div 
                                  dojoType="dijit.layout.SplitContainer"
                                  orientation="horizontal"
                                  sizerWidth="10"
                                  activeSizing="true"
                                  style="width: 700px; height: 245px;">






                               <div dojoType="dijit.layout.ContentPane" sizeMin="5" sizeShare="5" >
                                        <div id="wishlistNode3">
                                         </div>
		  
                                      <script type="dojo/method">
                                            fetchForPage(1,3,'wishlistNode3');
                                      </script>
                                </div>
                                
                                
                                <div dojoType="dijit.layout.ContentPane" sizeMin="5" sizeShare="5" >
                                        <div id="wishlistNode4">
                                         </div>
		  
                                      <script type="dojo/method">
                                            fetchForPage(1,4,'wishlistNode4');
                                      </script>
                                </div>
                                
                               <div dojoType="dijit.layout.ContentPane" sizeMin="5" sizeShare="5" >
                                        <div id="wishlistNode5">
                                         </div>
		  
                                      <script type="dojo/method">
                                            fetchForPage(1,5,'wishlistNode5');
                                      </script>
                                </div>
                                

                              </div> <!-- End of bottom split pane -->
                            </div>
    </cache:Cache> 
                            

</body>

