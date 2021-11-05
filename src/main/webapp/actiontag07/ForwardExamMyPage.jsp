<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardExamMyPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>forward액션태그-마이페이지</legend>
		<h2>세션영역에서 가져오기</h2>
		<ul>
			<li>아이디:<%=session.getAttribute("USER")%></li>
			<li>비번:<%=session.getAttribute("PASS")%></li>
		</ul>
		<h2>파라미터로 가져오기</h2>
		<ul>
			<li>아이디:<%=request.getParameter("user")%></li>
			<li>비번:<%=request.getParameter("pass")%></li>
		</ul>
		<a href="ForwardExamLogout.jsp">로그아웃</a>
	</fieldset>
</body>
</html>