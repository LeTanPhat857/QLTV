package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.TypeDAO;
import model.object.Type;


@WebServlet("/insertTypeBook")
public class InsertAuthorBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertAuthorBook() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
		 request.setCharacterEncoding("UTF-8");
		 
		String typeBook = request.getParameter("typeBook");
		PrintWriter printWriter = response.getWriter();
		Type typeObj = new Type(1, typeBook);
		
		if(TypeDAO.insertTypeBook(typeObj)) {
			request.getRequestDispatcher("default?page=AddNewBook").forward(request, response);
		}else {
			printWriter.println("error");
		}
	}

}
