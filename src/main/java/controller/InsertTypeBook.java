package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.AuthorDAO;
import model.DAO.TypeDAO;
import model.object.Author;
import model.object.Type;


@WebServlet("/insertAuthorBook")
public class InsertTypeBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertTypeBook() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
		 request.setCharacterEncoding("UTF-8");
		 
		String authorBook = request.getParameter("authorBook");
		String desciptionAuthor = request.getParameter("desciptionAuthor");
		PrintWriter printWriter = response.getWriter();
		Author authorObj = new Author(0,authorBook,desciptionAuthor);
		
		if(AuthorDAO.insertAuthor(authorObj)) {
			request.getRequestDispatcher("default?page=AddNewBook").forward(request, response);
		}else {
			printWriter.println("error");
		}
	}

}
