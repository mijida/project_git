<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormatDateTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>국제화 태그:formatDate태그</legend>
		<c:set var="today" value="<%=new Date() %>"/>
		<h2>필수 속성만 사용</h2>
		<h4>EL로 출력</h4>
		\${today} : ${today}
		<h4>JSTL의 formatDate태그로 출력</h4>
		<fmt:formatDate value="${today }"/>
		<h4>type="date"(디폴트),dateStyle="default"</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="default"/>
		<h4>type="date"(디폴트),dateStyle="short"</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="short"/>
		<h4>type="date"(디폴트),dateStyle="medium"</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="medium"/>
		<h4>type="date"(디폴트),dateStyle="long"</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="long"/>
		<h4>type="date"(디폴트),dateStyle="full"</h4>
		<fmt:formatDate value="${today }" type="date" dateStyle="full"/>
		<hr/>
		<h4>type="time"(디폴트)</h4>
		<fmt:formatDate value="${today }" type="time" />
		<h4>type="time"(디폴트),timeStyle="short"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="short"/>
		<h4>type="time"(디폴트),timeStyle="medium"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="medium"/>
		<h4>type="time"(디폴트),timeStyle="long"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="long"/>
		<h4>type="time"(디폴트),timeStyle="full"</h4>
		<fmt:formatDate value="${today }" type="time" timeStyle="full"/>
		<h2>pattern속성 - type속성 의미없다(주로 사용)</h2>
		<fmt:formatDate value="${today }" pattern="yyyy-MM dd a HH:mm:ss"/><br/>
		<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일"/><br/>
		<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 HH시입니다"/><br/>
		<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 EEEE" /><br/>
		<h2>var속성 지정해서 원하는 위치에 출력</h2>
		<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 EEEE" var="promise"/>
		<h4>아래에 출력</h4>
		모임 날짜는 <span style="color:red;font-size: 1.5em">${promise }</span>입니다.
	</fieldset>

</body>
</html>