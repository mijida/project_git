<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DirectivePage.jsp (include지시어) -->
<%
 	//독립적인 서블릿으로 변환 안됨
 	//페이지에 포함되니까 같은 페이지다. 
 	
 	//변수선언
 	String directiveString = "지시어로 삽입된 페이지 안에서 선언한 변수";
%>
<hr/>
<h4>DirectivePage.jsp페이지입니다</h4>
<ul>
	<li>페이지 영역:<%=pageContext.getAttribute("pageVar") %></li>
	<li>리퀘스트 영역:<%=request.getAttribute("requestVar") %></li>
</ul>