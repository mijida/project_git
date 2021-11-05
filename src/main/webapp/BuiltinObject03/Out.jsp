<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Out.jsp</title>
</head>
<body>
	<fieldset>
		<legend>out 내장 객체</legend>
		<h2>버퍼와 관련된 메소드</h2>
		<%
			out.println("버퍼에 저장될 문자열<br>");
			out.flush(); //버퍼에 저장된 내용 웹브라우저로 바로 전송
			out.println("웹브라우저에 출력이 안될 문자열");
			out.clearBuffer();
			out.println("마지막으로 저장될 문자열");
		%>
		<h2>기타 메소드</h2>
		<ul>
			<li>자동 플러쉬 여부:<%=out.isAutoFlush() %></li>
			<li>버퍼크기:<%=out.getBufferSize() %>바이트</li>
			<li>남은 버퍼크기:<%=out.getRemaining() %>바이트</li>
		</ul>
		<h2>print와 println차이</h2>
		<h4>print메소드</h4>
		<%
			out.print("<table style='border-spacing:1px;background-color:red'>");
			out.print("<tr style='background-color:white'>");
			out.print("<td>가</td><td>나</td>");
			out.print("</tr>");
			out.print("</table>");
		%>
		<h4>println메소드</h4>
		<!--소스보기 시 줄바꿈처리 되어있음(소스 볼 때 가독성이 높다)  -->
		<%
			out.println("<table style='border-spacing:1px;background-color:red'>");
			out.println("<tr style='background-color:white'>");
			out.println("<td>가</td><td>나</td>");
			out.println("</tr>");
			out.println("</table>");
		%>
	</fieldset>
</body>
</html>