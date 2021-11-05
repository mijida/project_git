<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamCartProcess.jsp -->
<%
	//장바구니에 담을 상품 코드 받기
	String[] codes = request.getParameterValues("cart");
	//상품코드를 쿠키로 저장. 즉 사용자 브러우저에 상품코드 저장 
	for(String code:codes){
		Cookie cookie = new Cookie(code,code);
		cookie.setPath(request.getContextPath());
		//응답헤더에 설정
		response.addCookie(cookie);
	}
	response.sendRedirect("CookieIndex.jsp");

%>