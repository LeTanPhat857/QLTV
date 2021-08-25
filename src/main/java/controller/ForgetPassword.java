package controller;

import model.DAO.UserDAO;
import model.utils.MailSender;
import model.utils.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet( "/forgetPassword")
public class ForgetPassword extends HttpServlet {
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
        PrintWriter printWriter = response.getWriter();
        // get user email
        String userEmail = request.getParameter("email");
        // processing
        UserDAO userDAO = new UserDAO();
        boolean checkEmail = userDAO.checkEmail(userEmail);
        boolean checkTime = userDAO.checkGetPassTimeByEmail(userEmail, 30 * 60 * 1000);

        printWriter.println(checkAndSendEmail(userEmail, checkEmail, checkTime));
    }

    private String checkAndSendEmail(String userEmail, boolean checkEmail, boolean checkTime) {
        // email khÃ´ng cÃ³ trong Database
        if (!checkEmail) {
            return "Email khÃ´ng Ä‘Ãºng! Vui lÃ²ng kiá»ƒm tra láº¡i Email!";
        }
        // Ä‘Ã£ gá»­i link láº¥y láº¡i máº­t kháº©u trong 30 gáº§n Ä‘Ã¢y
        if (checkTime) {
            return "Vui lÃ²ng truy cáº­p vÃ o email cá»§a báº¡n Ä‘á»ƒ láº¥y láº¡i máº­t kháº©u!";
        }
        // gá»­i link má»›i
        else {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    // táº¡o chuá»—i ngáº«u nhiÃªn
                    String randomKey = new Random().createRandomString(120);
                    // Ä‘áº·t thá»�i gian láº¥y láº¡i máº­t kháº©u vÃ  chuá»—i ngáº«u nhiÃªn vÃ o báº£ng user
                    new UserDAO().setGetPassTimeAndRandomKeyByEmail(userEmail, randomKey);
                    // táº¡o link Ä‘á»•i máº­t kháº©u
                    String link = "http://localhost:8080//QuanLyThuVien/resetPassword?email=" + userEmail + "&key=" + randomKey + "\n";
                    // gá»­i mail
                    new MailSender().sendForgetPassMail(userEmail, link);
                }
            }).start();
            // thÃ´ng bÃ¡o
            return "Vui lÃ²ng truy cáº­p vÃ o email cá»§a báº¡n Ä‘á»ƒ láº¥y láº¡i máº­t kháº©u!";
        }
    }
}
