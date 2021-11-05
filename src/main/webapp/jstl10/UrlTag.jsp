<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UrlTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>url태그</legend>
		<h2>var속성 미지정</h2>
		<c:url value="/jstl10/ImportedPage.jsp">
			<c:param name="user" value="KIM"/>
			<c:param name="pass" value="1234"/>
		</c:url>
		<h2>var속성 지정</h2>
		<c:url value="/jstl10/ImportedPage.jsp" var="url">
			<c:param name="user" value="KIM"/>
			<c:param name="pass" value="1234"/>
		</c:url>
		<h2>내가 원하는 위치에서 URL사용</h2>
		<a href="${url }">ImportedPage.jsp</a>
		<h2>HTML태그 안에서 JSTL로 절대경로 지정</h2>
		<a href="<c:url value="/jspl10/ImportedPage.jsp?user=PARK&pass=9999"/>">ImportedPage.jsp</a>
	</fieldset>
</body>
</html>