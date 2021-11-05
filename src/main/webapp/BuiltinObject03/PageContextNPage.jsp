<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContextNPage.jsp</title>
</head>
<body>
	<fieldset>
		<legend>pageContext 및 page내장객체</legend>
		<h2>pageContext</h2>
		<hr/>
		<h4>request내장객체로 전송방식 얻기</h4>
		<%=request.getMethod() %>
		<h4>pageContext내장객체로 전송방식 얻기</h4>
		<%
			//상속 계층도 ServletRequest > HttpServletRequest
			//1]pageContext로 request객체 얻기	
			ServletRequest req = pageContext.getRequest();
			//getMethod()는 HttpServletRequest에서 새롭게 정의한 메소드]
			//2]req를 HttpServletRequest로 형변환.
			String method = ((HttpServletRequest)req).getMethod();
			out.println(method);
		%>
		<h4>pageContext내장객체로 out내장객체 얻기</h4>
		<%pageContext.getOut().println("메소드 체인"); %>
		<h4>application내장객체로 서버의 물리적 경로 얻기</h4>
		<%=application.getRealPath("/images") %>
		<h4>pageContext내장객체로 서버의 물리적 경로 얻기</h4>
		<%=pageContext.getServletContext().getRealPath("/images") %>
		<h2>page내장객체</h2>
		<%
		/*
		page내장객체(Object타입)는 jsp페이지 자체를 의미하고
		this키워드와 같은 의미다. 	
		*/
		out.println("page내장객체의 클래스명:"+page.getClass().getName()+"<br/>");
		out.println("this의 클래스명:"+this.getClass().getName()+"<br/>");
		out.println(page instanceof HttpServlet ? "page는 서블릿이다":"page는 서블릿이 아니다");
		//jsp page가 서블릿으로 변환이 되기 때문에
		%>
	</fieldset>

</body>
</html>