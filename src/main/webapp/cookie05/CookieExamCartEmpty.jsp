<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamCartEmpty.jsp -->
<%
	//[장바구니 비우기-쿠키 삭제]
	
	//요청 헤더에서 쿠키값 읽어오기]	
	Cookie[] cookies = request.getCookies();			
	if(cookies !=null){
		for(Cookie cookie:cookies){
			//쿠키명 얻기]
			String name=cookie.getName();
			//쿠키값 얻기]
			String value=cookie.getValue();
			
			if(name.indexOf("product")!=-1){ 
				//쿠키 삭제 처리]
				//1]동일한 쿠키명으로 쿠키 생성,쿠키값은 빈 문자열로
				Cookie cook = new Cookie(name,"");
				cook.setPath(request.getContextPath());
				//2]유효기간은 0이나 -값으로 설정
				cook.setMaxAge(0);
				//3]다시 응답헤더에 추가
				response.addCookie(cook);
				
			}///if
		}//for
	}//if
	//다시 장바구니 담은 페이지로 이동
	response.sendRedirect("CookieIndex.jsp");