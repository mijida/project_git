<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForServerNClient.jsp</title>
</head>
<body>
	<fieldset>
		<legend>요청한 서버와 클라이언트에 대한 정보</legend>
		<form method="post">
			<input type="submit" value="서버로 전송"/>
		</form>
		<ul>
			<li>HTTP 메소드:<%=request.getMethod() %></li>
			<li>전체 URL:<%=request.getRequestURL() %></li>
			<li>도메인을 제외한 URI:<%=request.getRequestURI() %></li>
			<li>요청 프로토콜:<%=request.getProtocol() %></li>
			<li>요청 서버명:<%=request.getServerName() %></li>
			<li>요청 서버포트:<%=request.getServerPort() %></li>
			<!-- 
				IPV6값으로 반환시
				톰캣 실행시의 JVM에 환경변수를 추가.
				이클립스 > Run > Run Configuration > Arguiments > -Djava.net.preferIPv4Stack=true				
			
			 -->
			<li>클라이언트의 IP주소:<%=request.getRemoteAddr() %></li> <%--remote(원격호스트) <-> local(본인호스트) --%>
			<li>클라이언트의 IP주소:<%=request.getRemoteHost() %></li>
			<li>요청과 관련된 세션객체 얻기(서블릿에서 사용 - 인증처리):<%=request.getSession() %></li>
			<li>세션 내장객체:<%=session %></li>
		</ul>
	</fieldset>
	<!-- 
 	JSP에서는 웹 어플리케이션 전체 영역을 Context라 칭함.
 	
 	getContextPath(): server.xml의 Context태그에
 	path속성에 지정한 값을 얻어옴.
 	※HTML에서 절대경로로 링크를 걸때 주로 사용	 
 	 -->
	<fieldset>
		<legend>Context Root얻기</legend>
		<h3>프로젝트 생성후 server.xml의 Context요소의 path속성</h3>
		Context Path(프로젝트명) : <%=request.getContextPath() %>
	</fieldset>
</body>
</html>