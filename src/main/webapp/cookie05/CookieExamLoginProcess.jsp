<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- CookieExamLoginProcess.jsp  -->
<%

	//사용자 입력값 받기
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	String idsave = request.getParameter("idsave");
	
	if("KIM".equals(user.trim()) && "1234".equals(pass.trim())){ //회원
		//1.로그인 처리]-세션영역에 속성(주로 식별자만(아이디만)) 저장
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
		
		//아이디저장 체크 여부 판단
		if(idsave != null){//체크한경우 - 아이디를 쿠키에 저장
			Cookie cookie = new Cookie("USER_ID",user);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		}
		else{//체크 안 한 경우-저장된 쿠키 삭제
			Cookie cookie = new Cookie("USER_ID","");
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}
		
		//2.로그인 처리후 CookieExamIndex.jsp로 이동
		response.sendRedirect("CookieExamIndex.jsp");	
		
	}
	else{//아이디 비번 불일치
		//리퀘스트 영역에 필요한 데이터 저장
		request.setAttribute("ERROR", "아이디/비번 불일치");
		//포워드로 이동
		request.getRequestDispatcher("CookieExamIndex.jsp").forward(request, response);
		
	}

%>