<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardActionTagResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>각 영역에 저장된 속성 읽기</legend>
		<ul>
			<li>페이지 영역:<%=pageContext.getAttribute("pageVar") %></li>
			<li>리퀘스트 영역:<%=request.getAttribute("requestVar") %></li>
		</ul>
	</fieldset>
</body>
</html>