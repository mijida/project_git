<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private String codeToValue(String code){
		switch(code.toUpperCase()){
			case "ECO": return "경제";
			case "POL": return "정치";
			case "SPO": return "스포츠";
			default: return "연예";		
		}
}
%>
<%
	//POST방식일때 아래 코드 추가(한글처리용)]
	request.setCharacterEncoding("UTF-8");
	
	/*
	※getParameter계열 메소드가 null을 반환하거나 빈 문자열을 반환 하는 경우
	
	1]parameter를 전달하지 않거나 파라미터명이 틀린 경우 null반환
	2]Text박스 계열인 경우 값을 입력 안하고 전송한 경우 빈 문자열("") 반환
	3]선택 계열인 radio박스나 checkbox등인 경우 미 선택시에는 
	  null반환(왜냐하면 파라미터가 전달이 안되니까)	
	※name이 같은 form의 하위요소의 여러값을 받을때는 getParameterValues()
	 단, type="radio"처럼 하나의 이름으로 하나의 값을 전달할때는 getParameter()로 받아도 된다.
	*/
	
	//파라미터 받기
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] inter = request.getParameterValues("inter");
	//out.println(String.format("name:%s,gender:%s,inter:%s",name,gender,inter));
	String values = "";
	if(name != null && name.trim().length() != 0 && gender != null && inter != null){
		values = String.format("이름:%s,성별:%s,관심사항:",name,gender);
		for(String value:inter) values+=codeToValue(value)+" ";
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForParameter.jsp</title>
<!-- 파라미터 변수처럼 사용 -->
</head>
<body>
	<fieldset>
		<legend>사용자가 전송한 파라미터와 관련된 request객체의 메소드</legend>
		<h3>form태그를 이용한 값 전송</h3>
		<form method="post">
			<table cellspacing="1" bgcolor="gray">
				<tr bgcolor="white">
					<td>이름</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr bgcolor="white">
					<td>성별</td>
					<td>
					남<input type="radio" name="gender" value="남자" />
					여<input type="radio" name="gender" value="여자" />
					</td>
				</tr>
				<tr bgcolor="white">
					<td>관심사항</td>
					<td>
					<!-- 자바의 배열 -->
					경제<input type="checkbox" name="inter" value="eco" />
					정치<input type="checkbox" name="inter" value="pol" />
					스포츠<input	type="checkbox" name="inter" value="spo" />
					연예<input type="checkbox" name="inter" value="ent" />
					</td>
				</tr>
				<tr bgcolor="white" align="center">
					<td colspan="2"><input type="submit" value="확인" /></td>
				</tr>
			</table>
		</form>
		<!--값 출력-->
		<%=values %>
		<h3>A태그를 이용한 값 전송</h3>
		<a href="RequestForParameter.jsp?name=홍길동&gender=남&inter=spo&inter=ent">GET</a>
		<h3>모든 파라미터명 얻기</h3>
		<!--
			-request객체의 getParameterNames()메소드로 얻는다
			-파라미터명 존재여부 판단-->
		<ul style="list-style-type: upper-roman;">
			<%
				Enumeration<String> names = request.getParameterNames();
				while(names.hasMoreElements()){
					//파라미터명 얻기
					String paramName = names.nextElement();
					//파라미터값 얻기
					if(paramName.equals("inter")){
						String[] inters = request.getParameterValues(paramName);
						String paramValues = "";
						for(String code:inters) paramValues+=codeToValue(code)+" ";
						out.println("<li>"+paramName+" : "+paramValues+"</li>");
					}
					else{
						String paramValue = request.getParameter(paramName);
						out.println("<li>"+paramName+" : "+paramValue+"</li>");
					}
				}
			%>
		</ul>
	</fieldset>
	<h2>맵으로 모든 파라미터 받기</h2>
	<ul style="list-style-type: upper-roman;">
		<%
		
			//키값:파라미터명
			//value:사용자가 입력하거나 선택한 값
			//getParameterMap():많은 파라미터가 있을때 한꺼번에 받을때 유리
			Map<String,String[]> params = request.getParameterMap();
			//파라미터명 얻기
			Set<String> paramNames= params.keySet();
			for(String paramName:paramNames){
				if(paramName.equals("inter")){
					String[] inters = request.getParameterValues(paramName);
					String paramValues = "";
					for(String code:inters) paramValues+=codeToValue(code)+" ";
					out.println("<li>"+paramName+" : "+paramValues+"</li>");
				}
				else{
					String paramValue = request.getParameter(paramName);
					out.println("<li>"+paramName+" : "+paramValue+"</li>");
				}
			}
		%>
		
		
	</ul>
</body>
</html>