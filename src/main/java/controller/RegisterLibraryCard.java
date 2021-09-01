package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerLibraryCard")
public class RegisterLibraryCard extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("vo r ek");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("default?page=registerLibraryCard").forward(request, response);
	}
}
