<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.example.TempJSPPageBean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="/WEB-INF/cachetag.tld" prefix="cache" %> 

<title>Insert title here</title>

</head>
<body>

<cache:Cache refresh="6000" 
scope="application" key="abc"> 

  <html> 
  <% 
   TempJSPPageBean bean = new TempJSPPageBean();
    out.println(bean.getNewDate()); 
  %> 
  </html> 

</cache:Cache> 


</body>
</html>