package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.BookDAO;
import model.object.Book;

@WebServlet("/confirmUpdateBook")
public class ConfirmUpdateBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ConfirmUpdateBook() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter printWriter = response.getWriter();
		Integer barCode = Integer.parseInt(request.getParameter("barCode"));
		String bookName = request.getParameter("bookName");
		Integer author = Integer.parseInt(request.getParameter("author"));
		Integer publisherId = Integer.parseInt(request.getParameter("publisherId"));
		Integer languageId = Integer.parseInt(request.getParameter("languageId"));
		Integer typeId = Integer.parseInt(request.getParameter("typeId"));
		Integer price = Integer.parseInt(request.getParameter("price"));
		Integer numpageBook = Integer.parseInt(request.getParameter("numpageBook"));
		String description = request.getParameter("description");
		String img = request.getParameter("img");
		Book book = new Book(1, barCode, bookName, numpageBook, price, description, img, new java.sql.Date(System.currentTimeMillis()), 1, publisherId, author, languageId, typeId, 1);
		if(BookDAO.updateBook(book)) {
			request.getRequestDispatcher("default?page=manageBook").forward(request, response);
		}else {
			printWriter.println("fail");
		}
	}

}
