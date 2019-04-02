package com.cp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cp.bean.UserBean;
import com.cp.service.CommunicationService;

/**
 * Servlet implementation class ContentIssueServlet
 */
@WebServlet("/ContentIssueServlet")
public class ContentIssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentIssueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String main_title = request.getParameter("title");
		String main_content = request.getParameter("submitcontent");
		PrintWriter out = response.getWriter();
		
		System.out.println(main_content);
		
		UserBean user = (UserBean)request.getSession().getAttribute("USERINFO");
		CommunicationService contentadd = new CommunicationService();
		String temp = "";
		temp = contentadd.content_add(user.getLogin_id(),main_title,main_content);
		if(temp=="YES") {
			response.sendRedirect("page/communication_index/noteList.jsp");
		}else {
			out.print("<script type='text/javascript'>");
			out.print("alert('ERROR');");
			out.print("window.location='page/communication_index/issue.jsp';");
			out.print("</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
