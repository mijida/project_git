<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글
request.setCharacterEncoding("UTF-8");
//리퀘스트 영역에 객체 저장
	request.setAttribute("member", new MemberDTO("KIM","1234","김길동",null,"20"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamActionTagInclude.jsp</title>
</head>
<body>
	<fieldset>
		<legend>삽입하는 페이지에 파라미터 전달</legend>
		<jsp:include page="IncludePage.jsp">
			<jsp:param value="PARK" name="id"/>
			<jsp:param value="박길동" name="name"/>
			<jsp:param value="쿼리스트링" name="query"/>
		</jsp:include>
	</fieldset>
</body>
</html>