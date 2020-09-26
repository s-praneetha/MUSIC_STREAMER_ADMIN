package in.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import in.dao.AddAlbumDAO;
import in.dao.AddTrackDAO;
import in.dao.PerformerDAO;
import in.dao.PerformerDAOImpl;
import in.entity.AddAlbum;
import in.entity.AddTrack;
import in.entity.Performer;
import in.util.AdminDBConnectionUtil;


public class UploadTrackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String track_id = null;
	String track_name = null;
	String track_performer = null;
	String track_album = null;
	String track_no = null;
	String track_duration = null;
	FileInputStream track_file = null;
	String track_description = null;
	PerformerDAO performerDAO = null;
	AddAlbumDAO addAlbumDAO = null;
    AddTrackDAO addTrackDAO = null;
    
	public UploadTrackController() {
		
		addTrackDAO = new AddTrackDAO();
		performerDAO = new PerformerDAOImpl();
		addAlbumDAO = new AddAlbumDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	

		List<Performer> listperformer = performerDAO.get();
		 request.setAttribute("list",listperformer);
		
		List<AddAlbum> list =  addAlbumDAO.getData();
		 request.setAttribute("ablist", list); 
			
			
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/AddTrack.jsp");
		  dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("save")) {
			
			boolean isMultiPartData = ServletFileUpload.isMultipartContent(request);
			if(isMultiPartData) {
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				File temp1File = new File("/Users/praneethaseethepalli/PROJECT/Music_Streamer_Admin/src/main/webapp/temp1");
				factory.setRepository(temp1File);
				
				
				ServletFileUpload fileUpload =  new ServletFileUpload(factory);
				try {
					
					List<FileItem> items = fileUpload.parseRequest(request);
					for(FileItem item:items) {
						if(item.isFormField()) {
							String fieldName = item.getFieldName(); 
							if(fieldName.equals("track_name")) {
								track_name = item.getString();
							}else if (fieldName.equals("track_album")) {
								track_album = item.getString();
							}else if (fieldName.equals("track_performer")) {
								track_performer = item.getString();
							}else if (fieldName.equals("track_no")) {
								track_no = item.getString();
							}else if (fieldName.equals("track_duration")) {
								track_duration = item.getString();
							}else if (fieldName.equals("track_description")) {
								track_description = item.getString();
							}
						}else {
							track_file = (FileInputStream) item.getInputStream();
						}
					}
					}catch (Exception e) {
						e.printStackTrace();
					}
				
					
				}else {
					System.out.println("Its not a multipart data");
				}
			Connection con = AdminDBConnectionUtil.openConnection();
			
			try {
				PreparedStatement ps = con.prepareStatement("insert into tbl_addtrack(track_performer,track_album,track_no,track_name,track_duration,track_file,track_description)values(?,?,?,?,?,?,?)");
				ps.setString(1, track_performer);
				ps.setString(2, track_album);
				ps.setString(3, track_no);
				ps.setString(4, track_name);
				ps.setString(5, track_duration);
				ps.setBinaryStream(6,track_file);			
				ps.setString(7, track_description);
				int n = ps.executeUpdate();
				if(n>0) {
					response.sendRedirect("TrackViewerController");
				}
			
			}catch (Exception e) {
				System.out.println(e);
			}
			
			
		}
		
		if(action.equalsIgnoreCase("update")) {
			
			AddTrack t = new AddTrack();
			t.setTrack_id(request.getParameter("id"));
			t.setTrack_performer(request.getParameter("trackperf"));
			t.setTrack_album(request.getParameter("trackalb"));
			t.setTrack_no(request.getParameter("trackno"));
			t.setTrack_name(request.getParameter("trackname"));
			t.setTrack_duration(request.getParameter("trackduration"));
			t.setTrack_description(request.getParameter("trackdesc"));
			
			if(addTrackDAO.update(t)) {
				response.sendRedirect("TrackViewerController");
			}
			
		}
	}

}
