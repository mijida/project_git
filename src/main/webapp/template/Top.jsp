<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
  <li>HOME</li>
  <%if(session.getAttribute("USER_ID")==null){ %>
  <li><a href="<%=request.getContextPath() %>/session06/Login.jsp">로그인</a></li>
  <%}else{ %>
  <li><a href="<%=request.getContextPath() %>/session06/Logout.jsp">로그아웃</a></li>
  <%} %>
  <li><a href="<%=request.getContextPath() %>/Directive01/Member.jsp">회원가입</a></li>
  <li>공지사항</li>
  <li><a href="<%=request.getContextPath() %>/bbs08/List.jsp">회원제게시판</a></li>
  <li>일반게시판</li>
</ul>