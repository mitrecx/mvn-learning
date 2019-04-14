<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>

	<head>
		<title>登录</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>

	<body>
		<h1>Maven 学习账号登录(默认账号密码 mitre)</h1>
		<% String msg=(String)request.getAttribute("loginFailed") ;%>
		<span style="color:red;"><%= msg==null ? "" : msg %></span>
		
		<!-- onsubmit 是表单提交事件，点击提交时触发。提交表单前先调用 onsubmit 中的方法，只有方法返回 true 才提交表单-->
		<form action="./login.do" onsubmit="return checkName()" method="post">
			<h1>登录</h1>
			<p>
				账号：<input id="name" name="name" type="text" onblur="checkName();"/>
				<span id="nameMsg">3-20 位 字母、数字、下划线</span>
			</p>
			<p>
				密码：<input name="password" type="password" />
				<span id="passwordMsg" hidden="true">请输入密码</span>
			</p>
			<div>
				<input type="submit" value="登录"/>
			</div>
		</form>


		<script>
			//校验用户名
			function checkName () {
				//获取账号文本框
				var input=document.getElementById("name");
				//获取账号提示span
				var span=document.getElementById("nameMsg");
				//获取文本框的值
				var name = input.value;
				var re = /^\w{3,20}$/;
				//若不匹配，把span样式改一下
				if(!re.test(name)){
					//className 等价于元素的 class属性
					span.className="errorMsg";
					return false;
				}else{
					span.className=""; //匹配上需要移除错误样式
					return true;
				}
			}
			
		</script>

	</body>

</html>
