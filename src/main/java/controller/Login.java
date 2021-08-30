package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.UserDAO;
import model.object.User;
import model.utils.Convert;

@WebServlet( "/login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // set up response
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        // get user
		Integer libraryCardId = Convert.convertStringToInt(request.getParameter("libraryCardId"));
        String password = request.getParameter("password");

        User user = null;
        if (libraryCardId != null && password.length() != 0) {
            user = UserDAO.getUserByLogin(libraryCardId, password);
        }

        // processing
        if (user == null) {
            printWriter.println("error");
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            if (user.getRoleId() == 1) {
                printWriter.println("default?page=home");
            } else {
                printWriter.println("default?page=adminHome");
            }
        }
    }
}
