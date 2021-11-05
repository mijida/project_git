<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IfTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>if 태그</legend>
		<c:set value="99" var="numvar"/>
		<c:set value="JSTL" var="strvar"/>
		<c:if test="${numvar mod 2 eq 0 }" var="result"> <!-- test식의 결과값이 result에 저장됨 (false),(page영역에 저장)-->
			${numvar }는 짝수<br/>  <!-- if문이 참이라면 출력 -->
		</c:if>
		<c:if test="${not result}"> <!-- else효과 -->
			${numvar }는 홀수<br/>
		</c:if>
		\${result } : ${result }<br/>
		<h2>위의 if문(JSTL)을 EL의 삼항 연산자로 변경</h2>
		${numvar }는 ${numvar mod 2 eq 0 ? "짝수" : '홀수'}
		<h2>문자열 비교</h2>
		<c:if test="${strvar =='제이에스티엘' }">
			${strvar }는 '제이에스티엘'이다
		</c:if>
		<c:if test="${strvar =='jstl' }">
			${strvar }는 'jstl'이다
		</c:if>
		<c:if test="${strvar =='JSTL' }"> <!-- =${true} -->
			${strvar }는 'JSTL'이다<br/>
		</c:if>
		<c:if test="${ true   }">
			항상 출력되는 HTML
		</c:if>
		<c:if test="${false}">
			항상 출력되지 않는 HTML
		</c:if>
		<!-- test속성에 일반식 넣으면 무조건 false (문자열'true'제외) EL식도 \${}양쪽에 공백있으면 false -->
		<h2>test속성에 일반 값으로 조건 설정</h2>
		<c:if test="100" var="result">
			100은 참이다
		</c:if>
		\${result } : ${result }<br/>
		<c:if test="trUe" var="result">
			true는 참이다
		</c:if>
		\${result } : ${result }<br/>
		<c:if test="100>10" var="result">		
		</c:if>
		\${result } : ${result }<br/>
		<h2>EL로 조건 설정 시 \${}바깥 양쪽에 공백이 있으면 조건이 참이더라도 무조건 거짓</h2>
		<c:if test="${100>10}" var="result">
			100은 참이다		
		</c:if>
		\${result } : ${result }<br/>
		<h2>if태그 연습</h2>
		
		<c:if test = "${!empty param.user && not empty param.pass}">
			<c:if test="${param.user=='KIM' && param.pass=='1234'}" var="result">
				${param.user}님 즐감하세요
			</c:if>
			<c:if test="${!result}">
				아디와 비번이 틀려요
			</c:if>
		</c:if>
	</fieldset>
</body>
</html>