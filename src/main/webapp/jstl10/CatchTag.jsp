<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CatchTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>catch태그</legend>
		<c:set var="fnum" value="100"/>
		<c:set var="snum" value="0"/>
		<h2>에러가 안나는 경우:에러내용 저장 안됨</h2>
		<c:catch var="error">
		\${fnum/snum } : ${fnum/snum }
		</c:catch>
		\${error } : ${error }
		<h2>에러가 나는 경우:에러내용 저장됨</h2>
		<c:catch var="error">
		\${"백"+100 } : ${"백"+100 }
		</c:catch>
		\${error } : ${error }
		<h2>JSTL문법 오류는 CATCH가 안됨</h2>
		<c:choose>
			<!-- 주석 -->
			<c:when test="true">
			참이다
			</c:when>
		</c:choose>
	</fieldset>
</body>
</html>