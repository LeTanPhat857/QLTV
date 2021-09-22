package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.print.DocFlavor.READER;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.UserDAO;
import model.object.User;

@WebServlet("/updateReader")
public class updateReader extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateReader() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer libraryId = Integer.parseInt(request.getParameter("libraryCardId"));
		User user = UserDAO.getUserByLibraryCardId(libraryId);
		request.setAttribute("user", user);
		request.getRequestDispatcher("default?page=updateReader").forward(request, response);

	}

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
		User user = new User(1, libraryId, pass, name, CMND, gender, birthday, img, email, address,
				new java.sql.Date(System.currentTimeMillis()), null, null, 1, 1);
		boolean check = UserDAO.updateReader(user);
		if (check) {
			System.out.println(check);
			request.getRequestDispatcher("default?page=manageReader").forward(request, response);
		} else {
			printWriter.println("fail");
		}

	}

}
