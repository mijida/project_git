<%@page import="java.util.Map"%>
<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/IsMember.jsp"%>
<%
//1]파라미터(키값) 받기
String no = request.getParameter("no");
//현재 페이지번호 받기
String nowPage=request.getParameter("nowPage");
//검색과 관련된 파라미터 받기]
String searchColumn=request.getParameter("searchColumn");
String searchWord=request.getParameter("searchWord");
String queryString="";//검색용 쿼리 스트링
if(searchColumn !=null){	
	//검색시 생성된 페이징번호 클릭시 처리하기 위한 추가 쿼리스트링
	queryString=String.format("searchColumn=%s&searchWord=%s&",searchColumn,searchWord);
}/////////////



//2]CRUD작업용 BbsDAO생성
BbsDAO dao = new BbsDAO(application);
//이전 페이지명 얻기:List.jsp에서 뷰로 올때만 조회수 증가 하기 위함
String referer = request.getHeader("referer");
//out.println(referer);
String prevPageName = referer.substring(referer.lastIndexOf("/") + 1);
BbsDTO dto = dao.selectOne(no, prevPageName);

//이전글/다음글 조회
Map<String,BbsDTO> map = dao.prevNext(no);

dao.close();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>View.jsp</title>
<link href="<%=request.getContextPath()%>/css/layout.css" rel="stylesheet" />
<script>

	var isDelete=function(){
		if(confirm("정마로 삭제하시겠습니까?")){
			location.replace("Delete.jsp?<%=queryString%>&no=<%=no%>&nowPage=<%=nowPage%>");
		}
	};

</script>
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

		<div class="content">
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
			<div class="main">
				<fieldset style="width: 85%; padding: 10px 20px">
					<legend>글 상세보기 페이지</legend>
					<form action="WriteOk.jsp" method="post">
						<table width="75%" bgcolor="gray" cellspacing="1">
							<tr bgcolor="white">
								<td width="15%" align="center">작성자</td>
								<td style="padding: 5px"><%=dto.getName()%></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">작성일</td>
								<td style="padding: 5px"><%=dto.getPostDate()%></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">조회수</td>
								<td style="padding: 5px"><%=dto.getVisitCount()%></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">제목</td>
								<td style="padding: 5px"><%=dto.getTitle()%></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">내용</td>
								<td style="padding: 5px"><%=dto.getContent().replace("\r\n", "<br/>")%></td>

							</tr>
							<tr bgcolor="white" align="center" style="height: 50px">
								<td colspan="2">
									<%
									if (dto.getId().equals(session.getAttribute("USER_ID"))) {
									%> 
									<a href="Edit.jsp?<%=queryString%>&no=<%=dto.getNo() %>&nowPage=<%=nowPage%>">수정</a> | <a href="javascript:isDelete()">삭제</a> | <%
									}
									%> <a href="List.jsp?<%=queryString%>&nowPage=<%=nowPage%>">목록</a>
								</td>
							</tr>
						</table>
						<!-- 이전글/다음글 -->
						<table style="width: 75%">
							<tr>
								<td style="width: 10%">이전글</td>
								<td><%=map.get("PREV")==null ? "이전글이 없습니다" : String.format("<a href='View.jsp?no=%s'>%s</a>",map.get("PREV").getNo(),map.get("PREV").getTitle()) %></td>
							</tr>
							<tr>
								<td >다음글</td>
								<td><%=map.get("NEXT")==null ? "다음글이 없습니다" : String.format("<a href='View.jsp?no=%s'>%s</a>",map.get("NEXT").getNo(),map.get("NEXT").getTitle()) %></td>
							</tr>
						</table>
				</fieldset>
			</div>
		</div>
		<div class="footer">
			<jsp:include page="/template/Footer.jsp" />
		</div>
	</div>
</body>
</html>