<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
<link href="<%=request.getContextPath() %>/css/layout.css" rel="stylesheet"/>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div class="logo"><img src="<%=request.getContextPath() %>/images/logo.jpg" alt="회사 로고 이미지" /></div>
            <div class="topMenu">
				<jsp:include page="/template/Top.jsp"/>
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
                    <h2>로그인 페이지</h2>
                   		<fieldset style="padding: 10px">
							<legend>로그인 페이지</legend>
							<span style="color: red; font-weight: bold"><%=request.getAttribute("NOT_LOGIN")==null?"":request.getAttribute("NOT_LOGIN") %></span>
							<form method="post" action="LoginProcess.jsp">
								<table	style="width: 300px; border-spacing: 1px; background-color: green">
									<tr style="background-color: white">
										<td style="width: 25%">아이디</td>
										<td style="padding-left: 5px">
											<input type="text"	name="user" value="<%=request.getParameter("user")==null?"":request.getParameter("user") %>" />
										</td>
									</tr>
									<tr style="background-color: white">
										<td>비밀번호</td>
										<td style="padding-left: 5px">
											<input type="password" name="pass" >
										</td>
									</tr>
									<tr style="background-color: white; text-align: center">
										<td colspan="2"><input type="submit" value="로그인" /></td>
									</tr>
								</table>
							</form>
						</fieldset>
                </div>
            </div>
        </div>
        <div class="footer">
            <jsp:include page="/template/Footer.jsp"/>
        </div>
    </div>

</body>
</html>