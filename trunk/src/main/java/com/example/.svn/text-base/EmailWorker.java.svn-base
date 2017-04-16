package com.example;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailWorker implements Runnable {

	Map request;

	public EmailWorker(Map request) {
		this.request = request;
	}

	
	public void run() {
		//parseRequest();
	}

	public String parseRequest(PrintWriter out) {
		 
		String returnval = "Mostly Done";
		try {
			out.print("Starting");
		Iterator em = request.keySet().iterator();
			out.print("iterator "+em.hasNext());
		String emailId = (String) request.get("emailid");
		out.print(" email "+emailId);
		String name = (String) request.get("name");
		out.print(" name "+name);
		String details = (String) request.get("details");
		out.print(" details "+details);
		String subject = (String) request.get("subject");
		out.print(" subject "+subject);
		String subjectStr = subject;
		//if(subject.length > 0)
			//subjectStr = subject[0];
		//else
			//subjectStr = "Your Job List";	
		String ip = (String) request.get("ip");
		List jobs = formatMessage(details);
		MyJobs[] jobsArray = (MyJobs[]) jobs.toArray(new MyJobs[0]);
		StringBuffer sb = createHTMLBody(jobsArray, "Your job List", ip,subjectStr);
		out.print(sb);
		//send(jobsArray, "relay-hosting.secureserver.net", "admin@gtajava.com", emailId, ip, subjectStr);
		
		out.print("sending ");
			send(jobsArray, "relay-hosting.secureserver.net", "admin@gtajava.com", emailId, ip, subjectStr);
		} catch (Exception e) {

			e.printStackTrace();
			returnval = ""+e.getMessage();
			out.print("return "+returnval);
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
			int index = totalStr.indexOf("<A href");
			job.setTitle(" Job Id : " + i);
			if (index != -1) {
				String link = totalStr.substring(index);
				System.out.println(link);
				job.setLink(link);
				job.setDetails(totalStr.substring(0, index));
			} else {
				job.setDetails(totalStr);
				job.setLink("");
			}
			l.add(job);
		}
		return l;
	}

	public void send(MyJobs jobs[], String host, String from, String to,
			 String ip,String subjectStr) throws Exception {
		// Get system properties
		Properties props = System.getProperties();

		// Setup mail server
		props.put("mail.smtp.host", host);

		// Get session
		Session session = Session.getDefaultInstance(props, null);

		// Define message
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		message.setSubject(subjectStr);
		collect(jobs, message, ip,subjectStr);

		// Send message
		Transport.send(message);

	}

	public void collect(MyJobs jobs[], Message msg, String ip,String subjectStr)
			throws MessagingException, IOException {
		String line;
		String subject = msg.getSubject();
		StringBuffer sb = createHTMLBody(jobs, subject, ip,subjectStr);

		//msg.setDataHandler(new DataHandler(new ByteArrayDataSource(sb
			//	.toString(), "text/html")));
		msg.setDataHandler(new DataHandler(new HTMLDataSource(sb.toString())));

	}

	private StringBuffer createHTMLBody(MyJobs[] jobs, String subject, String ip, String subjectStr) {
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
				.append("<Table width='80%' style='background-color:white' border='1' cellpadding='2' cellspacing='0'>");

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

			sb.append("<td>");
			sb.append(jobs[i].link);
			sb.append("</td>");

			sb.append("<td>");
			sb.append(jobs[i].details);
			sb.append("</td>");

			sb.append("<td>");
			sb.append(dateStr);
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
		sb.append("Job Number");
		sb.append("</th>");

		sb.append("<th>");
		sb.append("Link");
		sb.append("</th>");

		sb.append("<th>");
		sb.append("Details");
		sb.append("</th>");

		sb.append("<th>");
		sb.append("Date");
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
		sb.append("<td>Requested IP: "+ip);
		sb.append("</td>");
		sb.append("</tr>");

		sb.append("<table>");
		sb.append("</BODY>\n");
		sb.append("</HTML>\n");
	}

}
