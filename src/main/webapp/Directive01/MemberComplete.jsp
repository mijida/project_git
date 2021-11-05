<%@page import="java.util.Arrays"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.function.Function"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%!
	private boolean isValidate(JspWriter out,String param,String message) {
	if(param==null || param.trim().length()==0){
		try{
			out.println("<script>");
			out.println("alert('"+message+"');");
			out.println("history.back();");
			out.println("</script>");
		}
		catch(IOException e){e.printStackTrace(); }
		return false;
	}
	return true;
}

	private boolean isValidate(JspWriter out,String param[]) {
	if(param==null){
		try{
			out.println("<script>");
			out.println("alert('관심사항을 선택하세요.');");
			out.println("history.back();");
			out.println("</script>");
		}
		catch(IOException e){e.printStackTrace(); }
		return false;
	}
	else{
			if(param.length<3){
				try{
					out.println("<script>");
					out.println("alert('관심사항을 3개 이상 선택하세요.');");
					out.println("history.back();");
					out.println("</script>");
				}
				catch(IOException e){e.printStackTrace();}
				return false;				
			}
	}
	return true;
}
%>
    
<%request.setCharacterEncoding("UTF-8"); 
	if(!"POST".equals(request.getMethod())){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("self.close();");
		out.println("</script>");
		return;		
	}
	String id = request.getParameter("id");
	if(!isValidate(out, id, "아이디를 입력하세요.")) return;
	String pwd = request.getParameter("pwd");
	if(!isValidate(out, pwd, "비밀번호를 입력하세요.")) return;
	String gender = request.getParameter("gender");
	if(!isValidate(out, gender, "성별을 선택하세요.")) return;
	String[] inter = request.getParameterValues("inter");
	if(!isValidate(out, inter)) return;
	String grade = request.getParameter("grade");
	if(!isValidate(out, grade, "최종학력을 선택하세요.")) return;
	String file = request.getParameter("file");
	if(!isValidate(out, file, "파일을 선택하세요.")) return;
	String self = request.getParameter("self");
	if(!isValidate(out, self, "자기소개를 입력하세요.")) return;
%> 

    
 <%@ include file="/Directive01/IncludePage.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Index.jsp</title>
<link href="../css/layout.css" rel="stylesheet"/>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div class="logo"><img src="../images/logo.jpg" alt="회사 로고 이미지" /></div>
            <div class="topMenu">
				<%@ include file="/template/Top.jsp" %>
            </div>
        </div>
        <div class="content">
            <div class="aside">
                <ul>
                    <li>서브메뉴1</li>
                    <li>서브메뉴2</li>
                    <li>서브메뉴3</li>
                    <li>서브메뉴4</li>
                    <li>서브메뉴5</li>
                    <li>서브메뉴6</li>
                </ul>
            </div>
            <div class="main">
                    <h2>회원가입 완료(<%=getDate("yyyy-MM-dd") %>)</h2>
				<table
					style="width: 100%; border-spacing: 1px; background-color: green">
					<tr style="background-color: white">
						<td style="width: 25%">아이디</td>
						<td><input type="text" name="id" size="20" value="<%=id %>" /> </td>
					</tr>
					<tr style="background-color: white">
						<td>성별</td>
						<td><input type="radio" name="gender" value="man" <%if("MAN".equals(gender.toUpperCase())) {%>checked<% }%>/>남 
						<input type="radio" name="gender" value="woman" <%if("WOMAN".equals(gender.toUpperCase())) {%>checked<% }%>/>여 
						<input type="radio" name="gender" value="trans" <%if("TRANS".equals(gender.toUpperCase())) {%>checked<% }%>/>선택안함
						</td>
					</tr>
					<tr style="background-color: white">
						<td>관심사항</td>
						<td><input type="checkbox" name="inter" value="pol" <%if(Arrays.toString(inter).indexOf("pol")!=-1) {%> checked<%} %>/>정치 <input
							type="checkbox" name="inter" value="eco" <%if(Arrays.toString(inter).indexOf("eco")!=-1) {%> checked<%} %> />경제 <input
							type="checkbox" name="inter" value="spo" <%if(Arrays.toString(inter).indexOf("spo")!=-1) {%> checked<%} %> />스포츠 <input
							type="checkbox" name="inter" value="ent" <%if(Arrays.toString(inter).indexOf("ent")!=-1) {%> checked<%} %> />연예</td>
					</tr>
					<tr style="background-color: white">
						<td>학력사항</td>
						<td><select name="grade">
								<option value="ele" <%if(grade.equals("ele")) {%>selected<%} %>>초등학교</option>
								<option value="mid" <%if(grade.equals("mid")) {%>selected<%} %>>중학교</option>
								<option value="hig" <%if(grade.equals("hig")) {%>selected<%} %>>고등학교</option>
								<option value="uni" <%if(grade.equals("uni")) {%>selected<%} %>>대학교</option>
						</select></td>
					</tr>
					<tr style="background-color: white">
						<td>첨부파일</td>
						<td><input type="file" name="file" size="40" /><%=file %></td>
					</tr>
					<tr style="background-color: white">
						<td>자기소개</td>
						<td><textarea cols="60" rows="5" name="self"><%=self %></textarea></td>
					</tr>
				</table>
			</div>
            </div>
        </div>
        <div class="footer">
            <%@ include file="/template/Footer.jsp" %>
        </div>
    </div>
       
	<%
	%>

</body>
</html>