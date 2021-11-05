<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ForwardExamProcess.jsp -->
<%
	//1]파라미터 받기
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	
	if("KIM".equals(user.trim()) && "1234".equals(pass.trim())){
		session.setAttribute("USER", user);		
		session.setAttribute("PASS", pass);

%>
	<jsp:forward page="ForwardExamMyPage.jsp"/>
<% } 
	else{
		request.setAttribute("NOTUSER", "회원이 아닙니다.");
%>
	<jsp:forward page="ForwardExamLogin.jsp"/>
<%
	}
%>