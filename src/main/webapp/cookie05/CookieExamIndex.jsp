<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 헤더에서 쿠키값 읽기
	Cookie[] cookies = request.getCookies();
	//상품코드값을 담을 컬렉션
	List cart = new Vector();

	String username="";
	if(cookies != null){
		for(Cookie cookie:cookies){
			String name = cookie.getName();
			String value = cookie.getValue();
			if(name.indexOf("product")!=-1) cart.add(value);
			//아이디 저장용
			if("USER_ID".equals(name)) username=value;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieExamIndex.jsp</title>
</head>
<body>
<fieldset>
		<legend>쿠키를 이용한 장바구니 예제</legend>
		<form action="CookieExamCartProcess.jsp">
			<input type="checkbox" name="cart" value="product1"<%if(cart.contains("product1")){ %> disabled<%} %>/> 상품1
			<input type="checkbox" name="cart" value="product2"<%if(cart.contains("product2")){ %> disabled<%} %> /> 상품2
			<input type="checkbox" name="cart" value="product3"<%if(cart.contains("product3")){ %> disabled<%} %> /> 상품3
			<input type="checkbox" name="cart" value="product4"<%if(cart.contains("product4")){ %> disabled<%} %> /> 상품4
			<input type="checkbox" name="cart" value="product14"<%if(cart.contains("product14")){ %> disabled<%} %> /> 상품14
			<input type="checkbox" name="cart" value="product190"<%if(cart.contains("product190")){ %> disabled<%} %> /> 상품190
			<input type="submit" value="장바구니 담기" />
		</form>
		<form action="CookieExamCartEmpty.jsp">
			<input type="submit" value="장바구니 비우기" />
		</form>
		<a href="CookieExamCartResult.jsp">장바구니 보기</a>
	</fieldset>
	<fieldset>
		<legend>쿠키를 이용한 아이디 저장 예제</legend>
		
		<%if(session.getAttribute("USER_ID")==null){ //userid=null이면 로그아웃상태
			%>
		
		​ ​ <span style="color: red; font-weight: bold"><%=request.getAttribute("ERROR")==null?"":request.getAttribute("ERROR") %></span>	
		
		<form method="post" action="CookieExamLoginProcess.jsp">
			<table	style="width: 400px; border-spacing: 1px; background-color: green">
				<tr style="background-color: white">
					<td style="width: 25%">아이디</td>
					<td>
						<input type="text" name="user" value="<%=request.getParameter("user")==null?username:request.getParameter("user")%>"/>
						<input type="checkbox"	name="idsave" value="Y"<%if(username.length()!=0){ %> checked<%} %>/> 아이디저장
					</td>
				</tr>
				<tr style="background-color: white">
					<td>비밀번호</td>
					<td><input type="password" name="pass" value="<%=request.getParameter("pass")==null?"":request.getParameter("pass")%>"/></td>
				</tr>
				<tr style="background-color: white; text-align: center">
					<td colspan="2"><input type="submit" value="로그인" /></td>
				</tr>
			</table>
		</form>
		<%} else{ %>		
		​<a href="CookieExamLoginLogout.jsp">로그아웃</a>
		<%} %>
</body>
</html>