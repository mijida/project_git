<%@page import="model.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	파라미터로 넘어온 값을 읽을때는 한글처리를 위해
	반드시 request.setCharacterEncoding("문자인코딩셋")로 처리
	단, 영역에 저장된 값을 읽어올때는 한글처리 불필요. 
	
	모든 영역(페이지,리퀘스트,세션,어플리케이션)에는 
	모든 타입(Object)의 객체 저장 가능
	파라미터로 값을 전달할때는 문자열만 가능
	
	※page영역에 저장한 속성은 해당 페이지를 벗어나면 소멸된다. 
	  page영역에는 pageContext객체(PageContext타입)존재
	*/ 
	//페이지 영역에 속성 저장]
	pageContext.setAttribute("pageInteger", new Integer(10));
	pageContext.setAttribute("pageString", "페이지 영역에 저장된 문자열");
	pageContext.setAttribute("pageDate", new Date(new java.util.Date().getTime()));
	pageContext.setAttribute("pageMemberFirst",new MemberDTO("KIM","1234","김길동",null,"20"));
	pageContext.setAttribute("pageMemberSecond",new MemberDTO("PARK","1234","박길동",null,"20"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeIndex.jsp</title>
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
		<h2>페이지 영역에 저장된 속성 삭제 후 읽기</h2>
		<%
			//속성명이 틀린 경우 삭제가 안됨.에러는 안남.	
			pageContext.removeAttribute("NoKey");
			//존재하는 키값(속성명)으로 삭제
			pageContext.removeAttribute("pageInteger");
			pageContext.removeAttribute("pageString");
		%>
		<ul>
			<li>Integer타입:<%=pageContext.getAttribute("pageInteger") %></li>
			<li>String타입:<%=pageContext.getAttribute("pageString") %></li>
			<li>Date타입:<%=pageContext.getAttribute("pageDate") %></li>
			<li>MemberDTO타입 1:<%=firstMemberString %></li>
			<li>MemberDTO타입 2:<%=second %></li>
		</ul>
		<h2>페이지 이동</h2>
		<a href="PageScopeResult.jsp">사용자 클릭에 의한 이동</a>
		<%@include file="PageScopeIncludedPage.jsp" %>
	</fieldset>
</body>
</html>