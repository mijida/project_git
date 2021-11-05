<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private int getTotal(int start,int end){
		int total=0;
		for(int i=start;i<=end;i++) total+=i;
		return total;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression.jsp</title>
</head>
<body>
	<fieldset>
		<legend>표현식(Expression) 사용하기</legend>
		<h2>out 내장 객체를 사용한 출력</h2>
		<h4>1부터 100까지 누적합</h4>
		<%
			out.println(getTotal(1, 100));
			out.println("<h4>1부터 1000까지 누적합</h4>");
			out.println(getTotal(1, 1000));
		%>
		<h4>1부터 10000까지 누적합</h4>
		<%out.println(getTotal(1, 10000)); %>
		
		<h2>표현식을 사용한 출력</h2>
		<h4>1부터 100까지 누적합</h4>
		<%=getTotal(1, 100) %> //=out.print
		<%="<h4>1부터 1000까지 누적합</h4>" %>
		<%=getTotal(1, 1000) %>
		<h4>1부터 10000까지 누적합</h4>
		<%=getTotal(1, 10000) %>
	</fieldset>
</body>
</html>