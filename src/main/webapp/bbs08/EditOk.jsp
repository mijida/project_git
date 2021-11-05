<%@page import="java.net.URLEncoder"%>
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
	String no = request.getParameter("no");
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	
	//검색과 관련된 파라미터 받기]
	/*
	searchWord를 한글로 검색후 수정시/삭제시 주의 사항
	sendRedirect()메소드로 쿼리스트링 연결시 한글 깨짐
	해결책:
	1.검색어를  URLEncoder.encode()
	  단,검색후 총 레코드 수 구할때는 인코딩하지 않는 검색어 전달
	2.수정/삭제 완료후 뷰로 이동시 뷰(View.jsp)에서는 URLDecoder.decode()해야 한다
	
	단,form태그로 이동시에는  URL 인코딩 및 디코딩 불필요
	*/
	String searchColumn=request.getParameter("searchColumn");
	String searchWord=request.getParameter("searchWord");	
	String queryString="";//검색용 쿼리 스트링
	if(searchColumn !=null){	
		//검색시 생성된 페이징번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString=String.format("searchColumn=%s&searchWord=%s&",searchColumn,URLEncoder.encode(searchWord,"UTF-8"));
	
	}/////////////
		
	
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	BbsDTO dto = new BbsDTO(no,null,title,content,null,null);
	//4]CRUD작업용 DAO계열 객체 생성
	BbsDAO dao = new BbsDAO(application);
	int affected=dao.update(dto);
	
	if(affected==1){
		//sendRedirect()로 이동(URLEncoder으로 한글 처리)
		//response.sendRedirect(String.format("View.jsp?%sno=%s&nowPage=%s",queryString,no,nowPage));
		//form태그로 이동(URLEncoder불필요)
	%>
		<form action="View.jsp">
			<input type="hidden" name="no" value="<%=no%>"/>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"/>
			<input type="hidden" name="searchColumn" value="<%=searchColumn%>"/>
			<input type="hidden" name="searchWord" value="<%=searchWord%>"/>		
		</form>
		<script>
			document.forms[0].submit();
		</script>
	
	<%
	}
	else{%>
		<script>
			alert("수정 실패했어요");
			history.back();
		</script>
	<%	
	}
%>