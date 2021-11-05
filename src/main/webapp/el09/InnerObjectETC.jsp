<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectETC.jsp</title>
</head>
<body>
	<fieldset>
		<legend>EL의 기타 내장객체들</legend>
		<h2>1. EL의 pageContext</h2> <!-- set계열x, get계열만 읽어옴 -->
		<!-- JSP의 pageContext내장객체와 같다. 단,
          자바빈 규칙으로 접근 가능한 메소드만 
          제공한다.
		 -->
		<h4>자바코드로 컨텍스트 루트(/JSPProj) 얻기</h4>
		<ul>
			<li>방법1: request 내장객체 - <%=request.getContextPath() %></li>
			<%
				String context = ((HttpServletRequest)pageContext.getRequest()).getContextPath(); //getContextPath():httpservletrequest
			%>
			<li>방법2: pageContext 내장객체 - <%= context %></li>	
		</ul>
		<h4>EL로 컨텍스트 루트(/JSPProj) 얻기(형변환 필요가 없다)</h4>
		\${pageContext.request.contextPath } : ${pageContext.request.contextPath }
		<h4>자바코드로 세션의 유효시간 얻기</h4>
		<%=session.getMaxInactiveInterval() %>초<br/>
		<%=request.getSession().getMaxInactiveInterval() %>초<br/>
		<%=pageContext.getSession().getMaxInactiveInterval() %>초<br/>
		<%=((HttpServletRequest)pageContext.getRequest()).getSession().getMaxInactiveInterval() %>초
		<h4>EL로 세션의 유효시간 얻기</h4>
		\${pageContext.session.maxInactiveInterval } : ${pageContext.session.maxInactiveInterval }
		\${pageContext.request.session.maxInactiveInterval } : ${pageContext.request.session.maxInactiveInterval }
		
		<h2>2. EL의 header 내장객체</h2> <!-- 요청헤더를 얻어올때 사용함 -->
		<h4>자바코드로 요청헤더값 얻기</h4>
		<%=request.getHeader("user-agent") %>
		<h4>EL로 요청 헤더값 얻기</h4>
	   <!-- 
    	EL식으로 요청헤더명에 따른 
   		헤더 값을 출력할때는
    	header.요청헤더명이나
    	혹은 header["요청헤더명"]
                단,키값에 해당하는 요청헤더명에
               특수 문자가 들어가 있는 경우에는 
               무조건 []사용
	     -->
		\${header["user-agent"] } : ${header['user-agent'] } <!-- 특수문자 포함시 대괄호[]로 접근해야함 -->

		<h2>3. EL의 cookie 내장객체</h2>
		  <!-- 
			※EL에서는 값을 설정하거나 영역에 속성을 
			  저장(설정)하지는 못한다.
			  단지 저장된 값을 출력만 할 수 있다.
	 		-->
		<!-- EL에서 값을 설정/영역에 속성 저장은 못한다, 단지 저장된 값 출력만 가능 -->
		<%
			//쿠키 설정
			Cookie cookie = new Cookie("KOSMO","한소인");
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		%>
		<h4>자바코드로 쿠키값 읽기</h4>
		<%
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(Cookie cook:cookies){
					String name = cook.getName();
					String value = cook.getValue();
					out.println(name+":"+value+"<br/>");
				}
			}
		%>
		<h4>EL로 쿠키값 읽기</h4><!-- 반드시 쿠키명을 알아야함 -->
		 <!-- 
		 	cookie.쿠키명.value로 쿠키명에 해당하는 쿠키값을 
		 	얻을 수 있다.		 
		 -->
		\${cookie.KOSMO.value } : ${cookie.KOSMO.value }<br/>
		\${pageContext.request.cookies } : ${pageContext.request.cookies }
		<h5>JSTL을 이용해서 쿠키 배열 출력</h5>
		<c:forEach var="cook" items="${pageContext.request.cookies}">
			${cook.name} : ${cook.value}<br/>
		</c:forEach>
		
		<h2>4. EL의 initParam 내장객체</h2> <!-- context초기화 파라미터를 얻어올 수 있는 내장객체 -->
		 	<!-- 
		     	컨텍스트 초기화 파라미터를 얻어 올수 있는 내장 객체  
		   	-->
		   	<!-- 
		   [Context초기화 파라미터]
		   -Context초기화 파라미터는 ServletContext의
		    getInitParameter("파라미터명")메소드를 통해서 
		    얻는다.
		   -Context를 구성하는 모든 서블릿에서 공유할 수 있는 변수
		   [Servlet초기화 파라미터]
		   -Servlet초기화 파라미터는 ServletConfig의
		    getInitParameter("파라미터명")메소드를 통해서 얻는다
		   -해당 서블릿에서만 사용할 수 있는 변수		   
		      ※초기화 파라미터는 web.xml에 등록
		   -->		
		<h4>자바코드로 컨텍스트 초기화 파라미터 읽기</h4>
		<ul>
			<li>ORACLE_URL : <%=application.getInitParameter("ORACLE_URL") %></li>
			<li>ORACLE_DRIVER : <%=application.getInitParameter("ORACLE_DRIVER") %></li>
			<li>PAGE_SIZE : <%=application.getInitParameter("PAGE_SIZE") %></li>
			<li>BLOCK_PAGE : <%=application.getInitParameter("BLOCK_PAGE") %></li>			
		</ul>
		<h4>EL로 컨텍스트 초기화 파라미터 읽기</h4>
		<ul>
			<li>ORACLE_URL : ${initParam.ORACLE_URL }</li>
			<li>ORACLE_DRIVER : ${initParam.ORACLE_DRIVER }</li>
			<li>PAGE_SIZE : ${initParam.PAGE_SIZE }</li>
			<li>BLOCK_PAGE : ${initParam.BLOCK_PAGE }</li>			
		</ul>
		<h2>컬렉션에 저장된 객체를 EL로 출력</h2>
		<%
			MemberDTO first = new MemberDTO("KIM","1234","김길동",null,null);
			MemberDTO second = new MemberDTO("LEE","1234","이길동",null,null);
			//리스트계열 컬렉션에 객체 저장
			List<MemberDTO> list = new Vector<>();
			list.add(first);
			list.add(second);
			//맵 계열 컬렉션에 객체 저장
			Map<String,MemberDTO> map = new HashMap<>();
			map.put("first",first);
			map.put("second",second);	
		%>
		<h2>자바코드로 출력</h2>
		<h4>리스트 계열 컬렉션</h4>
		<h6>일반 for문 사용</h6>
		<ul>
			<%for(int i=0;i<list.size();i++){ %>
			<li><%=list.get(i) %></li>
			<%} %>
		</ul>
		<h6>확장 for문 사용</h6>
		<ul>
			<%for(MemberDTO member:list){ %>
			<li><%=member %></li>
			<%} %>
		</ul>
		<h4>맵 계열 컬렉션</h4>
		<ul>
			<%
			Set<String> keys = map.keySet();
			for(String key:keys){
			%>
			<li><%=key %>:<%=map.get(key) %></li>
			<%} %>
		</ul>
		<h2>EL로 출력</h2>
	   <!-- EL에서 사용할 수 있도록 JSTL을 이용해서 변수로 설정	-->
   	 	<!-- 스크립팅요소에서 선언한 변수를
	         EL식에서 사용해봤자 소용없다
	      	 JSTL을 이용해서 EL변수로 설정해야 한다.
	  	-->
		<c:set var="elList" value="<%=list%>"/>
		<c:set var="elMap" value="<%=map%>"/>
		<h4>리스트 계열 컬렉션</h4>
		<h6>JSTL 미사용</h6>
		\${elList[0]} : ${elList[0]}
		<ul>
			<li>이름:${elList[0].name},아이디:${elList[0].id},비번:${elList[0].pwd}</li>
		</ul>
		<h6>JSTL사용</h6>
		<ul>
			<c:forEach var="item" items="${elList}">
				<li>이름:${item.name},아이디:${item.id},비번:${item.pwd}</li>
			</c:forEach>
		
		</ul>
		<h4>맵 계열 컬렉션</h4>
		<h6>JSTL 미사용</h6>
		   <!-- 
	 		JSTL의 forEach사용시
	 		var에 지정한 변수명.value는 밸류값
	 		변수명.key는 키값
			-->
		\${elMap.first} : ${elMap.first}
		<h6>JSTL 사용</h6>
		<ul>
			<c:forEach var="item" items="${elMap }">
				<li>${item.key} 이름:${item.value.name},아이디:${item.value.id},비번:${item.value.pwd}</li>
			</c:forEach>
		</ul>
		<h5>컬렉션에 저장된 객체 수:el변수.size()</h5>
		<ul>
			<li>\${elList.size()} :${elList.size()} </li>
			<li>\${elMap.size()} :${elMap.size()} </li>
		</ul>
	</fieldset>
</body>
</html>