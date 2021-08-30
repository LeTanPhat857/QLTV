package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/default")
public class Default extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");

		switch (page) {
		// public page
		case "home":
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;

		// admin page
		case "adminHome":
			request.getRequestDispatcher("adminPages/adminHome.jsp").forward(request, response);
			break;
		case "overview":
			request.getRequestDispatcher("adminPages/overview.jsp").forward(request, response);
			break;
		case "getUserInfo":
			request.setAttribute("activity", request.getParameter("activity"));
			request.getRequestDispatcher("adminPages/getUserInfo.jsp").forward(request, response);
			break;
		case "manageReader":
			request.getRequestDispatcher("adminPages/manageReader.jsp").forward(request, response);
			break;
		case "manageBook":
			request.getRequestDispatcher("adminPages/manageBook.jsp").forward(request, response);
			break;
		case "manageStaff":
			request.getRequestDispatcher("adminPages/manageStaff.jsp").forward(request, response);
			break;
		case "config":
			request.getRequestDispatcher("adminPages/systemConfig.jsp").forward(request, response);
			break;
		case "borrowBook":
			request.getRequestDispatcher("adminPages/borrowBook.jsp").forward(request, response);
			break;
		case "payBook":
			request.getRequestDispatcher("adminPages/payBook.jsp").forward(request, response);
			break;
		case "registerLibraryCard":
			request.getRequestDispatcher("adminPages/registerLibraryCard.jsp").forward(request, response);
			break;
		}

		response.getWriter().println("404 File not found!");
	}
}
