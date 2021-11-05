<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ActionTagPage.jsp -->

<%
	String actionTagString = "액션태그로 삽입된 페이지 안에서 선언한 변수";	

%>
<hr/>
<h4>ActionTagPage.jsp페이지입니다</h4>
<ul>
	<li>페이지 영역:<%=pageContext.getAttribute("pageVar") %></li>
	<li>리퀘스트 영역:<%=request.getAttribute("requestVar") %></li>
</ul>
