<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="domain.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
	<% 
		Object obj=session.getAttribute("userName");
		if(obj==null){
			response.sendRedirect("index.jsp");
			return;
		}
	%>

	
		<h3>员工信息</h3>
		<table border="1" width="60%" cellpadding="0" cellspacing="0">
			<tr>
				<td>ID</td>
				<td>姓名</td>
				<td>年龄</td>
				<td>薪水</td>
				<td>操作</td>
			</tr>
			<%
				List<Employee> emps=(List<Employee>)request.getAttribute("emplist");
				for(int i=0;i<emps.size();i++){
					Employee e=emps.get(i);
			%>
					<tr class="row<%= (i%2+1) %>">
						<td><%=e.getId() %></td>
						<td><%=e.getName() %></td>
						<td><%=e.getAge() %></td>
						<td><%=e.getSalary() %></td>
						<td><a href="delete?id=<%= e.getId() %>" onclick="return confirm('是否确认删除<%= e.getName() %>>');">删除</a>
						    <a href="load?id=<%=e.getId() %>&name=<%=e.getName()%>&age=<%=e.getAge()%>&salary=<%=e.getSalary()%>" >修改</a></td>
					</tr>
			<%
				}
			%>
		</table>
	
</body>
</html>