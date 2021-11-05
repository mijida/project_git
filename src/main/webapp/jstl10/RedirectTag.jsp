<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- RedirectTag.jsp -->
<!-- 리퀘스트 영역에 속성 저장 -->
<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>
<!-- 자바코드로 리다이렉트 -->
<%--
	response.sendRedirect(request.getContextPath()+"/jstl10/ImportedPage.jsp?user=KIM&pass=1234");
--%>
<!-- JSTL태그로 리다이렉트 -->

<c:redirect url="/jstl10/ImportedPage.jsp">
	<c:param name="user" value="KOSMO"/>
	<c:param name="pass" value="8282"/>
</c:redirect>

<%-- 
<c:redirect url="/Index.jsp" context="/App">
	<c:param name="user" value="KOSMO"/>
	<c:param name="pass" value="8282"/>
</c:redirect>
--%>