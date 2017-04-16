<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.UUID"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%><html>
<head>
<%@taglib uri="/WEB-INF/rssutils.tld" prefix="rss"%>
<%@ taglib uri="/WEB-INF/cachetag.tld" prefix="cache" %> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
                      
 
                         boolean URL1FLAG;  
                         String URL1;
                         String feedId;
                      
                       
                        
                    
   %>
   <%
 synchronized (this) {   
    String qString = request.getQueryString();
   
   String[] params = qString.split("&");   
   Map<String, String> map = new HashMap<String, String>();   
   for (String param : params)   
   {   
       String name = param.split("=")[0];   
       String value = param.split("=")[1];   
       map.put(name, value);   
   }   

    URL1 =(String) map.get("url");
    URL1FLAG = Boolean.valueOf((String)map.get("show"));
    feedId = (String)map.get("id");
    feedId = feedId+(String)map.get("suffix");
   
    //URL1 =(String) request.getParameter("url");
   // URL1FLAG = Boolean.valueOf((String)request.getParameter("show"));
   // feedId = (String)request.getParameter("id");
   //out.print("<span style='height: 1px; width: 1px '>"+qString+"</span>");
 //  out.print(URL1FLAG);
  // out.print(feedId);
 }
   %>

          
       <%if(URL1FLAG){
                            	  
                            	   %>
                                  <rss:feed 
                                      url="<%= URL1 %>"
                                      feedId="<%=feedId%>"
                                  />
                             
                                    <span class="ex2">  
                                      <rss:channelTitle feedId="<%=feedId%>"/>
                                    </span>
                             
                                  
                                  <% }%> 
                                  <div 
                                      dojoType="dijit.Tooltip"
                                      connectId="<%=feedId%>"
                                      label="Drag and Drop the Job to MyJobs Cart">

                                  </div>

                                  <div 
                                      dojoType="dijit.Tooltip"
                                      connectId="cart"
                                      label="Drag and Drop the Job to This Cart">

                                  </div>

                                  <div dojoType="dojo.dnd.Source" jsId="sourceData" class="source" id="<%=feedId%>">
                                   
                                 <%if(URL1FLAG){ %>
                                    
                                    <rss:forEachItem feedId="<%=feedId%>">
                                   
                                          
                                         
                                      
                                      <div class="dojoDndItem" dndType="v" style="background-color: lightgrey;" onmouseover="changeImage()" onmouseout="changeImageBack()" onclick="showJobDetails(this)">
                                           
                                        <div name="nameDes" style="visibility: hidden; height: 5px">
                                           <rss:itemDescription feedId='<%=feedId%>'/> <br>
                                           <rss:itemTitle  feedId="<%=feedId%>" />
                                        </div>
                                        <div name="nameLink" style="visibility: hidden; height: 5px">
                                           <rss:itemLink feedId='<%=feedId%>'/>
                                        </div>
                                        
                                        <rss:itemTitle  feedId="<%=feedId%>" />                                        
                                        
                                        <!-- <a href="<rss:itemLink feedId='<%=feedId%>'/>">
                                          click
                                       </a> -->
                                        <span class="ex2">
                                          Click Or Drag This Job
                                        </span>
                                        <br>
                                       
                                        
                                      </div>
                                          
                                      <br>

                                    </rss:forEachItem>
                                    <%
                                    } else {
                                    	out.print("Currently Not Available");
                                    }
                                 
                                  %>
                                  </div>
                                
       
   

</body>
</html>