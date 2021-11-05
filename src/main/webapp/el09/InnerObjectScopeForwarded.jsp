<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectScopeForwarded.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 xxxScope계열 내장객체(포워드된 페이지)</legend>
		<h2>자바코드(스크립팅 요소)로 각 영역에 저장된 속성 읽기</h2>
		<ul>
			<li>페이지 영역: <%=pageContext.getAttribute("scopeVar") %></li>
			<li>리퀘스트 영역: <%=request.getAttribute("scopeVar") %></li>
			<li>세션 영역: <%=session.getAttribute("scopeVar") %></li>
			<li>어플리케이션 영역: <%=application.getAttribute("scopeVar") %></li>
		</ul>
		
		<h2>EL로 각 영역에 저장된 속성 읽기</h2>
		<ul>
			<li>페이지 영역: ${pageScope.scopeVar}</li>
			<li>리퀘스트 영역: ${requestScope.scopeVar}</li>
			<li>세션 영역: ${sessionScope['scopeVar']}</li>
			<li>어플리케이션 영역: ${applicationScope["scopeVar"]}</li>
		</ul>
	</fieldset>
<!--  
[EL]
영역 읽어올때:scope계열 (setAttribute로 저장)
파라미터 가져올때:param.으로 접근 (=getparameter)
-->
</body>
</html>