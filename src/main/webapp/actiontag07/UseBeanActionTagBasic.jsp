<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanActionTagBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>useBean액션태그</legend>
		
		<jsp:useBean id="member" class="model.MemberDTO" scope="request" />		
		<!-- scope영역에서 memberDTO를 가져온다 -->
		<!-- 인스턴스 변수명.속성명:member -->
		<%--
			//MemberDTO member = null; //[x]Duplicate local variable member //id="member" 먼저 선언
			
			//자바코드로 변환
			//1]scope속성에 지정한 영역에서 객체 얻기(속성명은 id에 지정한 이름으로)
			MemberDTO member = (MemberDTO)request.getAttribute("member");
			//2]영역에 존재하지 않을 때 생성
			if(member == null){
				//기본 생성자로 생성
				member = new MemberDTO();
				//생성된 객체를 scope에 지정한 영역에 저장(속성명-id에 저장한 이름)
				request.setAttribute("member", member);
			}
		--%>
		<%=member %>
		<h2>setPropoerty액션태그로 자바빈 객체 속성 설정</h2>
		<!-- name = id에서 지정한 인스턴스변수 -->
		<jsp:setProperty property="id" name="member" value="KIM"/>
		<jsp:setProperty property="name" name="member" value="김길동"/>
		<!-- 자바코드로 속성 설정 -->
		<% 
			member.setAge("20");
			member.setPwd("1234");
		%>
		<h2>속성 설정 후 출력</h2>
		<%=member %>
		<h2>getProperty액션태그로 자바빈 객체 속성 설정</h2>
		<!-- getter를 호출한 것과 같다 -->
		<ul>
			<li>아이디:<jsp:getProperty property="id" name="member"/></li>
			<li>비번:<jsp:getProperty property="pwd" name="member"/></li>
			<li>이름:<%=member.getName() %></li>
			<li>나이:<%=member.getAge() %></li>
		</ul>
	</fieldset>
	<jsp:forward page="UseBeanActionTagForward.jsp"/>
</body>
</html>