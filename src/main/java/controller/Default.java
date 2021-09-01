package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.BookDAO;
import model.DAO.UserDAO;
import model.DAO.UserStatusDAO;
import model.object.Book;
import model.object.Book_ver2;
import model.object.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			List<User> listUser = new ArrayList<User>();
			listUser = UserDAO.getUserList(1);
			request.setAttribute("listUser", listUser);
			request.getRequestDispatcher("adminPages/manageReader.jsp").forward(request, response);
			break;
		case "manageBook":
			List<Book_ver2> listBook = new ArrayList<Book_ver2>();
			try {
				listBook = BookDAO.getListBookByPagination(4, 1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("listBook", listBook);
			request.getRequestDispatcher("adminPages/manageBook.jsp").forward(request, response);
			break;
		case "manageStaff":
			List<User> listStaff = new ArrayList<User>();
			listStaff = UserDAO.getUserList(2);
			request.setAttribute("listStaff", listStaff);
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
		case "addStaff":
			request.getRequestDispatcher("adminPages/addStaff.jsp").forward(request, response);
			break;
	
		}

		response.getWriter().println("404 File not found!");
	}
}
