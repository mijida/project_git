
<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//[응답헤더 설정]	
	/*
	웹브라우저의 캐쉬를 이용하지 않겠다
	즉 현재 페이지를 매번 서버에 요청하도록 만드는 것
	*/
	//HTTP/1.0에 적용시킬때
	response.setHeader("pragma", "no-cache");
	//HTTP/1.1에 적용시킬때
	response.setHeader("cache-control", "no-cache");
	/*
	웹브라우저가 인식하지 못하는 Content-Type(MIME타입)인 경우
	웹브라우저는 파일 다운로드창을 보여준다
	※다운로드 구현시 적용
	
	IE에서는 아무값이나 FX에서는 
	application/unknown이나
	binary/octect-stream등	
	*/
	//response.setContentType("binary/octect-stream");
	
	/*
	add계열:기존 헤더명이 존재시 계속 추가,없을시 생성됨
	set계열:기존 헤더명이 존재시 기존 헤더명의 값이 변경됨,없을시 생성.	
	*/
	//오늘 날짜를 SET계열로 currentDate란 응답헤더명으로 생성]
	Date date = new Date();
	long currentTime = date.getTime();
	response.setDateHeader("currentDate", currentTime);
	//특정 날짜를 ADD계열로 currentDate란 응답헤더명으로 생성]
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	long endTime=dateFormat.parse("2022-2-11").getTime();
	//response.addDateHeader("currentDate", endTime);
	response.setDateHeader("currentDate", endTime);
	//ADD계열로 NumberOfStudent라는 헤더명 생성]
	response.addIntHeader("NumberOfStudents", 27);
	//SET계열로 NumberOfStudent라는 헤더명의 헤더값 변경]
	response.setIntHeader("NumberOfStudents",-1);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseForHeader.jsp</title>
</head>
<body>
	<fieldset>
		<legend>응답헤더</legend>
		<ul>
			<%
				//1]응답 헤더명 얻기:getHeaderNames()	
				Collection<String> names = response.getHeaderNames();
				for(String headerName:names){
					//2]응답헤더값 얻기 : String getHeader("헤더명")
					String headerValue = response.getHeader(headerName);
					out.println(String.format("<li>%s:%s</li>",headerName,headerValue));
				}
			%>
		</ul>
		<h2>응답헤더명 존재 여부 판단: boolean containHeader("헤더명")</h2>
		<h4>Content-Type존재 여부 판단</h4>
		<%=response.containsHeader("content-type")?"Content-Type 존재":"Content-Type 미존재" %>
		<h4>currentDate존재 여부 판단</h4>
		<%=response.containsHeader("currentDate")?"currentDate 존재":"currentDate 미존재" %>
	</fieldset>

</body>
</html>