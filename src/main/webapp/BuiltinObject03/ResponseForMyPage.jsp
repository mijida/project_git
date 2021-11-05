<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseForMyPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>마이페이지</legend>
		<ul>
			<li>아이디 : <%=request.getParameter("username") %></li>
			<li>비밀번호 : <%=request.getParameter("password") %></li>
			
		</ul>
	</fieldset>
</body>
</html>