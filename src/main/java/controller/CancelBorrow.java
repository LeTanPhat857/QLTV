package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.object.BorrowedBook;

@WebServlet("/cancelBorrow")
public class CancelBorrow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// set up response
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		// get session
		HttpSession session = request.getSession(true);
		// reset borrowedBooks
		session.setAttribute("preparedBooks", new LinkedList<BorrowedBook>());
		// response
		request.getRequestDispatcher("default?page=borrowBook").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
