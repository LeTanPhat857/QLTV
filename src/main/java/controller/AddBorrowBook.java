package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.AuthorDAO;
import model.DAO.BookDAO;
import model.DAO.PublisherDAO;
import model.object.Author;
import model.object.Book;
import model.object.BorrowedBook;
import model.object.Publisher;
import model.object.User;
import model.utils.Convert;

@WebServlet("/addBook")
public class AddBorrowBook extends HttpServlet {
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
			if ( reader.getUserStatusId() == 1) {
				// get barcode
				Integer barcode = Convert.convertStringToInt(request.getParameter("barcode"));
				// check barcode
				if (barcode != null) {
					Book book = BookDAO.getBookByBarcode(barcode);
					// check book
					if (book != null) {
						// check status of book
						if (book.getBookStatusId() == 1) {
							// get borrowedBooks
							@SuppressWarnings("unchecked")
							List<BorrowedBook> borrowedBooks = (List<BorrowedBook>) session
									.getAttribute("borrowedBooks");
							// check borrowedBooks contains barcode
							if (!checkBorrowedBooks(borrowedBooks, barcode)) {
								// get preparedBooks
								@SuppressWarnings("unchecked")
								List<Book> preparedBooks = (List<Book>) session.getAttribute("preparedBooks");
								// check preparedBooks
								if (!checkPreparedBooks(preparedBooks, barcode)) {
									// check number of borrowed book
									if (borrowedBooks.size() + preparedBooks.size() < 3) {
										// add book
										preparedBooks.add(book);
										session.setAttribute("preparedBooks", preparedBooks);
										// get
										Author author = AuthorDAO.getAuthorById(book.getAuthorId());
										Publisher publisher = PublisherDAO.getPublisherById(book.getPublisherId());
										// sent json
										json = "{\"status\":\"ok\", \"data\":{\"date\": \""
												+ Convert.convertTimeToString(new Timestamp(System.currentTimeMillis())) + "\", \"barcode\": "
												+ book.getBarcode() + ", \"title\": \"" + book.getTitle()
												+ "\", \"author\": \"" + author.getName() + "\", \"publisher\": \""
												+ publisher.getPublisher() + "\", \"price\":\"" + Convert.convertIntToMoney(book.getPrice()) + " ??\"}}";
									} else {
										json = "{\"status\":\"error\", \"data\":\"Kh??ng th??? th??m s??ch! S??? l?????ng s??ch ?????t t???i ??a!\"}";
									}
								} else {
									json = "{\"status\":\"error\", \"data\":\"Kh??ng th??? th??m s??ch! S??ch ???? ???????c th??m v??o h??ng ?????i!\"}";
								}
							} else {
								json = "{\"status\":\"error\", \"data\":\"Kh??ng th??? th??m s??ch! S??ch ??ang ???????c m?????n!\"}";
							}
						} else {
							json = "{\"status\":\"error\", \"data\":\"Kh??ng th??? m?????n s??ch! B???n s??ch kh??ng c?? s???n!\"}";
						}
					} else {
						json = "{\"status\":\"error\", \"data\":\"M?? s??ch kh??ng t???n t???i! Vui l??ng ki???m tra l???i!\"}";
					}
				} else {
					json = "{\"status\":\"error\", \"data\":\"M?? s??ch kh??ng h???p l???! Vui l??ng ki???m tra l???i!\"}";
				}
			} else {
				json = "{\"status\":\"error\", \"data\":\"Kh??ng th??? th??m s??ch! Vui l??ng ki???m tra tr???ng th??i th??? th?? vi???n!\"}";
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

	private boolean checkPreparedBooks(List<Book> list, int barcode) {
		for (Book book : list) {
			if (book.getBarcode() == barcode) {
				return true;
			}
		}
		return false;
	}

	private boolean checkBorrowedBooks(List<BorrowedBook> list, int barcode) {
		for (BorrowedBook book : list) {
			if (book.getBarcode() == barcode) {
				return true;
			}
		}
		return false;
	}
}
