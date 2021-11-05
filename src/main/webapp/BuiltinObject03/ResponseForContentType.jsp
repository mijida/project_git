<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseForContentType.jsp</title>
</head>
<body>
 <!-- 
	JSP 페이지 에서는 response객체의 setContentType()메소드 불 필요.
  	page지시어에 속성(contentType)으로 
  	설정해 놓았기때문에....
  	단,서블릿에서 페이지 이동을 안하고 
  	직접 서블릿 자체에서
  	웹브라우저에 출력시에는 반드시 설정해줘라.
  -->
	<fieldset>
		<legend>Content-Type응답헤더</legend>
		<h3>서블릿에서 직접 브라우저로 스트림 출력(이때는 반드시 setContentType()메소드 필요)</h3>
	  	<!-- 
	    	서블릿으로 요청을 보낼때 링크거는 방법
	    	절대경로:
	    	/Context루트/이후는 마음대로
	    	단,web.xml의 url-pattern요소에서는
	    	Context루트를 제외한 /로 시작
   		 -->		
		<a href="<%=request.getContextPath()%>/Anidir/SomDir/SetContentType.kosmo">서블릿으로 요청 보내기</a>
	</fieldset>
</body>
</html>