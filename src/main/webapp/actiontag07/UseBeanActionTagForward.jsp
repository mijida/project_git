<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanActionTagForward.jsp</title>
</head>
<body>
<!-- 
	자바코드(스크립팅요소)에서 사용한 인스턴스 변수 useBean액션태그에서 사용불가
	반대는 사용가능
 -->
 	<%--MemberDTO member = (MemberDTO)request.getAttribute("member"); --%>
 	<%--=member.getName() --%>
 	<%-- 에러
 	<jsp:getProperty property="id" name="member"/>
 	--%>
 	<jsp:useBean id="member" scope="request" type="model.MemberDTO"></jsp:useBean>
 	<h2>액션 태그로 읽어오기</h2>
 	<ul>
 		<li>아이디:<jsp:getProperty property="id" name="member"/></li>
 		<li>비밀번호:<jsp:getProperty property="pwd" name="member"/></li>
 		<li>이름:<jsp:getProperty property="name" name="member"/></li>
 		<li>나이:<jsp:getProperty property="age" name="member"/></li>
 	</ul>
 	 	<h2>자바코드(스크립팅 요소)로 읽어오기</h2>
 	<ul>
 		<li>아이디:<%=member.getId() %></li>
 		<li>비밀번호:<%=member.getPwd() %></li>
 		<li>이름:<%=member.getName() %></li>
 		<li>나이:<%=member.getAge() %></li>
 	</ul>

</body>
</html>