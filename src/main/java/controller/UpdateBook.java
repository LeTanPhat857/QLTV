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

@WebServlet("/UpdateBook")
public class UpdateBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateBook() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		//xoa sach
		Integer id = Integer.parseInt(request.getParameter("id"));
		PrintWriter printWriter = response.getWriter();
		if(BookDAO.checkBookCanDelete(id)) {
			if(BookDAO.deleteBook(id)) {
				request.getRequestDispatcher("default?page=manageBook").forward(request, response);
			}else {
				printWriter.println("fail");
			}
		}else {
			printWriter.println("error");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("default?page=UpdateBook").forward(request, response);
		
	}

}
