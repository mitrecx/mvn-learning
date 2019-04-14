package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ActionServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		System.out.println(name);
		//登录成功，将一些数据绑定到session对象上
		if(name!=null && name.equals("mitre") && password.equals("mitre")) {
			HttpSession session=request.getSession();
			session.setAttribute("userName", name);
			response.sendRedirect("success.jsp");
		}else {
			request.setAttribute("loginFailed", "用户名或密码错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}
}
