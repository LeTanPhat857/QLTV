package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/UploadFileBook")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class UploadFileImageReader extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UploadFileImageReader() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	Part filePart = request.getPart("file");
		    String fileName = filePart.getSubmittedFileName();
		    System.out.println(getServletContext().getRealPath("images/"+"book"+File.separator+fileName));
		    for (Part part : request.getParts()) {
		      part.write(getServletContext().getRealPath("images/"+"book"+File.separator+fileName));
		    }
		    
	}

}
