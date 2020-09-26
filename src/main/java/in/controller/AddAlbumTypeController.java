package in.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.dao.AlbumTypeDAO;
import in.dao.AlbumTypeDAOImpl;
import in.entity.AlbumType;



public class AddAlbumTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	AlbumTypeDAO albumTypeDAO = null;
	
    public AddAlbumTypeController() {
    	albumTypeDAO = new AlbumTypeDAOImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action= request.getParameter("action");
		if(action == null) {
			action = "ADD";
		}
			switch (action) {
				
			case "ADD":
				AddAlbumType(request, response);
				break;
				
			case "VIEW":
				ListViewAlbumType(request, response);
				break;
				
			case "EDIT":
				EditAlbumType(request, response);
				break;
				
			case "DELETE":
				deleteAlbumType(request,response);
				break;

			default:
				AddAlbumType(request, response);
				break;
			}			
		
	}


	private void deleteAlbumType(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String type_id = request.getParameter("id");
		if(albumTypeDAO.delete(Integer.parseInt(type_id ))) {
			request.setAttribute("message", "Deleted Successfully");
		}
		ListViewAlbumType(request, response);
		
	}

	private void EditAlbumType(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		String type_id = request.getParameter("id");
		AlbumType editaldumtype = albumTypeDAO.get(Integer.parseInt(type_id));
		request.setAttribute("editaldumtype", editaldumtype);
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/AddAlbumType.jsp");
		dispatcher.forward(request, response); 
	}

	private void ListViewAlbumType(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		List<AlbumType> listalbumtype = albumTypeDAO.get();
		request.setAttribute("listalbumtype",listalbumtype);
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/albumtype-listReport.jsp");
		dispatcher.forward(request, response);
		
		
	}

	private void AddAlbumType(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		List<AlbumType> listalbumtype = albumTypeDAO.get();
		request.setAttribute("listalbumtype",listalbumtype);
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/AddAlbumType.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type_id = request.getParameter("type_id");
		String type_name = request.getParameter("type_name");
		String type_description = request.getParameter("type_description");
		AlbumType at = new AlbumType();
		
		at.setType_name(type_name);
		at.setType_description(type_description);
		if(type_id.isEmpty() || type_id == null) {
			//save
			if(albumTypeDAO.save(at)) {
				request.setAttribute("message", "Albumtype Saved Successfully!!");
			}
		}else {
			//update
			at.setType_id(type_id);
			if(albumTypeDAO.update(at)) {
			request.setAttribute("message", "Albumtype Updated Successfully!!");
		}
	}
		ListViewAlbumType(request, response);
		
	}
	}


