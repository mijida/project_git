<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="IncludePage.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Index.jsp</title>
<link href="<%=request.getContextPath() %>/css/layout.css" rel="stylesheet"/>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div class="logo"><img src="<%=request.getContextPath() %>/images/logo.jpg" alt="회사 로고 이미지" /></div>
            <div class="topMenu">
				<%@ include file="/template/Top.jsp" %>
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
                </ul>
            </div>
            <div class="main">
                    <h2>메인 페이지</h2>
                    현재 페이지명:<%=currentPage %>
                    오늘 날짜:<%=getDate("yyyy년 MM월 dd일") %>
                   
                </div>
            </div>
        </div>
        <div class="footer">
            <%@ include file="/template/Footer.jsp" %>
        </div>
    </div>

</body>
</html>