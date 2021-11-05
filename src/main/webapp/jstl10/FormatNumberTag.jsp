<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 국제화태그 라이브러리용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormatNumberTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>국제화 태그: formatNumber태그</legend>
		<c:set var="money" value="10000"/>
		<h2>필수 속성만 사용</h2>
		<h4>EL로 출력</h4>
		${money }
		<h4>JSTL 국제화 태그로 출력</h4>
		<fmt:formatNumber value="${money }"/>
		<h4>JSTL 국제화 태그로 출력:천단위 콤마(,)찍기 생략</h4>
		<fmt:formatNumber value="${money }" groupingUsed="false"/>
		<h4>type="currency"일때:현지 통화단위로 출력</h4>
		<fmt:formatNumber value="${money }" type="currency"/>
		<h4>type="currency"일때:통화단위 $로 출력</h4>
		<fmt:formatNumber value="${money }" type="currency" currencySymbol="$"/>
		<h4>type="percent"</h4>
		<!-- 숫자 * 100 -->
		<fmt:formatNumber value="${money }" type="percent"/><br/>
		<c:set var="per" value="${5/100 }"/>
		<fmt:formatNumber value="${per }" type="percent"/>
		<h4>원하는 위치에 출력하고자 할 때</h4>
		<fmt:formatNumber value="${money }" type="currency" var="price"/>
		<h4>위 가격을 아래에 출력</h4>
		가격이 <span style="color:red;font-size: 2em">${price }</span>내렸어요 
	</fieldset>
</body>
</html>