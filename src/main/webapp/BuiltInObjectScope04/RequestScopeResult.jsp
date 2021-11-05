<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestScopeResult.jsp</title>
</head>
<body>
	<fieldset>
			<legend>request영역</legend>
			<h2>리퀘스트 영역에 저장된 속성읽기</h2>
			<%
				Object object = pageContext.getAttribute("requestMemberFirst");
				String firstMemberString = "";
				if(object instanceof MemberDTO){
					MemberDTO dto=(MemberDTO)object;
					firstMemberString = String.format("이름:%s,아이디:%s,비번:%s,나이:%s",
							dto.getName(),
							dto.getId(),
							dto.getPwd(),
							dto.getAge()
							);
				}
				MemberDTO second = (MemberDTO)request.getAttribute("requestMemberSecond");
			%>
			<ul>
				<li>Integer타입:<%=request.getAttribute("requestInteger") %></li>
				<li>String타입:<%=request.getAttribute("requestString") %></li>
				<li>Date타입:<%=request.getAttribute("requestDate") %></li>
				<li>MemberDTO타입 1:<%=firstMemberString %></li>
				<li>MemberDTO타입 2:<%=second %></li>
			</ul>
</body>
</html>