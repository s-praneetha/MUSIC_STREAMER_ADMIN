package in.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.dao.AdminDAO;
import in.dao.AdminDAOImpl;
import in.entity.Admin;

public class VerifyCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AdminDAO adminDAO = null;
    
    public VerifyCodeController() {
        super();
        adminDAO = new AdminDAOImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
            
		HttpSession session = request.getSession();
		String authcode=(String)session.getAttribute("authcode");
		String code = request.getParameter("authcode");
		if(code.equals(authcode)){
			String AdminId = (String)session.getAttribute("AdminId");
			String username = (String)session.getAttribute("username");
			String email = 	(String)session.getAttribute("email");
			String password = 	(String)session.getAttribute("password");
			Admin a = new Admin();
			a.setAdminId(AdminId);
			a.setUsername(username);
			a.setEmail(email);
			a.setPassword(password);
			if(adminDAO.save(a)) {
				request.setAttribute("message", "Saved Successfully!!");
				RequestDispatcher dispatcher =  request.getRequestDispatcher("/HomePage.jsp");
				  dispatcher.forward(request, response);
			}
			
		}
		else {
			out.println("Incorrect verification");
			
		}
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
