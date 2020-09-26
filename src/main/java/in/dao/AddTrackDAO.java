package in.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import in.entity.AddTrack;
import in.util.AdminDBConnectionUtil;

public class AddTrackDAO {
	private final String GET_DATA = "SELECT track_id,track_performer,track_album,track_no,track_name,track_duration,track_description from tbl_addtrack";
	private final String GET_ALBUM_QUERY = "SELECT track_file from tbl_addtrack where track_no=?";
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public List<AddTrack> getData() {
		AddTrack addTrack = null;
		List<AddTrack> tracklist =  new ArrayList<AddTrack>();
		try {
			con = AdminDBConnectionUtil.openConnection();
			ps = con.prepareStatement(GET_DATA);
			rs = ps.executeQuery();
			while(rs.next()) {
				addTrack = new AddTrack();
				addTrack.setTrack_id(rs.getString(1));
				addTrack.setTrack_performer(rs.getString(2));
				addTrack.setTrack_album(rs.getString(3));
				addTrack.setTrack_no(rs.getString(4));
				addTrack.setTrack_name(rs.getString(5));
				addTrack.setTrack_duration(rs.getString(6));
				addTrack.setTrack_description(rs.getString(7));
				//System.out.println(addTrack.toString());
				tracklist.add(addTrack);
			}
		} catch (Exception e) {
			
		}
		return tracklist;
	}
	public byte[] getTracks(String track_id) {
		byte[] track_file = null;
		try {
			con = AdminDBConnectionUtil.openConnection();
			ps = con.prepareStatement(GET_ALBUM_QUERY);
			ps.setString(1,track_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				track_file = rs.getBytes(1);
			}
		} catch (Exception e) {
			
		}
		return track_file;
	}
	
	public AddTrack get(int id) {
		AddTrack addTrack = null;
		try {
			addTrack = new AddTrack();
			String sql = "SELECT * from tbl_addtrack where track_id="+id;
			con = AdminDBConnectionUtil.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				addTrack.setTrack_id(rs.getString("track_id"));
				addTrack.setTrack_performer(rs.getString("track_performer"));
				addTrack.setTrack_album(rs.getString("track_album"));
				addTrack.setTrack_no(rs.getString("track_no"));
				addTrack.setTrack_name(rs.getString("track_name"));
				addTrack.setTrack_duration(rs.getString("track_duration"));
				addTrack.setTrack_description(rs.getString("track_description"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(addTrack.toString());
		return addTrack;	
	}
	
	public boolean update(AddTrack t) {
		
		boolean flag = false;
		try {
			String sql = "update tbl_addtrack set track_performer='"+t.getTrack_performer()+"',track_album='"+t.getTrack_album()+"',track_name='"+t.getTrack_name()+"',track_duration='"+t.getTrack_duration()+"',track_no='"+t.getTrack_no()+"',track_description='"+t.getTrack_description()+"' where track_id="+t.getTrack_id();
			con = AdminDBConnectionUtil.openConnection();
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean delete(int id) {
			
			boolean flag = false;
			
			try {
				String sql = "DELETE from tbl_addtrack WHERE track_id="+id;
				con = AdminDBConnectionUtil.openConnection();
				ps = con.prepareStatement(sql);
				ps.executeUpdate();
				flag = true;
	 		} catch (SQLException e) {
				e.printStackTrace();
			}
			return flag;
			
		}
}
