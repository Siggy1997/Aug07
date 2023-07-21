<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="./resources/css/login.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<br>
	<div class="form">
		<form action="./login" method="post">
			<span></span> <span></span> <span></span> <span></span>
			<div class="form-inner">
				<h2>LOGIN</h2>
				<div class="content">
					<input class="input" name="id" type="text" placeholder="Username" />
					 <input
						class="input" name="pw" type="password" placeholder="Password" />
					<button class="btn">LOGIN</button>
				</div>
			</div>
	</form>
	</div>

</body>
</html>