package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.NewsDAO;
import model.DAO.PublisherDAO;
import model.DAO.TypeDAO;
import model.DAO.AuthorDAO;
import model.DAO.BookDAO;
import model.DAO.LaguageDAO;
import model.DAO.UserDAO;
import model.DAO.UserStatusDAO;
import model.object.Author;
import model.object.Book;
import model.object.Book_ver2;
import model.object.Language;
import model.object.Publisher;
import model.object.Type;
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
			request.setAttribute("newsList", NewsDAO.getNews(3, 1));
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
		// admin page
		case "adminHome":
			request.getRequestDispatcher("adminPages/adminHome.jsp").forward(request, response);
			break;
		case "overview":
			request.getRequestDispatcher("adminPages/overview.jsp").forward(request, response);
			break;
		case "confirmLibraryCard":
			request.setAttribute("activity", request.getParameter("activity"));
			request.getRequestDispatcher("adminPages/confirmLibraryCard.jsp").forward(request, response);
			break;
		case "manageReader":
			int quantityUserInOnePage = 4;
			List<User> listUser = new ArrayList<User>();
			int totalUser = 0;
			listUser = UserDAO.getUserList(quantityUserInOnePage, 1);
			totalUser = UserDAO.getQuantityUserInDb();
			int numPageUser = totalUser / quantityUserInOnePage;
			if (totalUser % quantityUserInOnePage != 0) {
				numPageUser++;
			}
			request.setAttribute("numPage", numPageUser);
			request.setAttribute("listUser", listUser);
			request.getRequestDispatcher("adminPages/manageReader.jsp").forward(request, response);
			break;
		case "manageBook":
			int quantityBookAtOnePage = 4;
			List<Book_ver2> listBook = new ArrayList<Book_ver2>();
			int totalBook = 0;
			try {
				listBook = BookDAO.getListBookByPagination(quantityBookAtOnePage, 1);
				totalBook = BookDAO.getQuantityBookInDb();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			int numPageBook = totalBook / quantityBookAtOnePage;
			if (totalBook % quantityBookAtOnePage != 0) {
				numPageBook++;
			}
			request.setAttribute("numPage", numPageBook);
			request.setAttribute("listBook", listBook);
			request.getRequestDispatcher("adminPages/manageBook.jsp").forward(request, response);
			break;
		case "manageStaff":
			List<User> listStaff = new ArrayList<User>();
			listStaff = UserDAO.getStaffList();
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
		case "news":
			request.getRequestDispatcher("news.jsp").forward(request, response);
			break;
		case "addStaff":
			request.getRequestDispatcher("adminPages/addStaff.jsp").forward(request, response);
			break;
		case "updateReader":
			request.getRequestDispatcher("adminPages/updateReader.jsp").forward(request, response);
			break;
		case "AddNewBook":
			List<Publisher> listPublisher = PublisherDAO.getListPublisher();
			List<Author> listAuthor = AuthorDAO.getListAuthor();
			List<Language> listLanguage = LaguageDAO.getListLanguage();
			List<Type> listType = TypeDAO.getListType();
			request.setAttribute("listLanguage", listLanguage);
			request.setAttribute("listType", listType);
			request.setAttribute("listAuthor", listAuthor);
			request.setAttribute("listPublisher", listPublisher);
			request.getRequestDispatcher("adminPages/addBook.jsp").forward(request, response);
			break;
		case "UpdateBook":
			Integer idBook = Integer.parseInt(request.getParameter("id"));
			Book book = BookDAO.getBookById(idBook);
			List<Publisher> listPublisher_ = PublisherDAO.getListPublisher();
			List<Author> listAuthor_ = AuthorDAO.getListAuthor();
			List<Language> listLanguage_ = LaguageDAO.getListLanguage();
			List<Type> listType_ = TypeDAO.getListType();
			request.setAttribute("listLanguage", listLanguage_);
			request.setAttribute("listType", listType_);
			request.setAttribute("listAuthor", listAuthor_);
			request.setAttribute("listPublisher", listPublisher_);
			request.setAttribute("book", book);
			request.getRequestDispatcher("adminPages/updateBook.jsp").forward(request, response);
			break;
		}

		response.getWriter().println("404 File not found!");
	}
}
