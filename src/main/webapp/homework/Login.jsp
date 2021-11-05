<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%
	//아이디 저장용
	String username="";
	if(session.getAttribute("USER_ID")!=null){
		if(session.getAttribute("USER_ID").toString().length()!=0)
			username = session.getAttribute("USER_ID").toString();
		else{
			session.removeAttribute("USER_ID");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
</head>
<body>
	<fieldset>
		<legend>웹 스토리지를 이용한 아이디 저장</legend>
		​<span style="color: red; font-weight: bold">
		<%=request.getAttribute("NOT_LOGIN")==null?"":request.getAttribute("NOT_LOGIN") %>
		</span>
		<form method="post" action="Process.jsp">
			<table style="width:400px; border-spacing: 1px; background-color: green">
				<tr style="background-color: white">
					<td style="width: 25%"> 아이디</td>
					<td>
						<input type="text" name="username" value="<%=request.getParameter("user")==null? username :request.getParameter("user") %>"/>
						<input type="checkbox" name="idsave" value="Y" <%if(username.length()!=0){%>checked<%} %>/> 아이디저장
					</td>
				</tr>
				<tr style="background-color: white">
					<td> 비밀번호</td>
					<td><input type="password" name="password" value="<%=request.getParameter("pass")==null?"":request.getParameter("pass") %>"/></td>
				</tr>
				<tr style="background-color: white; text-align: center">
					<td colspan="2"><input type="submit" value="로그인" /></td>
				</tr>
			</table>
		</form>
		<hr/>
		<!-- 아래 버튼 클릭시 Logout.jsp로 이동. 로그아웃 처리 -->
		​<input type="button" value="로그아웃"/>
		
		
	
</body>
</html>