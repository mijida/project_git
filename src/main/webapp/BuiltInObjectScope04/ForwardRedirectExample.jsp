<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardRedirectExample.jsp</title>
</head>
<body>
	<fieldset>
		<legend>포워드/리다이렉트 예제</legend>		
			<form action="ForwardRedirectExamProcess.jsp" method="post">
				<table cellspacing="1" bgcolor="gray">
					<tr bgcolor="white">
						<td>아이디</td>
						<td><input
							style="width: 200px; height: 20px; border: 1px red solid"
							type="text" name="id" value="<%=request.getParameter("id")==null? "" : request.getParameter("id") %>"/></td>
					</tr>
					<tr bgcolor="white">
						<td>비밀번호</td>
						<td><input
							style="width: 200px; height: 20px; border: 1px red solid"
							type="password" name="pwd" value="<%=request.getParameter("pwd")==null? "" : request.getParameter("pwd") %>"/></td>
					</tr>
					<tr bgcolor="white" align="center">
						<td colspan="2"><input type="submit" value="로그인" /></td>
					</tr>
				</table>
			</form>
			<span style="color: red; font-size: 1.5em"><%=request.getAttribute("errormsg")==null? "" : request.getAttribute("errormsg") %></span>
	</fieldset>
</body>
</html>