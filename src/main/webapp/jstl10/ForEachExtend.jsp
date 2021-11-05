<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="my" uri="/WEB-INF/tld/mytag.tld" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachExtend.jsp</title>
</head>
<body>
	<fieldset>
		<legend>확장 for문 형태의 forEach태그</legend>
		<!-- item(배열이나 컬렉션,EL이나 표현식)/var index=0부터 시작 -->
		<%
			String[] colors = {"red","green","blue","#9944a5"};
		%>
		<h2>자바코드로 배열 출력</h2>
		<%for(String color:colors){ %>
		<h4 style="color:<%=color%>">Java Server Page</h4>
		<%} %>
		<h2>EL 및 JSTL로 배열 출력</h2>
		<c:set var="colors" value="<%=colors %>"/>
		<c:forEach var="color" items="${colors }">
		<h4 style="color:${color}">Java Server Page</h4>
		</c:forEach>
		<h2>varstatus속성</h2>
		<c:forEach items="${colors}" var="i" varStatus="loop">
			<h4>${loop.count }번째 반복</h4>
			<ul>
				<li>\${loop.index } : ${loop.index }</li>
				<li>\${loop.first } : ${loop.first }</li>
				<li>\${loop.last } : ${loop.last }</li>
				<li>\${loop.current } : ${loop.current }</li>
			</ul>
		</c:forEach>
		<h2>리스트 계열 컬렉션</h2>
		<%
		//데이터 준비
		List list = Arrays.asList(
				new MemberDTO("KIM","1234","김길동",null,null),
				new MemberDTO("LEE","1234","이길동",null,null),
				new MemberDTO("PARK","1234","박길동",null,null)
				);
		%>
		<c:set var="list" value="<%=list %>"/>
		<h4>일반 for문 형태의 forEach태그로 출력</h4>
		<c:forEach begin="0" end="${list.size()-1 }" var="i">
			아이디:${list[i].id },비번:${list[i].pwd },이름:${list[i].name }<br/>
		</c:forEach>
		<h4>확장 for문 형태의 forEach태그로 출력</h4>
		<c:forEach var="item" items="${list }">
			아이디:${item.id },비번:${item.pwd },이름:${item.name }<br/>
		</c:forEach>
		<h2>맵 계열 컬렉션</h2>
		<%
		Map map = new HashMap();
		map.put("first",list.get(0));
		map.put("second",list.get(1));
		map.put("third",list.get(2));
		%>
		<c:set var="map" value="<%=map %>"/>
		<h4>키값을 알때 : el변수.키값 혹은 el변수["키값"]</h4>
		<ul>
			<li>아이디:${map.first.id },비번:${map['first'].pwd },이름:${map['first']["name"] }</li>
			<li>아이디:${map.second.id },비번:${map['second'].pwd },이름:${map['second']["name"] }</li>
			<li>아이디:${map.third.id },비번:${map['third'].pwd },이름:${map['third']["name"] }</li>
		</ul>
		<h4>키값을 모를때</h4>
		<ul>
			<c:forEach var="item" items="${map }">
				<li>키값${item.key },아이디:${item.value.id },비번:${item.value.pwd }</li>
			</c:forEach>
		</ul>
	</fieldset>
	<fieldset>
		<legend>게시판 글 읽어오기</legend>
		<table style="width: 70%; background-color: green; border-spacing: 1px">
			<tr style="background-color: white;">
				<th style="width: 10%">번호</th>
				<th>제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일</th>
			</tr>
			<c:forEach var="item" items="${my:selectList(pageContext.servletContext,1,10) }">
			<tr style="background-color: white;">
				<td>${item.no }</td>
				<td>${item.title }</td>
				<td>${item.name }</td>
				<td>${item.postDate }</td>
			</tr>
			</c:forEach>
		</table>
	</fieldset>
</body>
</html>