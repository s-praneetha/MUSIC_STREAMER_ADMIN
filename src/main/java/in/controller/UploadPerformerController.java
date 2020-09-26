package in.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.dao.PerformerDAO;
import in.dao.PerformerDAOImpl;
import in.entity.Performer;


public class UploadPerformerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	PerformerDAO performerDAO = null;
   
    public UploadPerformerController() {
        performerDAO = new PerformerDAOImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");
		if(action == null) {
			action = "ADD";
		}
			switch (action) {
			
			case "ADD":
				AddPerformer(request, response);
				break;
				
			case "VIEW":
				ListViewPerformer(request, response);
				break;
				
			case "EDIT":
				EditPerformer(request, response);
				break;
				
			case "DELETE":
				deletePerformer(request,response);
				break;

			default:
				AddPerformer(request, response);
				break;
			}			
			
	}	
	private void deletePerformer(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		String performer_id = request.getParameter("id");
		if(performerDAO.delete(Integer.parseInt(performer_id ))) {
			request.setAttribute("message", "Deleted Successfully");
		}
		ListViewPerformer(request,response);
	}


	public void Dropdown(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		
		try {
			List<Performer> listperformer = performerDAO.get();
			 request.setAttribute("list",listperformer);
			 RequestDispatcher dispatcher =  request.getRequestDispatcher("/AddTrack.jsp");
			  dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
	}
	
	private void EditPerformer(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String performer_id = request.getParameter("id");
		Performer editperformer = performerDAO.get(Integer.parseInt(performer_id));
		request.setAttribute("editperformer", editperformer);
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/AddPerformer.jsp");
		dispatcher.forward(request, response); 
		
	}


	public void AddPerformer(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
			
		try {
			List<Performer> listperformer = performerDAO.get();
			 request.setAttribute("list",listperformer);
			 RequestDispatcher dispatcher =  request.getRequestDispatcher("/AddPerformer.jsp");
			  dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String performer_id = request.getParameter("performer_id");
		String performer_name = request.getParameter("performer_name");
		String performer_description = request.getParameter("performer_description");
		Performer p = new Performer();
		
		p.setPerformer_name(performer_name);
		p.setPerformer_description(performer_description);
		
		if(performer_id.isEmpty() || performer_id==null) {
			//save operation
			if(performerDAO.save(p)) {
				request.setAttribute("message", "Performer Saved Successfully!!");
			}
		}else {
			//update operation
			p.setPerformer_id(performer_id);
			if(performerDAO.update(p)) {
				request.setAttribute("message", "Performer Updated Successfully!!");
			}
		}
		ListViewPerformer(request,response);
		}
	
	
	public void ListViewPerformer(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		
		List<Performer> listperformer =  performerDAO.get();
		request.setAttribute("listperformer",listperformer);
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/performer-listReport.jsp");
		dispatcher.forward(request, response);
	}
	
	}


