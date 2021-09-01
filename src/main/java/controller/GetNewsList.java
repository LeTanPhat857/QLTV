package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.NewsDAO;
import model.object.News;
import model.utils.Convert;

@WebServlet("/getNewsList")
public class GetNewsList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// set up response
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter printWriter = response.getWriter();
		// get
		Integer page = Convert.convertStringToInt(request.getParameter("page"));
		if (page != null) {
			List<News> newsList = NewsDAO.getNews(3, page);
			if (newsList != null && newsList.size() != 0) {
				request.setAttribute("newsList", newsList);
				request.getRequestDispatcher("default?page=news").forward(request, response);				
			} else {
				printWriter.print("out");				
			}
		} else {
			printWriter.print("error");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
