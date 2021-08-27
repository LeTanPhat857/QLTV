package controller;

import model.DAO.UserDAO;
import model.object.User;
import model.utils.MailSender;
import model.utils.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet( "/resetPassword")
public class ResetPasswordController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // set up response
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        // processing
        String email = request.getParameter("email");
        String randomKey = request.getParameter("key");

        User user = UserDAO.getUserByEmail(email);

        response.sendRedirect(checkAndSendEmail(user, randomKey));
    }

    private String checkAndSendEmail(User user, String randomKey) {
        if (user != null && user.getRandomKey().contentEquals(randomKey) && UserDAO.checkGetPassTimeByEmail(user.getEmail(), 30 * 60 * 1000)) {
            String newPass = new Random().createRandomString(8);

            if (UserDAO.resetPassByEmail(user.getEmail(), newPass) && new MailSender().sendNewPassMail(user.getEmail(), newPass)) {
                if (user.getRoleId() == 1) {
                    return "default?page=home";
                } else {
                    return "default?page=staffHome";
                }
            }
        }

        return "default?page=login";
    }
}

