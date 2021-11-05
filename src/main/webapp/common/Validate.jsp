<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Validate.jsp -->
<%! 
private boolean isValidate(JspWriter out,String param,String message){
	if(param==null || param.trim().length()==0){
		try{
			out.println("<script>");
			out.println("alert('"+message+"');");
			out.println("history.back();");
			out.println("</script>");
		}
		catch(IOException e){e.printStackTrace();}
		return false;
	}
	
	return true;
}//////////////
//파라미터 하나 값 여러개
private boolean isValidate(JspWriter out,String param[]){
	if(param==null){
		try{
			out.println("<script>");
			out.println("alert('관심사항을 선택하세요');");
			out.println("history.back();");
			out.println("</script>");
		}
		catch(IOException e){e.printStackTrace();}
		return false;
	}
	else{
		if(param.length < 3){
			try{
				out.println("<script>");
				out.println("alert('관심사항 3개 이상 선택하세요');");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(IOException e){e.printStackTrace();}
			return false;
		}
	}
	return true;
}//////////////

%>