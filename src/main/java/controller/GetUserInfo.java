package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.HistoryDAO;
import model.DAO.UserDAO;
import model.DAO.UserStatusDAO;
import model.object.Book;
import model.object.BorrowedBook;
import model.object.User;
import model.object.UserStatus;
import model.utils.Convert;

@WebServlet("/getUserInfo")
public class GetUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// set up response
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter printWriter = response.getWriter();
		// get user
		Integer libraryCardId = Convert.convertStringToInt(request.getParameter("libraryCardId"));
		String activity = request.getParameter("activity");

		if (libraryCardId != null) {
			User reader = UserDAO.getUserByLibraryCardId(libraryCardId);
			if (reader != null) {
				// get
				UserStatus readerStatus = UserStatusDAO.getStatusById(reader.getUserStatusId());
				List<BorrowedBook> borrowedBooks = HistoryDAO.getBorrowedBookByLibraryCardId(libraryCardId);
				LinkedList<Book> preparedBooks = new LinkedList<Book>();
				// save in session
				HttpSession session = request.getSession(true);
				session.setAttribute("reader", reader);
				session.setAttribute("readerStatus", readerStatus);
				session.setAttribute("borrowedBooks", borrowedBooks);
				session.setAttribute("preparedBooks", preparedBooks);
				// test activity
				switch (activity) {
				case "borrow":
					request.getRequestDispatcher("default?page=borrowBook").forward(request, response);
					return;
				case "pay":
					request.getRequestDispatcher("default?page=payBook").forward(request, response);
					return;
				}
			}
		}
		printWriter.println("error");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
