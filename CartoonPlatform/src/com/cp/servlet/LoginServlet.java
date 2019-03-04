package com.cp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cp.bean.UserBean;
import com.cp.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		UserBean loginuser = new UserBean();
		loginuser.setLogin_id(request.getParameter("login_id"));
		loginuser.setLogin_pwd(request.getParameter("login_pwd"));
		
		//System.out.println(request.getParameter("login_id"));
		//System.out.println(request.getParameter("login_pwd"));
		
		String checkstring = "";
		UserService idcheck = new UserService();
		checkstring = idcheck.checkuserid(loginuser);
		
		//System.out.println(checkstring);
		
		if(checkstring == "YES") {
			UserService supplementinfo = new UserService();
			UserBean userinfo = supplementinfo.selectinfo(loginuser.getLogin_id());
			request.getSession().setAttribute("USERINFO",userinfo);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			out.print("<script type='text/javascript'>");
			out.print("alert('用户名或密码错误o(╥﹏╥)o再检查一下吧');");
			out.print("window.location='login.jsp';");
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
