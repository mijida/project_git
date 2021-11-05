<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
EL에서는 각 영역에 저장된 속성을 읽어올 수 있는
xxxScope계열 내장 객체를 제공함.
즉 pageScope/requestScope/sessionScope/applicationScope


읽어 올때 : xxxxScope.속성명 혹은 xxxxScope["속성명"]
또한 xxxxScope는 생략가능,
생략시 가장 작은 영역에 있는값을 읽어옴	
*/	
//각 영역에 속성 저장(JSP의 기본 내장객체로)] 
pageContext.setAttribute("scopeVar", "페이지 영역");
request.setAttribute("scopeVar", "리퀘스트 영역");
session.setAttribute("scopeVar", "세션 영역");
application.setAttribute("scopeVar", "어플리케이션 영역");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectScope.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 xxxxScope계열 내장객체</legend>
		<h2>각 영역에 저장된 속성 읽기(xxxScope지정)</h2>
		<ul>
			<li>\${pageScope.scopeVar } : ${pageScope.scopeVar }</li>
			<li>\${requestScope.scopeVar } : ${requestScope.scopeVar }</li>
			<li>\${sessionScope['scopeVar'] } : ${sessionScope['scopeVar'] }</li>
			<li>\${applicationScope["scopeVar"] } : ${applicationScope["scopeVar"] }</li>
		</ul>
		
		<h2>각 영역에 저장된 속성 읽기(xxxScope미지정)</h2>
		<ul>
			<li>\${scopeVar } : ${scopeVar }</li>
			<li>\${scopeVar } : ${scopeVar }</li>
			<li>\${scopeVar } : ${scopeVar }</li>
			<li>\${scopeVar } : ${scopeVar }</li>
			
		</ul>
	</fieldset>
</body>
</html>
<jsp:forward page="InnerObjectScopeForwarded.jsp"/>  