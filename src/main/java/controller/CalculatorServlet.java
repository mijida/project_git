package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculatorServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int first = Integer.parseInt(req.getParameter("firstNum"));
		int second = Integer.parseInt(req.getParameter("secondNum"));
		String op = req.getParameter("operator");
		int result;
		switch(op) {
			case "+":result = first+second;break;
			case "-":result = first-second;break;
			case "*":result = first*second;break;
			default:result = first/second;
		}
		req.setAttribute("result",result);
		req.getRequestDispatcher("/HelloWorld.jsp").forward(req, resp);
	}
}
