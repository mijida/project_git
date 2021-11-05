<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanFormIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>로그인 화면(일치시)</legend>
		<!--
	  form의 하위요소에 입력한 값을 useBean액션태그를
	    사용하면 쉽게 받을 수 있다.
	 
	  단,form의 하위요소명(파라미터명)을 자바빈의
	  속성명과 일치 시키면 유리하다.
	  -->
		<form action="UseBeanFormResult.jsp" method="post">
			아이디 <input type="text" name="id" />
			비 번 <input type="text"	name="pwd" />
			이 름 <input type="text" name="name" />
			<input	type="submit" value="로그인" />
		</form>
	</fieldset>
	<fieldset>
		<legend>로그인 화면(불일치시)</legend>
		<form action="UseBeanFormResult.jsp" method="post">
			아이디 <input type="text" name="user" />
			비 번 <input type="text"	name="pass" />
			이 름 <input type="text" name="name" />
			<input	type="submit" value="로그인" />		
		</form>
	
	</fieldset>
</body>
</html>