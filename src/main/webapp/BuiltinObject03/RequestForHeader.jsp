<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForHeader.jsp</title>
</head>
<body>
	<fieldset>
		<legend>요청헤더명 : 요청헤더값</legend>
		<ul style="list-style: upper-roman;">
			<%
			/*
			request객체의 메소드]
			1]요청 헤더명 얻기:getHeaderNames()
			2]헤더명에 따른 헤더값:getHeader(헤더명)		
			*/
			Enumeration<String> names = request.getHeaderNames();
			while(names.hasMoreElements()){
				//헤더명 얻기]
				String headerName = names.nextElement();
				//헤더값 얻기]
				String headerValue = request.getHeader(headerName);
			%>
			<li><%=headerName %>:<%=headerValue %></li>
			<%} %>
		</ul>
	</fieldset>

</body>
</html>