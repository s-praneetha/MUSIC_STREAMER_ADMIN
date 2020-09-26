package in.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import in.entity.AddAlbum;
import in.util.AdminDBConnectionUtil;

public class AddAlbumDAO { 
	
	private final String GET_DATA = "SELECT album_id,album_name,album_type_id,album_description,language from tbl_addalbum";
	private final String GET_ALBUM_QUERY = "select album_image from tbl_addalbum where album_name=?";
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Statement statement = null;
	public List<AddAlbum> getData() {
		
		AddAlbum addAlbum = null;
		List<AddAlbum> albumlist =  new ArrayList<AddAlbum>();
		try {
			con = AdminDBConnectionUtil.openConnection();
			ps = con.prepareStatement(GET_DATA);
			rs = ps.executeQuery();
			while(rs.next()) {
				addAlbum = new AddAlbum();
				addAlbum.setAlbum_id(rs.getString(1));
				addAlbum.setAlbum_name(rs.getString(2));
				addAlbum.setAlbum_type_id(rs.getString(3));
				addAlbum.setAlbum_description(rs.getString(4));
				addAlbum.setLanguage(rs.getString(5));
				//System.out.println(addAlbum.toString());
				albumlist.add(addAlbum);
			}
		} catch (Exception e) {
			
		}
		return albumlist;
		
	}
	public byte[] getAlbums(String album_type_id) {
		byte[] album_image = null;
		try {
			con = AdminDBConnectionUtil.openConnection();
			ps = con.prepareStatement(GET_ALBUM_QUERY);
			ps.setString(1,album_type_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				album_image = rs.getBytes(1);
			}
		} catch (Exception e) {
			
		}
		return album_image;
	}
	
	
	public AddAlbum get(int id) {
		AddAlbum addAlbum = null;
		try {
			addAlbum = new AddAlbum();
			String sql = "SELECT * from tbl_addalbum where album_id="+id;
			con = AdminDBConnectionUtil.openConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				addAlbum.setAlbum_id(rs.getString("album_id"));
				addAlbum.setAlbum_name(rs.getString("album_name"));
				addAlbum.setAlbum_type_id(rs.getString("album_type_id"));
				addAlbum.setAlbum_description(rs.getString("album_description"));
				addAlbum.setLanguage(rs.getString("language"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(addAlbum.toString());
		return addAlbum;	
	}
	
	public boolean update(AddAlbum a) {
		
		boolean flag = false;
		try {
			String sql = "update tbl_addalbum set album_name='"+a.getAlbum_name()+"',album_type_id='"+a.getAlbum_type_id()+"',album_description='"+a.getAlbum_description()+"',language='"+a.getLanguage()+"' where album_id="+a.getAlbum_id();
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
				String sql = "DELETE from tbl_addalbum WHERE album_id="+id;
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
