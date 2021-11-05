<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ForwardRedirectExamProcess.jsp -->
<%@ include file = "/common/Validate.jsp" %>
<%
//파라미터 받기
	//Map<String,String[]> params = request.getParameterMap();
	String id = request.getParameter("id");
	if(!isValidate(out,id,"아이디를 입력하세요")) return;
	String pwd = request.getParameter("pwd");
	if(!isValidate(out,pwd,"비밀번호를 입력하세요")) return;
	
	if("KIM".equals(id) && "1234".equals(pwd)){
		//리퀘스트 영역에 저장
		request.setAttribute("id",id);
		request.setAttribute("pwd",pwd);
		//1.리다이렉트로 자동 페이지 이동
		//response.sendRedirect("ForwardRedirectExampleMyPage.jsp");
		//2.포워드로 자동 페이지 이동
		request.getRequestDispatcher("ForwardRedirectExampleMyPage.jsp").forward(request, response);
		//프로세스가 받은 파라미터 마이페이지로 그대로 전달, = 프로세스와 마이페이지는 같은 영역을 공유한다 
	}
	else{
		//1.sendRedirect로 페이지 이동하기(리다이렉트로 자동 페이지 이동)
		//response.sendRedirect("ForwardRedirectExample.jsp"); //페이지를 새롭게 서버에 요청
		//2.포워드로 이동하기: 입력한 값 유지, 에러메시지 리퀘스트 영역에 저장
		request.setAttribute("errormsg", "아이디와 비밀번호가 틀립니다.");
		request.getRequestDispatcher("ForwardRedirectExample.jsp").forward(request, response);
	}
%>
