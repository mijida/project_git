<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%

	//사용자 입력값 받기
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");	
	//회원이라고 가정
	//if("KIM".equals(user.trim()) && "1234".equals(pass.trim())){
	//실제 테이블과 연동
	BbsDAO dao = new BbsDAO(application);
	boolean flag = dao.isMember(user, pass);
	dao.close();
	if(flag){
		
		//1. 로그인 처리 - 세션 영역에 속성 저장
		session.setAttribute("USER_ID", user);
		//2. 로그인 처리 후 마이페이지로 이동
		response.sendRedirect("MyPage.jsp");
		
	}
	else{
		//리퀘스트 영역에 필요한 데이터 저장
		request.setAttribute("NOT_LOGIN", "아이디 비번 불일치");
		//로그인 페이지로 포워드
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>
