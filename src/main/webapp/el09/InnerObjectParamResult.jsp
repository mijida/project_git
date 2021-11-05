<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectParamResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 param내장객체</legend>
		<h2>자바코드로 영역에 저장된 속성 및 파라미터로 전달된 값 읽기</h2>
		<%
			MemberDTO member=(MemberDTO)request.getAttribute("dtoObject");
		%>
		<h4>영역에 저장된 속성</h4>
		<ul>
			<li>MemberDTO객체:<%=member %></li>
			<li>String객체:<%=request.getAttribute("stringObject") %></li>
			<li>Integer객체:<%=request.getAttribute("integerObject") %></li>
		</ul>
		<h4>파라미터로 전달된 값</h4>
		<%
			int first = Integer.parseInt(request.getParameter("first"));
			int second = Integer.parseInt(request.getParameter("second"));
		%>
		두 파라미터의 합: <%=first+second %>
		<h2>EL로 영역에 저장된 속성 및 파라미터로 전달된 값 읽기</h2>
		<!-- 
			1.영역에 저장된 값은 xxxScope내장 객체로]
			-xxxScope.속성명 혹은 xxxScope["속성명"]
			2.파라미터로 전달된 값은
			param내장객체 혹은 paramValues내장객체로]
			-param.파라미터명 혹은 param["파라미터명"]
			 paramValues.파리미터명 혹은 paramValues["파라미터명"]
			 
			 param은 request.getParameter()와 같고
			 paramValues는 request.getParameterValues()와 같다
			 
			※EL에서는 문자열등을 표시할때 ""이나 '' 둘다 사용가능
		 -->
		<h4>영역에 저장된 속성</h4>
		<ul>
			<li>MemberDTO객체:${dtoObject }</li>
			<li>String객체:${requestScope.stringObject}</li>
			<li>Integer객체:${integerObject}</li>
		</ul>
		<h4>파라미터로 전달된 값</h4>
		두 파라미터의 합:${param.first+param['second'] }
	</fieldset>
</body>
</html>