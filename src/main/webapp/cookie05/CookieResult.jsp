<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>쿠키값 확인</legend>
		<%
			//요청헤더에 보내진 쿠키값 읽기
			Cookie[] cookies = request.getCookies();
			//out.println("cookies:"+cookies);
			if(cookies != null){
				for(Cookie cook:cookies){
					//쿠키명 얻기
					String name = cook.getName();
					//쿠키값 얻기
					String value = cook.getValue();
					out.println(String.format("%s:%s<br/>", name, value));
				}
			}
		%>
	</fieldset>
</body>
</html>