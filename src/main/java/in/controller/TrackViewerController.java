package in.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.dao.AddTrackDAO;
import in.entity.AddTrack;


public class TrackViewerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AddTrackDAO addTrackDAO = null;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		addTrackDAO = new AddTrackDAO();
		String page = req.getParameter("action");
		
		if(page==null) {
			page="DISPLAY";
		}
		switch (page) {
		
		case "DISPLAY":
			displayTrack(req, resp);
			break;
			
		case "EDIT":
			getSingleTrack(req,resp);
			break;
			
		case "DELETE":
			deleteTrack(req,resp);
			break;
			
		default:
			displayTrack(req, resp);
			break;
		}
			
	}
	

	private void deleteTrack(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException  {
		
		String track_id = req.getParameter("id");
		if(addTrackDAO.delete(Integer.parseInt(track_id))) {
			req.setAttribute("message", "Record deleted Successfully");
		}
		displayTrack(req,resp);
		
	}


	private void getSingleTrack(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException  {
		
		String track_id = req.getParameter("id");
		AddTrack editTrack = addTrackDAO.get(Integer.parseInt(track_id)); 
		req.setAttribute("editTrack", editTrack);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/newtrack.jsp");
		dispatcher.forward(req, resp);
		
	}


	protected void displayTrack(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AddTrackDAO addTrackDAO = null;
		addTrackDAO = new AddTrackDAO();
		List<AddTrack> trlist =  addTrackDAO.getData();
		//System.out.println("list::"+list);
		req.setAttribute("trlist", trlist);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/track-listReport.jsp");
		dispatcher.forward(req, resp);
	}

}
