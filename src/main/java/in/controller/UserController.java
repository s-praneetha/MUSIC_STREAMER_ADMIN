package in.controller;

import java.io.IOException;
import java.util.List;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import in.dao.UserDAO;
import in.dao.UserDAOImpl;
import in.entity.User;
//import sun.rmi.server.Dispatcher;


public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDAO userDAO = null;  
    
    public UserController() {    	
    	userDAO = new UserDAOImpl();   	
    }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String action= request.getParameter("action");
	if(action == null) {
		action = "LIST";
	}
		switch (action) {
		

		case "DELETE":
			deleteUser(request,response);
			System.out.println("Delete method");
			break;

		default:
			ListView(request, response);
			break;
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String username = 	request.getParameter("username");
	String email = 	request.getParameter("email");
	String password = 	request.getParameter("password");
	
	User u = new User();
	u.setUsername(username);
	u.setEmail(email);
	u.setPassword(password);
	if(userDAO.save(u)) {
		request.setAttribute("message", "Saved Successfully!!");
		
	}
	RequestDispatcher dispatcher =  request.getRequestDispatcher("/user-listReport.jsp");
	  dispatcher.forward(request, response);
	
	}
	public void deleteUser(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		String email = request.getParameter("email");
		if(userDAO.delete(email)) {
			request.setAttribute("message", "Record has been deleted!");
		}
		ListView(request, response);
		//response.sendRedirect("UserController");
	}
	
	public void ListView(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		
		List<User> list = userDAO.get();
	   request.setAttribute("list",list);
	    
	  RequestDispatcher dispatcher =  request.getRequestDispatcher("/user-listReport.jsp");
	  dispatcher.forward(request, response);
	}

}
