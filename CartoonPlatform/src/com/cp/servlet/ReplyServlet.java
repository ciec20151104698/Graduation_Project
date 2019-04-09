package com.cp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cp.bean.UserBean;
import com.cp.service.CommunicationService;

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/ReplyServlet")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyServlet() {
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
		String reply_content = request.getParameter("reply_content");
		String host_article_id = (String)request.getSession().getAttribute("HOSTARTICLEID");
		//System.out.println(host_article_id+"servlet");
		UserBean user = (UserBean)request.getSession().getAttribute("USERINFO");
		
		
		CommunicationService replyadd = new CommunicationService();
		String temp = "";
		temp = replyadd.reply_add(host_article_id,user.getLogin_id(),user.getLogin_name(),reply_content);
		if(temp=="YES") {
			response.sendRedirect("page/communication_index/kownledge/communication_index.jsp");
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
