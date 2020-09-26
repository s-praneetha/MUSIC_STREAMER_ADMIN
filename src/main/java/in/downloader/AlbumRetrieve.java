package in.downloader;

import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.dao.AddAlbumDAO;



public class AlbumRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AddAlbumDAO addAlbumDAO = null;
		ServletOutputStream outputStream = null;
		String album_type_id = req.getParameter("album_name");
		addAlbumDAO = new AddAlbumDAO();
		byte[] album_image =  addAlbumDAO.getAlbums(album_type_id);
		outputStream = resp.getOutputStream();
		outputStream.write(album_image);
		outputStream.close();

	}

}
