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
        boolean checkEmail = UserDAO.checkEmail(userEmail);
        boolean checkTime = UserDAO.checkGetPassTimeByEmail(userEmail, 30 * 60 * 1000);

        printWriter.println(checkAndSendEmail(userEmail, checkEmail, checkTime));
    }

    private String checkAndSendEmail(String userEmail, boolean checkEmail, boolean checkTime) {
    	// email không có trong Database
        if (!checkEmail) {
            return "Email không đúng! Vui lòng kiểm tra lại Email!";
        }
        // đã gửi link lấy lại mật khẩu trong 30 gần đây
        if (checkTime) {
            return "Vui lòng truy cập vào email của bạn để lấy lại mật khẩu!";
        }
        // gửi link mới
        else {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    // tạo chuỗi ngẫu nhiên
                    String randomKey = new Random().createRandomString(120);
                    // đặt thời gian lấy lại mật khẩu và chuỗi ngẫu nhiên vào bảng user
                    new UserDAO().setGetPassTimeAndRandomKeyByEmail(userEmail, randomKey);
                    // tạo link đổi mật khẩu
                    String link = "http://localhost:8080//QuanLyThuVien/resetPassword?email=" + userEmail + "&key=" + randomKey + "\n";
                    // gửi mail
                    new MailSender().sendForgetPassMail(userEmail, link);
                }
            }).start();
            // thông báo
            return "Vui lòng truy cập vào email của bạn để lấy lại mật khẩu!";
        }
    }
}
