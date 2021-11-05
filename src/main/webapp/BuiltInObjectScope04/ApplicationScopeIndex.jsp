<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//저장 객체 생성
	MemberDTO first = new MemberDTO("GA","1234","가길동",null,"20");
	MemberDTO second = new MemberDTO("NA","5678","나길동",null,"20");
	MemberDTO third = new MemberDTO("DA","9999","다길동",null,"20");
	//리스트 계열 컬렉션에 객체 저장
	List<MemberDTO> list = Arrays.asList(first,second,third);
	//맵계열 컬렉션에 객체 저장
	Map<String, MemberDTO> map = new HashMap<>();
	map.put("first",first);
	map.put("second",second);
	map.put("third",third);
	//application영역에 컬렉션들 저장
	application.setAttribute("list", list);
	application.setAttribute("map", map);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationScopeIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>application영역</legend>
		<h2>사용자 클릭으로 페이지 이동</h2>
		<a href= "ApplicationScopeResult.jsp">클릭하세요</a>
		<h2>포워드로 페이지 자동 이동</h2>
		<%request.getRequestDispatcher("/BuiltInObjectScope04/ApplicationScopeResult.jsp").forward(request, response); %>
		<h2>리다이렉트로 페이지 자동 이동</h2>
		<%response.sendRedirect(request.getContextPath()+"/BuiltInObjectScope04/ApplicationScopeResult.jsp"); %>
	</fieldset>
</body>
</html>