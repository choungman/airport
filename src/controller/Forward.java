package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ActionForward")
public class Forward extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String path = null;
	
    public Forward() {
        super();
        // TODO Auto-generated constructor stub
    }
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
    
}
