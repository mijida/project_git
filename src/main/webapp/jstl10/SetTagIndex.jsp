<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SetTagIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그</legend>
		<!-- var속성: 문자열만 / value속성:모두가능 / scope속성:문자열만(page(default),request,session,application) -->
		<h2>set태그로 EL에서 사용할 변수 설정</h2>
		<ul>
			<li>value속성에 직접 값 설정 : <c:set var="directvar" value="100"/> </li> <!-- scope:default(page) -->
			<li>value속성에 EL로 값 설정 : <c:set var="elvar" value="${directvar}"/> </li>
			<li>value속성에 표현식으로 값 설정 : <c:set var="expvar" value="<%=new java.sql.Date(new Date().getTime()) %>"/> </li>
			<li>시작태그와 종료태그 사이에 값 설정 : <c:set var="betweenvar"><h3>시작태그와 종료태그</h3>사이에 값을 설정합니다</c:set></li>			
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 설정한 값 출력하기</legend>
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul>
			<li>directvar : <%=pageContext.getAttribute("directvar") %></li>
			<li>elvar : <%=pageContext.getAttribute("elvar") %></li>
			<li>expvar : <%=pageContext.getAttribute("expvar") %></li>
			<li>betweenvar : <%=pageContext.getAttribute("betweenvar") %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul>
			<li>directvar : ${pageScope.directvar}</li>
			<li>elvar : ${elvar}</li>
			<li>expvar : ${expvar}</li>
			<li>betweenvar : ${betweenvar}</li>
		</ul>
	</fieldset>
	<fieldset>
		<legend>set태그로 각 영역에 객체 저장</legend>
		<c:set var="pagevar" value="페이지 영역"/>
		<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>
		<c:set var="sessionvar" value="세션 영역" scope="session"/>
		<c:set var="applicationvar" value="어플리케이션 영역" scope="application"/>
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul>
			<li>pagevar : <%=pageContext.getAttribute("pagevar") %></li>
			<li>requestvar : <%=request.getAttribute("requestvar") %></li>
			<li>sessionvar : <%=session.getAttribute("sessionvar") %></li>
			<li>applicationvar : <%=application.getAttribute("applicationvar") %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul>
			<li>pagevar : ${pagevar}</li>
			<li>requestvar : ${requestvar}</li>
			<li>sessionvar : ${sessionvar}</li>
			<li>applicationvar : ${applicationvar}</li>
		</ul>		
	</fieldset>
	<fieldset>
		<legend>set태그로 자바빈 객체 설정</legend>
		<h2>기본 생성자로 생성</h2>
		<c:set scope="request" var="defaultmember" value="<%=new MemberDTO() %>"/>
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul>
			<li>이름:<%=((MemberDTO)request.getAttribute("defaultmember")).getName() %></li>
			<li>아이디:<%=((MemberDTO)request.getAttribute("defaultmember")).getId() %></li>
			<li>비번:<%=((MemberDTO)request.getAttribute("defaultmember")).getPwd() %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul>
			<li>이름:${defaultmember.name}</li>
			<li>아이디:${defaultmember.id}</li>
			<li>비번:${defaultmember.pwd}</li>
		</ul>
		<h2>인자 생성자로 생성</h2>
		<c:set scope="request" var="argsmember" value='<%=new MemberDTO("KIM","1234","김길동",null,null) %>'/>
		<h2>스크립팅 요소(자바코드)로 출력</h2>
		<ul>
			<li>이름:<%=((MemberDTO)request.getAttribute("argsmember")).getName() %></li>
			<li>아이디:<%=((MemberDTO)request.getAttribute("argsmember")).getId() %></li>
			<li>비번:<%=((MemberDTO)request.getAttribute("argsmember")).getPwd() %></li>
		</ul>
		<h2>EL로 출력</h2>
		<ul>
			<li>이름:${argsmember.name}</li>
			<li>아이디:${argsmember.id}</li>
			<li>비번:${argsmember.pwd}</li>
		</ul>
		<!--
		set태그의 target속성과 property속성은
		자바빈 객체나 
		컬렉션계열 객체 설정할때 (ex: target:map / property:key)
		사용할 수 있는 속성.
		
		※target속성:반드시 EL식이나 표현식만 가능 (문자열 금지)
		 property속성:값(문자열),표현식,EL식 모두 가능.
		 자바빈인 경우- 속성명(멤버변수명)
		 Map컬렉션 - 키값  	
		
		※scope속성은 var속성을 지정한 set태그에서만 설정 가능
	 -->
		<!-- target과 property를 사용해서
	         자바빈이나 컬렉션에 값을 설정할때는
	         var속성을 지정하면 안된다.
	 -->
		<!-- target속성과 property속성을 이용해서
	            자바빈 객체의 속성값 설정
	  -->
	  <c:set target="${defaultmember}" property="id" value="PARK"/>
	  <!-- =defaultmember.setid -->
	  <c:set target="${defaultmember}" property="pwd" value="1234"/>
	  <c:set target="${defaultmember}" property="name" value="박길동"/>
	  <h2>target속성과 property속성으로 값 설정후 EL로 출력</h2>
  		<ul>
			<li>이름:${defaultmember.name}</li>
			<li>아이디:${defaultmember.id}</li>
			<li>비번:${defaultmember.pwd}</li>
		</ul>
		<%
		//리스트 계열 컬렉션
		List list = new Vector();
		list.add(request.getAttribute("defaultmember"));
		list.add(request.getAttribute("argsmember"));
		%>
		<c:set var="list" value="<%=list %>" scope="request"/>
		<h4>속성값 변경 전 출력</h4>
		<ul>
			<li>이름:${list[0].name}</li>
			<li>아이디:${list[0].id}</li>
			<li>비번:${list[0].pwd}</li>
		</ul>
		<h4>target 및 property속성으로 값 변경 전 출력</h4>
		<c:set target="${list[0]}" property="name" value="한소인"/>
		<c:set target="${list[0]}" property="id" value="KOSMO"/>
		<c:set target="${list[0]}" property="pwd" value="1234"/>
		<ul>
			<li>이름:${list[0].name}</li>
			<li>아이디:${list[0].id}</li>
			<li>비번:${list[0].pwd}</li>
		</ul>
		<%
			//맵 계열 컬렉션
			Map map = new HashMap();
			map.put("default",request.getAttribute("defaultmember")); //default:el의 예약어
			map.put("args",request.getAttribute("argsmember"));
		%>
		<c:set var="map" value="<%=map %>" scope="request" />
		<h4>속성값 변경 전 출력</h4>
		<ul>
		<!-- default가 EL스펙의 예약어라서 대괄호로만 접근해야함 -->
			<li>이름:${map['default'].name}</li>
			<li>아이디:${map["default"]['id']}</li>
			<li>비번:${map['default'].pwd}</li>
		</ul>
		<h4>target 및 property속성으로 값 변경</h4>
		<c:set target="${map['default']}" property="name" value="한소인2"></c:set>
		<c:set target="${map['default']}" property="id" value="KOSMO2"></c:set>
		<c:set target="${map['default']}" property="pwd" value="0000"></c:set>
		<ul>
		<!-- default가 EL스펙의 예약어라서 대괄호로만 접근해야함 -->
			<li>이름:${map['default'].name}</li>
			<li>아이디:${map["default"]['id']}</li>
			<li>비번:${map['default'].pwd}</li>
		</ul>
	</fieldset>
	<jsp:forward page="SetTagResult.jsp">
		<jsp:param value="android" name="subject"/>
	</jsp:forward>
</body>
</html>
