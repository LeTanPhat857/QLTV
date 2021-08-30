package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.HistoryDAO;
import model.object.Book;
import model.object.BorrowedBook;
import model.object.User;

@WebServlet("/borrowBook")
public class BorrowBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// set up response
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter printWriter = response.getWriter();
		// get
		HttpSession session = request.getSession(true);
		User reader = (User) session.getAttribute("reader");
		User admin = (User) session.getAttribute("admin");
		@SuppressWarnings("unchecked")
		List<Book> preparedBooks = (List<Book>) session.getAttribute("preparedBooks");
		// check preparedBooks
		if (preparedBooks != null && !preparedBooks.isEmpty()) {
			// save history in Database
			for (Book book : preparedBooks) {
				HistoryDAO.createHistory(new Date(System.currentTimeMillis()), null, "", book.getId(), reader.getId());
			}
			// update borrowedBooks and preparedBook
			List<BorrowedBook> borrowedBooks = HistoryDAO.getBorrowedBookByLibraryCardId(reader.getLibraryCardId());
			preparedBooks = new LinkedList<Book>();
			session.setAttribute("borrowedBooks", borrowedBooks);
			session.setAttribute("preparedBooks", preparedBooks);
			// response
			request.getRequestDispatcher("default?page=borrowBook").forward(request, response);
		} else {
			printWriter.println("error");			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
