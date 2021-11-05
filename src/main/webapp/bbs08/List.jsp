<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="model.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/IsMember.jsp" %>
<%

	//검색을 위한 한글처리]
	request.setCharacterEncoding("UTF-8");
	
	//시작 및 끝 행번호 와 검색 관련 데이타 저장용
	Map map = new HashMap();
	
	//검색과 관련된 파라미터 받기]
	String searchColumn=request.getParameter("searchColumn");
	String searchWord=request.getParameter("searchWord");
	String queryString="";//검색용 쿼리 스트링
	if(searchColumn !=null){
		map.put("searchColumn",searchColumn);
		map.put("searchWord",searchWord);
		//검색시 생성된 페이징번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString=String.format("searchColumn=%s&searchWord=%s&",searchColumn,searchWord);
	}/////////////
	//전체 글 목록 가져오기
	BbsDAO dao = new BbsDAO(application);
	//페이징을 위한 로직 시작]
	//전체 레코드수	
	int totalRecordCount = dao.getTotalRowCount(map);
	//페이지 사이즈
	int pageSize =Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	//블락페이지
	int blockPage=Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
	//전체 페이지수
	int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
	//현재 페이지 번호
	int nowPage = request.getParameter("nowPage")==null ? 1 : Integer.parseInt(request.getParameter("nowPage"));
	//시작 및 끝 ROWNUM구하기
	int start= (nowPage-1)*pageSize+1;
	int end = nowPage*pageSize;
	//페이징을 위한 로직 끝]
	map.put("start",start);
	map.put("end",end);
	List<BbsDTO> list=dao.selectList(map);
	dao.close();


%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link href="<%=request.getContextPath()%>/css/layout.css" rel="stylesheet" />

</head>
<body>
	
	<div class="wrap">
		<div class="header">
			<div class="logo">
				<img src="<%=request.getContextPath()%>/images/logo.jpg"
					alt="회사 로고 이미지" />
			</div>
			<div class="topMenu">
				<jsp:include page="/template/Top.jsp" />
			</div>
		</div>

		<div class="content" >
			<div class="aside">
				<ul>
					<li>서브메뉴1</li>
					<li>서브메뉴2</li>
					<li>서브메뉴3</li>
					<li>서브메뉴4</li>
					<li>서브메뉴5</li>
					<li>서브메뉴6</li>
					<li>서브메뉴7</li>
					<li>서브메뉴8</li>
					<li>서브메뉴9</li>
					<li>서브메뉴10</li>
				</ul>
			</div>
			<div class="main" >
				<fieldset style="width:85%;padding:10px 20px">
					<legend>회원제 게시판 목록(<%=nowPage%>/<%=totalPage %>)</legend>
					<!-- 글쓰기 버튼 -->
					<table style="width:100%">
						<tr>
							<td style="text-align: right"><a href="Write.jsp">글작성</a></td>
						</tr>
					</table>
					<table style="border-spacing: 1px; background-color: gray;width:100%">
						<tr style="background-color: white" align="center">
							<th width="10%">번호</th>
							<th width="45%">제목</th>
							<th width="15%">작성자</th>
							<th width="10%">조회수</th>
							<th>작성일</th>
						</tr>

						<%if(list.isEmpty()){ %>
						<tr style="background-color: white" align="center">
							<td colspan="5">등록된 글이 없어요</td>
						</tr>
						<!-- 아래 반복 -->
						<%}else{
							int countNum=0;
							for(BbsDTO dto:list){
						%>						
						<tr style="background-color: white" align="center">
							<td><%=totalRecordCount - (((nowPage - 1) * pageSize) + countNum) %></td>
							<td style="text-align: left"><a href="View.jsp?no=<%=dto.getNo() %>&nowPage=<%=nowPage%>&<%=queryString%>"><%=dto.getTitle() %></a></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getVisitCount() %></td>
							<td><%=dto.getPostDate() %></td>
						</tr>
						<%
								countNum++;
							}//for
						}//else%>

					</table>
					<!-- 페이징 -->
					<table width="100%">
						<tr align="center">
							<td><%=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "List.jsp?"+queryString) %></td>
						</tr>
					</table>
					<!-- 검색UI -->
					<form method="post">
						<table width="100%">
							<tr align="center">
								<td><select name="searchColumn">
										<option value="title">제목</option>
										<option value="name">작성자</option>
										<option value="content">내용</option>
									</select> 
									<input type="text" name="searchWord" /> 
									<input type="submit" value="검색" />
								</td>
							</tr>
						</table>
					</form>
				</fieldset>
			</div>
		</div>
		<div class="footer">
			<jsp:include page="/template/Footer.jsp" />
		</div>
	</div>
</body>
</html>