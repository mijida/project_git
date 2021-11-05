<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachTagGeneral.jsp</title>
</head>
<body>
	<fieldset>
		<legend>일반 for문 형태의 forEach태그</legend>
		<!-- 필수 속성: begin 및 end 그리고 var속성 -->
		<h2>자바코드로 Hn태그 출력</h2>
		<%for(int i=1;i<=6;i++){%>		
		<h<%=i %>>제목<%=i %></h<%=i %>>
		<%} %>
		<h2>EL과 JSTL로 Hn태그 출력</h2>
		
		<c:forEach begin="1" end="6" var="i">
			<h${i }>제목${i }</h${i }>
		</c:forEach>
		<h2>varstatus속성</h2>
		<c:forEach begin="3" end="5" var="i" varStatus="loop">
			<h4>${loop.count }번째 반복</h4>
			<ul>
				<li>\${loop.index } : ${loop.index }</li>
				<li>\${loop.first } : ${loop.first }</li>
				<li>\${loop.last } : ${loop.last }</li>
				<li>\${loop.current } : ${loop.current }</li>
			</ul>
		</c:forEach>
		<h2>varState속성을 이용한 스타일 변경</h2>
		<c:forEach begin="1" end="6" var="i" varStatus="loop">
			<c:choose>
				<c:when test="${loop.first }">
					<c:set var="color" value="blue"/>
				</c:when>
				<c:when test="${loop.last }">
					<c:set var="color" value="cyan"/>
				</c:when>		
				<c:when test="${loop.count % 2 == 0 }">
					<c:set var="color" value="red"/>
				</c:when>		
				<c:otherwise>
					<c:set var="color" value="green"/>
				</c:otherwise>
			</c:choose>
			<h${i } style="color:${color}">제목${i }</h${i }>

		</c:forEach>
		<h2>1부터 100까지 홀수의 합(EL 및 JSTL 사용)</h2> <!-- sum을 초기화하지 않는 이유: el식에서 null값=0으로 -->
		<c:forEach begin="1" end="100" var="i">
			<c:if test="${i % 2 !=0 }">
				<c:set var="sum" value="${sum+i }"/> 
			</c:if>
		</c:forEach>
		${sum}
		<h2>for문안의 for문(중첩 for문)</h2>
		<c:forEach begin="1" end="5" var="k">
			<c:forEach begin="1" end="5" var="j">
				<c:if test="${k==j }" var="result">
					1&nbsp;&nbsp;					
				</c:if>
				<c:if test="${!result }">
					0&nbsp;&nbsp;	
				</c:if>
			</c:forEach><br/>
		</c:forEach>
		
<table border="1">
	<c:forEach var="i" begin="1" end="9" varStatus="loop">
		<c:choose>
			<c:when test="${loop.count % 2 == 0 }">
				<c:set var="color" value="red"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="color" value="yellow"></c:set>
			</c:otherwise>
		</c:choose>
        <tr onmouseover="this.style.backgroundColor=${color}" onmouseout="this.style.backgroundColor='white';">
        <c:forEach var="j" begin="2" end="9">
            <td>${j } x ${i } = ${i*j }</td>
        </c:forEach>
        </tr>
	</c:forEach>
</table>


		
	</fieldset>
</body>
</html>