package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.BookDAO;
import model.DAO.UserDAO;
import model.object.Book_ver2;
import model.object.BorrowedBook;

@WebServlet("/getListBook")
public class GetBookLists extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// set up response
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter printWriter = response.getWriter();
		int indexPage = Integer.parseInt(request.getParameter("index"));
		// response
		List<Book_ver2> listBook = new ArrayList<Book_ver2>();
		int quantityBookAtOnePage = 4;
		int totalBook = 0;
		
		try {
			listBook = BookDAO.getListBookByPagination(4, indexPage);
			totalBook = BookDAO.getQuantityBookInDb();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int numPage = totalBook /quantityBookAtOnePage;
		if (totalBook %quantityBookAtOnePage != 0 ) {
			numPage++;
		}
		request.setAttribute("numPage", numPage);
		request.setAttribute("listBook", listBook);
		request.getRequestDispatcher("adminPages/manageBook.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
