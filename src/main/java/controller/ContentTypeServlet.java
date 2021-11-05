package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentTypeServlet extends HttpServlet {
	//[JSP로 페이지 이동 안하고 서블릿에서 웹브라우저로 직접 출력]		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=UTF-8");
		//웹브라우저로 출력하기위한 출력 스트림 생성]
		PrintWriter out= resp.getWriter();
		//웹브라우저로 출력]
		out.println("<h2>서블릿에서 웹브라우저로 출력하기</h2>");
		//스트림 닫기]
		out.close();
		
	}
}