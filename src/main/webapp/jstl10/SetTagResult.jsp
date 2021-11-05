<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SetTagResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그로 설정한 객체를 EL로 출력</legend>
		<h2>xxxxvar계열</h2>
		<ul style="list-style: upper-roman;">
			<li>pagevar:${pagevar }</li>
			<li>requestvar:${requestvar }</li>
			<li>sessionvar:${sessionvar }</li>
			<li>applicationvar:${applicationvar }</li>
		</ul>
		<h2>MemberDTO계열(argsmember출력)</h2>
		<ul style="list-style: upper-roman;">
			<li>아이디:${argsmember.id }</li>
			<li>비번:${argsmember.pwd }</li>
			<li>이름:${argsmember.name }</li>
		</ul>
		<h2>리스트 계열 컬렉션(인덱스가 1인 객체 출력)</h2>
		<ul style="list-style: upper-roman;">
			<li>아이디:${list[1].id }</li>
			<li>비번:${list[1].pwd }</li>
			<li>이름:${list[1].name }</li>
		</ul>
		<h2>맵 계열 컬렉션(키값이 'args'인 객체 출력)</h2>
		<ul style="list-style: upper-roman;">
			<li>아이디:${map[args].id }</li>
			<li>비번:${map[args].pwd }</li>
			<li>이름:${map[args].name }</li>
		</ul>
		<h2>파라미터</h2>		
		${param.subject }
	</fieldset>
</body>
</html>