<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/IsMember.jsp"%>
<!-- WriteOk.jsp -->
<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");	
	//작성자의 아이디 얻기:세션영역에서
	String id = session.getAttribute("USER_ID").toString();
	
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	BbsDTO dto = new BbsDTO(null,id,title,content,null,null);
	//4]CRUD작업용 DAO계열 객체 생성
	BbsDAO dao = new BbsDAO(application);
	int affected=dao.insert(dto);
	
	if(affected==1){
		response.sendRedirect("List.jsp");
	}
	else{%>
		<script>
			alert("입력 실패했어요");
			history.back();
		</script>
	<%	
	}
%>