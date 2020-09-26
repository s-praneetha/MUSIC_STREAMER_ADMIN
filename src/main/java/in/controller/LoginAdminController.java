package in.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.dao.LoginAdminDAO;
import in.dao.LoginAdminDAOImpl;
import in.entity.Admin;

public class LoginAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LoginAdminDAO loginadminDAO = null;
	
	 public LoginAdminController() {
		
		loginadminDAO = new LoginAdminDAOImpl();
	
	 }
 

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Admin admin = new Admin();
		admin.setEmail(req.getParameter("email"));
		admin.setPassword(req.getParameter("password"));
		HttpSession session=req.getSession();
		
		String status =  loginadminDAO.authenticate(admin);
		
		if(status.equals("true")) {
			session.setAttribute("email",admin.getEmail());
			session.setAttribute("username",admin.getUsername());
			resp.sendRedirect("HomePage.jsp");
		}
		
		if(status.equals("false")) {
			resp.sendRedirect("AdminLogin.jsp?status=false");
		}
		if(status.equals("error")) {
			resp.sendRedirect("AdminLogin.jsp?status=error");
		}
		
	}

}
