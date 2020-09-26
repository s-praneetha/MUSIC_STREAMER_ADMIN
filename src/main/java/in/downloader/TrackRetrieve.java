package in.downloader;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.dao.AddTrackDAO;


public class TrackRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AddTrackDAO addTrackDAO = null;
		ServletOutputStream outputStream = null;
		String track_no = req.getParameter("track_no");
		System.out.println(track_no);
		addTrackDAO = new AddTrackDAO();
		byte[] track_file =  addTrackDAO.getTracks(track_no);
		outputStream = resp.getOutputStream();
		outputStream.write(track_file);
		outputStream.close();
		
	}
}
