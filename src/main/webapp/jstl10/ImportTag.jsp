<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImportTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>import태그</legend>
		<!-- jsp:include 액션태그와 같다. request영역 공유(리퀘스트 하나) -->
		<c:set scope="request" value="리퀘스트 영역" var="requestvar"/>
		<h2>var속성 미지정.현재 위치에 바로 삽입됨(include액션태그와 같다)</h2>
		<c:import url="ImportedPage.jsp" >
			<c:param name="user" value="PARK"/>
			<c:param name="pass" value="1234"/>
		</c:import>
		<h2>var속성 지정.원하는 위치에 삽입하고자 할 때</h2>
		<c:import url="ImportedPage.jsp" var="content">
			<c:param name="user" value="PARK"/>
			<c:param name="pass" value="1234"/>
		</c:import>
		<h3>아래에 import된 페이지 내용 출력</h3>
		${content }
		<h2>외부에 있는 컨텐츠 삽입</h2>
		<%-- 
		<c:import url="https://www.nate.com"/>
		--%>
		<iframe src="ImportedNate.jsp" style="border:none;width:100%;height:500px"></iframe>
	</fieldset>
</body>
</html>