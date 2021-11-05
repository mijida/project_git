<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="my" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RemoveTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>remove태그</legend>
		<!-- 각 영역에 JSTL을 이용해서 속성 저장 -->
		<my:set var="pagevar" value="페이지영역" />
		<my:set var="pagevar" value="리퀘스트영역1" scope="request" />
		<my:set var="requestvar" value="리퀘스트영역2" scope="request" />
		<my:set var="sessionvar" value="세션영역" scope="session" />
		<my:set var="applicationvar" value="어플리케이션영역" scope="application" />
		<h2>삭제 전 출력</h2>
		<ul>
			<li>pagevar : ${pagevar }</li>
			<li>pagevar : ${requestScope.pagevar }</li>
			<li>requestvar : ${requestvar }</li>
			<li>sessionvar : ${sessionvar }</li>
			<li>applicationvar : ${applicationvar }</li>
		</ul>
		<h2>속성명은 존재하나 영역이 다른 경우(에러 no,삭제 no)</h2>
		<my:remove var="requestvar" scope="session"/>
		<h2>영역이 다른 속성을 삭제 후 출력</h2>
		<ul>
			<li>pagevar : ${pagevar }</li>
			<li>pagevar : ${requestScope.pagevar }</li>
			<li>requestvar : ${requestvar }</li>
			<li>sessionvar : ${sessionvar }</li>
			<li>applicationvar : ${applicationvar }</li>
		</ul>
		<h2>동일한 속성명이 여러 영역에 존재하는 경우(scope미 지정시: 모두 삭제) 삭제 후 출력</h2>
		<my:remove var="pagevar"/>
		<ul>
			<li>pagevar : ${pagevar }</li>
			<li>pagevar : ${requestScope.pagevar }</li>
			<li>requestvar : ${requestvar }</li>
			<li>sessionvar : ${sessionvar }</li>
			<li>applicationvar : ${applicationvar }</li>
		</ul>
	</fieldset>
</body>
</html>