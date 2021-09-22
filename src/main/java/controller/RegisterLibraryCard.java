package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.UserDAO;
import model.object.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Date;

@WebServlet("/registerLibraryCard")
public class RegisterLibraryCard extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter printWriter = response.getWriter();
		Integer libraryId = Integer.parseInt(request.getParameter("libraryCardId"));
		String pass = request.getParameter("password");
		String name = request.getParameter("name");
		String CMND = request.getParameter("CMND");
		String gender = request.getParameter("gender");
		Date birthday = Date.valueOf(request.getParameter("birthday"));
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String img = request.getParameter("img");
		if(UserDAO.checkLibraryCardId(libraryId)) {
			User user = new User(1, libraryId, pass, name, CMND, gender, birthday, img, email, address, new java.sql.Date(System.currentTimeMillis()), null, null, 1, 1);
			boolean check = UserDAO.insertReader(user);
			if (check) {
				request.getRequestDispatcher("default?page=manageReader").forward(request, response);
			}else {
				printWriter.println("fail");
			}
		}else {
			printWriter.println("error");
			}
		}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("default?page=registerLibraryCard").forward(request, response);
	}
}
