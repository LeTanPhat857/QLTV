package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.LaguageDAO;
import model.object.Language;
@WebServlet("/insertLanguage")
public class InsertLanguage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public InsertLanguage() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
		 request.setCharacterEncoding("UTF-8");
		String language = request.getParameter("language");
		PrintWriter printWriter = response.getWriter();
		Language languageObj = new Language(1, language);
		if(LaguageDAO.insertLanguage(languageObj)) {
			request.getRequestDispatcher("default?page=AddNewBook").forward(request, response);
		}else {
			printWriter.println("error");
		}
	}
}
