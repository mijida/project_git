<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/IsMember.jsp"%>
<!-- Delete.jsp -->
<%
	
	//1]파라미터 받기
	String no = request.getParameter("no");
	//현재 페이지번호 받기
	int nowPage=Integer.parseInt(request.getParameter("nowPage"));
	/*
	searchWord를 한글로 검색후 수정시/삭제시 주의 사항
	sendRedirect()메소드로 쿼리스트링 연결시 한글 깨짐
	해결책:
	1.검색어를  URLEncoder.encode()
	  단,검색후 총 레코드 수 구할때는 인코딩하지 않는 검색어 전달
	2.수정/삭제 완료후 뷰로 이동시 뷰(View.jsp)에서는 URLDecoder.decode()해야 한다
	
	단,form태그로 이동시에는  URL 인코딩 및 디코딩 불필요
	*/
	//검색과 관련된 파라미터 받기]
	Map map = new HashMap();
	String searchColumn=request.getParameter("searchColumn");
	String searchWord=request.getParameter("searchWord");
	System.out.println("searchWord(Delete.jsp):"+searchWord);
	String queryString="";//검색용 쿼리 스트링
	if(searchColumn !=null){	
		//검색시 생성된 페이징번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString=String.format("searchColumn=%s&searchWord=%s&",searchColumn,URLEncoder.encode(searchWord,"UTF-8"));
		
		map.put("searchColumn",searchColumn);
		map.put("searchWord",searchWord);
	}/////////////
	
	//2]CRUD작업용 DAO계열 객체 생성
	BbsDAO dao = new BbsDAO(application);
	int affected=dao.delete(no);
	//마지막 레코드 삭제시 페이지가 하나 줄어드는 경우 코딩 시작]	
	int totalRowCount=dao.getTotalRowCount(map);
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int totalPage =(int)Math.ceil((double)totalRowCount/pageSize);
	if(totalPage < nowPage) nowPage = totalPage;
			
	//마지막 레코드 삭제시 페이지가 하나 줄어드는 경우 코딩 끝]	
	dao.close();
	if(affected==1){
		response.sendRedirect("List.jsp?"+queryString+"nowPage="+nowPage);
	}
	else{%>
		<script>
			alert("삭제 실패했어요");
			history.back();
		</script>
	<%	
	}
%>