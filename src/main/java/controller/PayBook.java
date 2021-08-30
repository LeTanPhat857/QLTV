package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.BorrowDAO;
import model.DAO.HistoryDAO;
import model.object.Book;
import model.object.BorrowedBook;
import model.object.User;

@WebServlet("/payBook")
public class PayBook extends HttpServlet {
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
			// save history in Database and update bookStatus
			for (Book book : preparedBooks) {
				boolean result = HistoryDAO
						.updatePayHistoryAndUpdateBookStatus(new Timestamp(System.currentTimeMillis()), book.getId());

				if (!result) {
					printWriter.println("databaseError");
					return;
				}
			}
			// update borrowedBooks and preparedBook
			List<BorrowedBook> borrowedBooks = HistoryDAO.getBorrowedBookByLibraryCardId(reader.getLibraryCardId());
			preparedBooks = new LinkedList<Book>();
			session.setAttribute("borrowedBooks", borrowedBooks);
			session.setAttribute("preparedBooks", preparedBooks);
			// response
			request.getRequestDispatcher("default?page=payBook").forward(request, response);
		} else {
			printWriter.println("bookError");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
