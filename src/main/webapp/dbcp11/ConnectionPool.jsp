<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1]InitialContext 객체 생성(Context>InitialContext) 인터페이스>클래스
	Context ctx = new InitialContext();
	//ctx=(Context)ctx.lookup("java:comp/env"); //jsp이름 찾기 위해 한번더 lookup
	//DataSource source = (DataSource)ctx.lookup("jsp"); //name:jsp,type:datasource
	DataSource source = (DataSource)ctx.lookup("java:comp/env/jsp"); 
	Connection conn = source.getConnection(); //getConnection() : 커넥션객체 반환
	String connString;
	if(conn != null) connString="<h3>데이터 베이스 연결 성공</h3>";
	else connString="<h3>데이터 베이스 연결 실패</h3>";
	if(conn != null) conn.close(); //커넥션 풀에 객체 다시 반납
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPool.jsp</title>
</head>
<body>
	<fieldset>
		<legend>커넥션 풀</legend>
		<%=connString %>
	</fieldset>
</body>
</html>