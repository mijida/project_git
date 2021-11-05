<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ForwardExamLogout.jsp -->

<%
	session.invalidate();
	response.sendRedirect("ForwardExamLogin.jsp");
%>