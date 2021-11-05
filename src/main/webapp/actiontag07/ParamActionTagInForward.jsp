<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ParamActionTagInForward.jsp -->

<% 
	request.setCharacterEncoding("UTF-8");

	String pageUrl="ForwardedPage.jsp?query=쿼리스트링";
	String paramValue="KOSMO";
	//리퀘스트 영역에 객체 저장
	request.setAttribute("member", new MemberDTO("KIM","1234","김길동",null,"20"));
	
%>
<jsp:forward page="<%=pageUrl %>">
	<jsp:param value="코스모" name="name"/>
	<jsp:param value="<%=paramValue %>" name="id"/>
</jsp:forward>