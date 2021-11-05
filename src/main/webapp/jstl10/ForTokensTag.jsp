<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForTokensTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>forTokens태그</legend>
		<%
			String colors="red,green,blue,#ab7dff";
			out.println("<h2>String 클래스</h2>");
			for(String color:colors.split(",")){ //string[]=colors.split(",")
					out.println("<h4 style='color:"+color+"'>"+color+"<h4>");
			}
			out.println("<h2>StringTokenizer 클래스</h2>");
			StringTokenizer tokenizer = new StringTokenizer(colors,",");
			out.println("토큰 수:"+tokenizer.countTokens()); //4
			//hasMoreTokens():꺼내올 토큰 있으면 true 반환
			while(tokenizer.hasMoreTokens()){
				//토큰 꺼내올 때 nextToken()
				String color=tokenizer.nextToken();
				out.println("<h4 style='color:"+color+"'>"+color+"<h4>");
			}
		%>
		<h2>JSTL의 forTokens태그</h2>
		<c:set value="<%=colors %>" var="colors"/>
		<c:forTokens items="${colors }" delims="," var="color">
			<h4 style="color:${color }">${color }</h4>
		</c:forTokens>
	</fieldset>

</body>
</html>