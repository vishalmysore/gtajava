package com.example;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailServlet
 */
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
		PrintWriter out = response.getWriter();
		String location = request.getHeader("referer");
		String host = request.getRemoteHost(); 
		out.write("Referer "+location);
		out.write(" host "+host);
		out.write(" Operation Not Supported as of now !!!");
	}

	public boolean checkOrginatingLocation(String location,String host) {
		return true;
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {		
		System.out.println("Here");
		String location = request.getHeader("referer");
		String host = request.getRemoteHost(); // hostname.com
		System.out.println("Here");
		PrintWriter out = response.getWriter();
		
		if (!checkOrginatingLocation(location,host)) {
			out.write("Please submit request througth www.GTAJava.com");
		} else {	
			String addr = request.getRemoteAddr(); // 123.123.123.123
			
			Map map = new HashMap();
			map.putAll(request.getParameterMap());
			map.put("ip", addr);
			EmailWorker worker = new EmailWorker(map);
			//Thread workerThread = new Thread(worker);
			//workerThread.start();
			worker.parseRequest(out);
			out.write("Email Sent again");
		}

	}

}

