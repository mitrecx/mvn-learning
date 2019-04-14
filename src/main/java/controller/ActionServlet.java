package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import domain.Employee;

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
			
			String resource = "sqlConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession sSession = sqlSessionFactory.openSession();
			System.out.println("MyBatis show");

			List<Employee> list=sSession.selectList("findEmp");
			
			// 使用转发，将处理交给empList.jsp
			// 1. 绑定数据 (绑定 list 这个集合)
			request.setAttribute("emplist", list);
			// 2. 获得转发器
			RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
			// 3. 转发
			rd.forward(request, response);
		}else {
			request.setAttribute("loginFailed", "用户名或密码错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}
}
