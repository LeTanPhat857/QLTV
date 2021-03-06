package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.BookDAO;
import model.object.Book;
import model.object.BorrowedBook;
import model.object.User;
import model.utils.Convert;

@WebServlet("/chooseBook")
public class ChooseBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// set up response
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter printWriter = response.getWriter();
		String json = "";
		// get session
		HttpSession session = request.getSession(true);
		// get reader
		User reader = (User) session.getAttribute("reader");
		if (reader != null) {
			// get barcode
			Integer barcode = Convert.convertStringToInt(request.getParameter("barcode"));
			// check barcode
			if (barcode != null) {
				Book book = BookDAO.getBookByBarcode(barcode);
				// check book
				if (book != null) {
					// get borrowedBooks
					@SuppressWarnings("unchecked")
					List<BorrowedBook> borrowedBooks = (List<BorrowedBook>) session.getAttribute("borrowedBooks");
					int borrowIndex = checkBorrowedBooks(borrowedBooks, barcode);
					// check borrowedBooks contains barcode
					if (borrowIndex != -1) {
						// get preparedBooks
						@SuppressWarnings("unchecked")
						List<Book> preparedBooks = (List<Book>) session.getAttribute("preparedBooks");
						int prepareIndex = checkPreparedBooks(preparedBooks, barcode);
						// check preparedBooks
						if (prepareIndex != -1) {
							preparedBooks.remove(prepareIndex);
							json = "{\"status\":\"ok\"}";
						} else {
							preparedBooks.add(book);
							json = "{\"status\":\"ok\"}";
						}
					} else {
						json = "{\"status\":\"error\", \"data\":\"Kh??ng th??? ch???n s??ch! S??ch ch??a ???????c m?????n!\"}";
					}
				} else {
					json = "{\"status\":\"error\", \"data\":\"M?? s??ch kh??ng t???n t???i! Vui l??ng ki???m tra l???i!\"}";
				}
			} else {
				json = "{\"status\":\"error\", \"data\":\"M?? s??ch kh??ng h???p l???! Vui l??ng ki???m tra l???i!\"}";
			}
		} else {
			json = "{\"status\":\"error\", \"data\":\"Th???i gian ch??? ???? h???t! Vui l??ng th???c hi???n quay l???i x??c nh???n th??? th?? vi???n!\"}";
		}
		// return json
		printWriter.println(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private int checkPreparedBooks(List<Book> list, int barcode) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getBarcode() == barcode) {
				return i;
			}
		}
		return -1;
	}

	private int checkBorrowedBooks(List<BorrowedBook> list, int barcode) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getBarcode() == barcode) {
				return i;
			}
		}
		return -1;
	}
}
