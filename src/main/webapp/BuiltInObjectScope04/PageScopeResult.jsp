<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeResult.jsp</title>
</head>
<body>
	<fieldset>
			<legend>page영역</legend>
			<h2>페이지 영역에 저장된 속성읽기</h2>
			<%
				Object object = pageContext.getAttribute("pageMemberFirst");
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
				MemberDTO second = (MemberDTO)pageContext.getAttribute("pageMemberSecond");
			%>
			<ul>
				<li>Integer타입:<%=pageContext.getAttribute("pageInteger") %></li>
				<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
				<li>Date타입:<%=pageContext.getAttribute("pageDate") %></li>
				<li>MemberDTO타입 1:<%=firstMemberString %></li>
				<li>MemberDTO타입 2:<%=second %></li>
			</ul>
</body>
</html>