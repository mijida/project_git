<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 코드값을 상품명으로 바꿔주는 메소드 -->
 <%!
	private String getProductName(String code){
	 return code.replace("product","상품");
 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieExamCartResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>장바구니 예제:장바구니에 담은 상품들</legend>
		<ul>
			<%
				//요청 헤더에서 쿠키값 읽어오기
				Cookie[] cookies = request.getCookies();

				if (cookies != null) {
					for (Cookie cookie : cookies) {
						String name = cookie.getName();
						String value = cookie.getValue();
						if (name.indexOf("product") != -1) 
							out.println(String.format("<li>%s</li>",getProductName(value)));

					}
				}
			%>
			<li></li>
			<% %>
		</ul>
		<a href="CookieExamIndex.jsp">계속 쇼핑하기</a>
	</fieldset>
</body>
</html>