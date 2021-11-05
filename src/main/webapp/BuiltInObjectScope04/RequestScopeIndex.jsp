<%@page import="model.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/* 
	파라미터로 넘어온 값을 읽을때는 한글처리를 위해
	반드시 request.setCharacterEncoding("문자인코딩셋")로 처리
	단, 영역에 저장된 값을 읽어 올때는 한글처리 불필요. 
	
	모든 영역(페이지,리퀘스트,세션,어플리케이션)에는 
	모든 타입(Object)의 객체 저장 가능
	파라미터로 값을 전달할때는 문자열만 가능
	
	※request영역에 저장한 속성은 해당 요청에 대한 응답이 완료되면 소멸된다
	 request영역에는 request객체(HttpServletRequest타입)존재
	*/ 
	//리퀘스트 영역에 속성 저장]
	request.setAttribute("requestInteger", new Integer(10));
	request.setAttribute("requestString", "페이지 영역에 저장된 문자열");
	request.setAttribute("requestDate", new Date(new java.util.Date().getTime()));
	request.setAttribute("requestMemberFirst",new MemberDTO("KIM","1234","김길동",null,"20"));
	request.setAttribute("requestMemberSecond",new MemberDTO("PARK","1234","박길동",null,"20"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestScopeIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>request영역</legend>
		<h2>리퀘스트 영역에 저장된 속성읽기</h2>
		<%
			Object object = request.getAttribute("requestMemberFirst");
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
		<h2>리퀘스트 영역에 저장된 속성 삭제 후 읽기</h2>
		<%
			request.removeAttribute("NoKey");
			request.removeAttribute("requestInteger");
			request.removeAttribute("requestString");
		%>
		<ul>
			<li>Integer타입:<%=request.getAttribute("requestInteger") %></li>
			<li>String타입:<%=request.getAttribute("requestString") %></li>
			<li>Date타입:<%=request.getAttribute("requestDate") %></li>
			<li>MemberDTO타입 1:<%=firstMemberString %></li>
			<li>MemberDTO타입 2:<%=second %></li>
		</ul>
		<h2>페이지 이동</h2>
		<a href="RequestScopeResult.jsp">사용자 클릭에 의한 이동</a>
		
	</fieldset>
</body>
</html>
<%
	//[사용자 클릭이 아닌 서버측에서 자동으로 페이지 이동하는 방법]
	//[forward방식]
	/*
	 -최초 요청시 생성된 request객체를 포워드되는
	   페이지로 전달한다.
	 -고로 포워드 되는 페이지와 리퀘스트 영역을
	   공유한다
	 -URL주소창에는 최초 요청한 URL이 보인다.
	 (포워드된 URL아님)
	*/
	//자동으로 이동할 페이지 설정]-절대 경로 지정시 컨텍스트 루트 제외
	//RequestDispatcher dispatcher= request.getRequestDispatcher("/BuiltInObjectScope04/RequestScopeResult.jsp");
	//포워드
	//dispatcher.forward(request, response);
	//[redirect방식]
	/*
     - location.href로 이동한 것과 같다
     - 즉 새로운 요청이다.
     - 고로 리퀘스트영역이 공유가 안된다.
     - URL주소창에는 리다이렉트된 최종 URL이 보인다.  
     - 절대경로 지정시 반드시 컨텍스트 루트 포함
    */
	response.sendRedirect(request.getContextPath()+"/BuiltInObjectScope04/RequestScopeResult.jsp");
%>
