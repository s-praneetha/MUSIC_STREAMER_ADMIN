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
import in.dao.AlbumTypeDAO;
import in.dao.AlbumTypeDAOImpl;
import in.dao.LogAndAuditDAO;
import in.dao.LogAndAuditDAOImpl;
import in.entity.AddAlbum;
import in.entity.AlbumType;
import in.util.AdminDBConnectionUtil;


public class UploadAlbumController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String album_id = null;
	String album_name = null;
	String album_type_id = null;
	FileInputStream album_image = null;
	String album_description = null;
	String language = null;
	
	AlbumTypeDAO albumTypeDAO = null;
	AddAlbumDAO addAlbumDAO = null;
	
	
	public UploadAlbumController() {
		addAlbumDAO = new AddAlbumDAO();
		albumTypeDAO = new AlbumTypeDAOImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<AlbumType> dropalbumtype = albumTypeDAO.get();
		request.setAttribute("dropalbumtype",dropalbumtype);

		RequestDispatcher dispatcher =  request.getRequestDispatcher("/newalbum.jsp");
		  dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("save")) {
			
			boolean isMultiPartData = ServletFileUpload.isMultipartContent(request);
			if(isMultiPartData) {
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				File tempFile = new File("/Users/praneethaseethepalli/PROJECT/Music_Streamer_Admin/src/main/webapp/temp");
				factory.setRepository(tempFile);
				
				
				ServletFileUpload fileUpload =  new ServletFileUpload(factory);
				
				try {
					
				List<FileItem> items = fileUpload.parseRequest(request);
				for(FileItem item:items) {
					if(item.isFormField()) {
						String fieldName = item.getFieldName(); 
						if(fieldName.equals("album_name")) {
							album_name = item.getString();
						}else if (fieldName.equals("album_type_id")) {
							album_type_id = item.getString();
						}else if (fieldName.equals("album_description")) {
							album_description = item.getString();
						}else if (fieldName.equals("language")) {
							language = item.getString();
						}
					}else {
						album_image = (FileInputStream) item.getInputStream();
					}
				}
				
				} catch (Exception e) {
					e.printStackTrace();
				}		
			}
			
			else {
				System.out.println("Its not a multipart data");
			}
			
			Connection con = AdminDBConnectionUtil.openConnection();
			try {
				PreparedStatement ps = con.prepareStatement("insert into tbl_addalbum(album_name,album_type_id,album_image,album_description,language)values(?,?,?,?,?)");
				ps.setString(1, album_name);
				ps.setString(2, album_type_id);
				ps.setBinaryStream(3, album_image);
				ps.setString(4, album_description);
				ps.setString(5, language);
				int n = ps.executeUpdate();
				if(n>0) {
					response.sendRedirect("AlbumViewerController");
					
				}
			
			}catch (Exception e) {
				System.out.println(e);
			}
			
		}
	
		if(action.equalsIgnoreCase("update")) {

			AddAlbum a = new AddAlbum();
			a.setAlbum_id(request.getParameter("id"));
			a.setAlbum_name(request.getParameter("album_name"));
			a.setAlbum_type_id(request.getParameter("typeid"));
			a.setAlbum_description(request.getParameter("desc"));
			a.setLanguage(request.getParameter("lang"));
			System.out.println(a.toString());
			if(addAlbumDAO.update(a)) {
				response.sendRedirect("AlbumViewerController");
			}
				
		}		
		
	}

}

