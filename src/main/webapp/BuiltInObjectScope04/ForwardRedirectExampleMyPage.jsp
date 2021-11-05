<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardRedirectExampleMyPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>마이페이지</legend>
		<h2>리퀘스트 영역에서 읽어오기</h2>
		<ul>
			<li>아이디:<%=request.getAttribute("id") %></li>
			<li>비밀번호:<%=request.getAttribute("pwd") %></li>
		</ul>
		<h2>파라미터로 읽어오기:포워드로 이동시킨 경우</h2>
		<ul>
			<li>아이디:<%=request.getParameter("id") %></li>
			<li>비밀번호:<%=request.getParameter("pwd") %></li>
		</ul>
	</fieldset>
</body>
</html>