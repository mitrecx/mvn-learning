<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="domain.*,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录成功</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
<script type="text/javascript" src="./js/jquery-3.4.0.js"></script>
</head>
<body>
	<%
		Object obj = session.getAttribute("userName");
		if (obj == null) {
			response.sendRedirect("index.jsp");
			return;
		}
		List<Employee> emps = (List<Employee>) request.getAttribute("emplist");
		int infoCount = (Integer) request.getAttribute("infoCount");
		int ic2=emps.size();
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
		<c:forEach items="${requestScope.emplist}" var="e">
			<tr>
				<td><c:out value="${e.id}"/></td>
				<td><c:out value="${e.name}"/></td>
				<td><c:out value="${e.age}"/></td>
				<td><c:out value="${e.salary}"/></td>
				<td><a href="delete?id=666">删除</a> <a href="load?id=666">修改</a></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		总数:
		<c:out value="${infoCount }"></c:out></p>
	<p id="totalNum">total:</p>
	<button type="button" onclick="nextPage();">上一页</button>
	<button type="button">下一页</button>

	<script type="text/javascript">
		function nextPage() {
			$("#totalNum").html("xxxxx");
		}
	</script>
</body>
</html>