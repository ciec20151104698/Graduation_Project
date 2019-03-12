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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		request.setCharacterEncoding("utf-8");
		UserBean register_info = new UserBean();
		PrintWriter out = response.getWriter();
		 
		register_info.setLogin_id(request.getParameter("register_id"));
		register_info.setLogin_pwd(request.getParameter("register_pwd"));
		String register_repwd = request.getParameter("register_repwd");
		String register_pwd = request.getParameter("register_pwd");
		register_info.setLogin_sex(request.getParameter("register_sex"));
		register_info.setLogin_age(request.getParameter("register_age"));
		register_info.setLogin_name(request.getParameter("register_name"));
		register_info.setLogin_email(request.getParameter("register_email"));
		register_info.setLogin_telephone(request.getParameter("register_telephone"));
		System.out.println();
		if(register_pwd.equals(register_repwd)) {
			UserService checkidservice = new UserService();
			String checkstring = checkidservice.CheckRegisterId(register_info.getLogin_id());
			if(checkstring == "YES") {
				UserService addregisterinfo = new UserService();
				addregisterinfo.AddRegisterInfo(register_info);
				
				System.out.println(register_info.getLogin_name());
				
				out.print("<script type='text/javascript'>");
				out.print("alert('注册成功~~(ﾉ´▽｀)ﾉ♪');");
				request.getSession().setAttribute("USERINFO",register_info);
				out.print("window.location='index.jsp';");
				out.print("</script>");
			}else {
				out.print("<script type='text/javascript'>");
				out.print("alert('用户名重复啦(；′⌒`)换一个吧');");
				out.print("window.location='register.jsp';");
				out.print("</script>");
			}
			
		}else {
			out.print("<script type='text/javascript'>");
			out.print("alert('两次密码不一致,重新来过吧o(╥﹏╥)o');");
			out.print("window.location='register.jsp';");
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
