<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/IsMember.jsp"%>
<%
	//1]파라미터(키값) 받기
	String no = request.getParameter("no");
	//검색과 관련된 파라미터 받기]	
	String searchColumn=request.getParameter("searchColumn");
	String searchWord=request.getParameter("searchWord");
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	BbsDAO dao = new BbsDAO(application);
	BbsDTO dto = dao.selectOne(no,"");	
	dao.close();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Edit.jsp</title>

<link href="<%=request.getContextPath()%>/css/layout.css" rel="stylesheet" />



</style>
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
					<legend>글 수정 페이지</legend>
					<form action="EditOk.jsp" method="post">
						<input type="hidden" name="no" value="<%=no%>"/>
						<input type="hidden" name="nowPage" value="<%=nowPage%>"/>
						<input type="hidden" name="searchColumn" value="<%=searchColumn%>"/>
						<input type="hidden" name="searchWord" value="<%=searchWord%>"/>
						<table width="75%" bgcolor="gray" cellspacing="1">
							<tr bgcolor="white">
								<td width="30%" align="center">제목</td>
								<td style="padding: 5px"><input value="<%=dto.getTitle() %>" type="text" name="title" style="width: 98%" /></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">내용</td>
								<td style="padding: 5px"><textarea rows="10"
										style="width: 98%" name="content"><%=dto.getContent() %></textarea></td>

							</tr>
							<tr bgcolor="white" align="center">
								<td colspan="2"><input type="submit" value="수정" /></td>
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