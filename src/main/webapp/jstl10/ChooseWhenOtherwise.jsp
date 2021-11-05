<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" uri="/WEB-INF/tld/mytag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% request.setCharacterEncoding("utf-8"); %>

<title>ChooseWhenOtherwise.jsp</title>
</head>
<body>
	<fieldset>
		<legend>choose~when~otherwise태그</legend>
		<!-- EL에서 사용할 변수 설정 -->
		<c:set var="numvar" value="99"/>
		<c:set var="strvar" value="자바"/>
		<h2>if태그로 짝/홀수 판단</h2>
		<c:if test="${numvar % 2 ==0 }" var="result">
			${numvar }는 짝수
		</c:if>
		<c:if test="${not result}">
			<!-- HTML 주석입니다 -->
			${numvar }는 홀수
		</c:if>
		<h2>choose~when~otherwise태그</h2>
		<!-- choose태그 안에 주석시 에러 (when~otherwise가능)-->
		<c:choose>
			<c:when test="${numvar % 2 ==0 }">
				${numvar }는 짝수
			</c:when>
			<c:otherwise>
				${numvar }는 홀수
			</c:otherwise>
		</c:choose>
		<h2>choose~when~otherwise태그로 문자열 비교</h2>
		<c:choose>
			<c:when test="${strvar == 'JAVA' }">
				${strvar }는 'JAVA'
			</c:when>
			<c:when test="${strvar == 'java' }">
				${strvar }는 'java'
			</c:when>
			<c:otherwise>
				${strvar }는 '자바'
			</c:otherwise>
		</c:choose>
		
		<fieldset>
			<legend>점수 확인</legend>
			<form>
				국어 <input type="text" name="kor"/>
				영어 <input type="text" name="eng"/>
				수학 <input type="text" name="math"/>
				<input type="submit" value="확인"/>
			</form>
		<!-- 국영수 점수를  받아서 평균이
		    90점이상이면 "A학점"출력
		    80점이상이면 "B학점"출력
		    70점이상이면 "C학점"출력
		    60점이상이면 "D학점"출력
		    60점미만이면 "F학점"출력.
		    단,EL과 JSTL만을 사용하여라
		   -->
		   <!-- 변수에 담기 -->
		   <c:set var="kor" value="%{param.kor}"/>
		   <c:set var="eng" value="%{param.eng}"/>
		   <c:set var="math" value="%{param.math}"/>
		   
		   <c:if test="${! empty kor && empty eng && empty math }">
		   <!-- 숫자인지 체크 -->
		   <c:if test="${my:isNumber(kor) && my:isNumber(eng) && my:isNumber(math)}" var="result">
		   		<!-- 평균 저장 -->
		   		<c:set var="avg" value="${(kor+eng+math)/3 }"/>
		   		<c:choose>
		   			<c:when test="${avg>=90 }">
		   				A학점
		   			</c:when>
 					<c:when test="${avg>=80 }">
		   				B학점
		   			</c:when>
		   			<c:when test="${avg>=70 }">
		   				C학점
		   			</c:when>
 					<c:when test="${avg>=60 }">
		   				D학점
		   			</c:when>		 
		   			<c:otherwise>
		   				F학점
		   			</c:otherwise>		   			  			
		   		</c:choose>	
		   		</c:if>	 
		   		<c:if test="${not result }">
		   			<span style="color:red;font-weight:bold">점수는 숫자만 입력하세요</span>
		   		</c:if>  		
		   </c:if>
		   
	</fieldset>
	<fieldset>
			<legend>로그인</legend>
			<form>
				아이디 <input type="text" name="user"/>
				비밀번호 <input type="password" name="pass"/>
				<input type="submit" value="로그인"/>
			</form>
			 <!--
	           회원인 경우 "?님 반갑습니다"
	           아닌 경우 "로그인후 이용하세요"출력.
	           단,자신만의 태그라이브러리를 만들어
	           EL식으로 호출하여라 그리고
	           실제 멤버 테이블을 연동(BBS게시판에서 사용했던 회원테이블 연동)하여라.
	        -->
	        <c:if test="${! empty param.user && ! empty param.pass}" >
	        <c:choose>
	        	<c:when test="${my:isMember(param.user,pageContext.servletContext,param.pass) }">
	        		${param.user }님 반갑습니다.
	        	</c:when>
     	    	<c:otherwise>
	        	로그인 후 이용하세요
	        	</c:otherwise>
	        	</c:choose>
	        </c:if>
	</fieldset>
</body>
</html>