package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/default")
public class Default extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        switch (page) {
            // public page
            case "home":
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;

            // staff page
            case "staffHome":
                request.getRequestDispatcher("staffPages/home.jsp").forward(request, response);
                break;
            case "registerLibraryCard":
                request.getRequestDispatcher("staffPages/registerLibraryCard.jsp").forward(request, response);
                break;
            case "borrowBook":
                request.getRequestDispatcher("staffPages/identify-borrowBook.jsp").forward(request, response);
                break;
            case "payBook":
                request.getRequestDispatcher("staffPages/identify-payBook.jsp").forward(request, response);
                break;
            case "manageReader":
                request.getRequestDispatcher("staffPages/manageReader.jsp").forward(request, response);
                break;
//            case "manageBook":
//                request.getRequestDispatcher("staffPages/manageBook.jsp").forward(request, response);
//                break;
            case "manageStaff":
                request.getRequestDispatcher("staffPages/manageStaff.jsp").forward(request, response);
                break;
//            case "systemConfig":
//                request.getRequestDispatcher("staffPages/systemConfig.jsp").forward(request, response);
//                break;
        }

        response.getWriter().println("404 File not found!");
    }
}
