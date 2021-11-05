<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseForRedirextIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>response객체의 sendRedirect()</legend>
		<form action="ResponseForRedirectProcess.jsp" method="post">
			<table cellspacing="1" bgcolor="gray">
				<tr bgcolor="white">
					<td>아이디</td>
					<td><input
						style="width: 200px; height: 20px; border: 1px red solid"
						type="text" name="id" /></td>
				</tr>
				<tr bgcolor="white">
					<td>비밀번호</td>
					<td><input
						style="width: 200px; height: 20px; border: 1px red solid"
						type="password" name="pwd" /></td>
				</tr>
				<tr bgcolor="white" align="center">
					<td colspan="2"><input type="submit" value="로그인" /></td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
</html>