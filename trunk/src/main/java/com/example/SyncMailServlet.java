package com.example;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TempMailServlet
 */
public class SyncMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	/**
	 * change this to false before creating war for server
	 */
	private static boolean localMode = false;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SyncMailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String addr = request.getRemoteAddr(); // 123.123.123.123

		Map map = new HashMap();
		map.putAll(request.getParameterMap());
		//map.put("ip", addr);
		
		// Thread workerThread = new Thread(worker);
		// workerThread.start();
		String val = parseRequest(map);
		PrintWriter out = response.getWriter();
		out.write(val);
	}

	public String parseRequest(Map request) {

		String returnval = "Email Sent";
		try {
			// out.print("Starting");
			Iterator em = request.keySet().iterator();
			// out.print("iterator "+em.hasNext());
			String[] emailId = (String[]) request.get("emailid");
			// out.print(" email "+emailId);
			String[] name = (String[]) request.get("name");
			// out.print(" name "+name);
			String[] details = (String[]) request.get("details");
			// out.print(" details "+details);
			String[] subject = (String[]) request.get("subject");
			// out.print(" subject "+subject);
			String subjectStr = null;
			if (subject.length > 0)
				subjectStr = subject[0];
			else
				subjectStr = "Your Job List";
			String[] ip = (String[]) request.get("ipaddress");
			List jobs = formatMessage(details[0]);
			MyJobs[] jobsArray = (MyJobs[]) jobs.toArray(new MyJobs[0]);
		
			//used for testing will save the html file
			if(localMode) {
				save(jobsArray, emailId[0],
						ip[0], subjectStr);
			}else {
			send(jobsArray, emailId[0],
					ip[0], subjectStr);
			}
		} catch (Exception e) {

			e.printStackTrace();
			returnval = "" + e.getMessage();
			// out.print("return "+returnval);
		}
		return returnval;
	}

	public List formatMessage(String object) {
		List l = new ArrayList();
		String[] s = object.split("<###>");
		for (int i = 0; i < s.length; i++) {

			String totalStr = s[i];
			if (totalStr.trim().length() < 1)
				continue;
			MyJobs job = new MyJobs();
		
			job.setTitle(" Job Id : " + i);
			int index = totalStr.indexOf("<DIV");
			int last = totalStr.indexOf("</DIV");
			String hiddenInput = null;
			String hiddenInput1 = null;
			if ((index != -1) && (last != -1)){
				hiddenInput = totalStr.substring(index,last);				
				
			} 
			int anotherIndex = totalStr.indexOf("<DIV", last+1);
			int anotherEndIndex = totalStr.indexOf("</DIV", anotherIndex);
			if ((anotherIndex != -1) && (anotherEndIndex != -1)){
				hiddenInput1 = totalStr.substring(anotherIndex,anotherEndIndex);				
				
			}  
			if(hiddenInput.indexOf("nameDes") != -1) {
				job.setDetails(getValueFromHiddenField(hiddenInput));
				job.setLink(getLinkValueFromHiddenField(hiddenInput1));	
			}else {
				job.setDetails(getValueFromHiddenField(hiddenInput1));
				job.setLink(getLinkValueFromHiddenField(hiddenInput));
			}
			
			
			
			l.add(job);
		}
		return l;
	}
	
	public String getValueFromHiddenField(String input){
		
		input = input.replaceFirst("VISIBILITY: hidden", "VISIBILITY: visible");
		return input;
		
	}
	
	public String getLinkValueFromHiddenField(String input){
		
		input = input.substring(input.indexOf('>')+1);
		return input;
		
	}

	public void send(MyJobs jobs[], String to,
			String ip, String subjectStr) throws Exception {
		
		
		Message message = null;//GtaJavaMailerMessage.getMailMessage();		
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));		
		message.setSubject(subjectStr);		
		StringBuffer sb = collect(jobs, ip, subjectStr);
		//message.setDataHandler(new DataHandler(new ByteArrayDataSource(sb
			//	.toString(), "text/html")));
		// Send message\
		message.setDataHandler(new DataHandler(new HTMLDataSource(sb.toString())));
		Transport.send(message);

	}
	/**
	 * will be called only if localMode is true
	 * @param jobs
	 * @param to
	 * @param ip
	 * @param subjectStr
	 * @throws Exception
	 */
	public void save(MyJobs jobs[], String to,
			String ip, String subjectStr) throws Exception {
		
		
				
		StringBuffer sb = collect(jobs,  ip, subjectStr);
		
		try {    
		PrintStream out = new PrintStream(new FileOutputStream("c:/email.html"));    
		out.print(sb.toString());    
		out.close();
		} 
		catch (IOException e) {  
			e.printStackTrace();}
		

	}

	

	public StringBuffer collect(MyJobs jobs[],  String ip, String subjectStr)
			throws MessagingException, IOException {			
		StringBuffer sb = createHTMLBody(jobs, ip, subjectStr);
		return sb;
		
	}

	private StringBuffer createHTMLBody(MyJobs[] jobs,
			String ip, String subjectStr) {
		StringBuffer sb = new StringBuffer();
		sb.append("<HTML>\n");
		sb.append("<HEAD>\n");
		sb.append("<TITLE>\n");
		sb.append(subjectStr + "\n");
		sb.append("</TITLE>\n");
		sb.append("</HEAD>\n");

		sb.append("<BODY>\n");
		sb.append("<H1>" + subjectStr + "</H1>" + "\n");
		sb
				.append("<Table width='80%' style='background-color:lightgrey' border='1' cellpadding='2' cellspacing='0'>");

		Date date = new Date();
		String DATE_FORMAT = "EEE, d MMM yyyy HH:mm:ss Z";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String dateStr = sdf.format(date);

		addHeading(sb);

		for (int i = 0; i < jobs.length; i++) {
			sb.append("<tr>");

			sb.append("<td>");
			sb.append(jobs[i].title);
			sb.append("</td>");

			sb.append("<td><a href='");
			sb.append(jobs[i].link);
			sb.append("'> Click to view</a></td>");

			sb.append("<td>");
			sb.append(jobs[i].details);
			sb.append("</td>");

			sb.append("<td>");
			sb.append(dateStr);
			sb.append("</td>");

			sb.append("<td>");
			sb.append("None");
			sb.append("</td>");

			sb.append("<td>");
			sb.append("<p style='font: 14pt/14pt Garamond, Georgia, serif;color:red;'>0%</p>");
			sb.append("</td>");

			
			sb.append("</tr>");

		}

		sb.append("</Table>");
		addFooter(sb, ip);
		return sb;
	}

	public void addHeading(StringBuffer sb) {
		sb.append("<tr>");

		sb.append("<th>");
		sb.append("<p style='font: 10pt/10pt Arial Sans-serif;color:red;font-style:bold'>Job Number </p>");
		sb.append("</th>");

		sb.append("<th>");
		sb.append("<p style='font: 10pt/10pt Arial Sans-serif;color:red;font-style:bold'>Link </p>");
		sb.append("</th>");

		sb.append("<th>");
		sb.append("<p style='font: 10pt/10pt Arial Sans-serif;color:red;font-style:bold'>Details </p>");
		sb.append("</th>");

		sb.append("<th>");
		sb.append("<p style='font: 10pt/10pt Arial Sans-serif;color:red;font-style:bold'>Date </p>");
		sb.append("</th>");

		sb.append("<th>");
		sb.append("<p style='font: 10pt/10pt Arial Sans-serif;color:red;font-style:bold'>Notes </p>");
		sb.append("</th>");
		
		sb.append("<th>");
		sb.append("<p style='font: 10pt/10pt Arial Sans-serif;color:red;font-style:bold'>Resume Match </p>");
		sb.append("</th>");
		
		sb.append("</tr>");
	}

	public void addFooter(StringBuffer sb, String ip) {
		sb.append("<br><br>");
		sb.append("<table>");

		sb.append("<tr>");
		sb.append("<td><a href='www.gtajava.com'>www.gtajava.com</a></td>");
		sb.append("</tr>");
		sb.append("<tr>");
		sb.append("<td>Requested IP: " + ip);
		sb.append("</td>");		
		sb.append("</tr>");

		sb.append("<tr>");
		sb.append("<td><DIV width='80%' style='background-color:lightgrey' border='1' ><p style='font: 14pt/20pt Garamond, Georgia, serif;color:red;font-style:bold'>Buy This Space , Spnosor Us </p> </DIV>");
		sb.append("</td>");		
		sb.append("</tr>");
		
		sb.append("<table>");
		sb.append("</BODY>\n");
		sb.append("</HTML>\n");
	}

	

}
