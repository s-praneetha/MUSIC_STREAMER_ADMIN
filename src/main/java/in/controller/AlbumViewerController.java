package in.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.dao.AddAlbumDAO;
import in.entity.AddAlbum;


public class AlbumViewerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AddAlbumDAO addAlbumDAO = null;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		addAlbumDAO = new AddAlbumDAO();
		String page = req.getParameter("action");
	
			if(page==null) {
				page="DISPLAY";
			}
			switch (page) {
			
			case "DISPLAY":
				displayList(req, resp);
				break;
				
			case "EDIT":
				getSingleAlbum(req,resp);
				break;
				
			case "DELETE":
				deleteAlbum(req,resp);
				break;
				
			default:
				displayList(req, resp);
				break;
			}
	}
	
	
	private void deleteAlbum(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException  {
		String album_id = req.getParameter("id");
		if(addAlbumDAO.delete(Integer.parseInt(album_id))) {
			req.setAttribute("message", "Record deleted Successfully");
		}
		displayList(req,resp);
	}

	private void getSingleAlbum(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException  {
	
		String album_id = req.getParameter("id");
		AddAlbum editAlbum = addAlbumDAO.get(Integer.parseInt(album_id)); 
		req.setAttribute("editAlbum", editAlbum);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/AddAlbum.jsp");
		dispatcher.forward(req, resp);
}
	
	protected void displayList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AddAlbumDAO addAlbumDAO = null;
		addAlbumDAO = new AddAlbumDAO();
		List<AddAlbum> list =  addAlbumDAO.getData();
		//System.out.println("list::"+list);
		req.setAttribute("ablist", list);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/album-listReport.jsp");
		dispatcher.forward(req, resp);
	
	}
	
}
