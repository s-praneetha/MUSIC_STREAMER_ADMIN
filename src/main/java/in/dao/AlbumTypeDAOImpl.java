package in.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import in.entity.AlbumType;
import in.util.AdminDBConnectionUtil;

public class AlbumTypeDAOImpl implements AlbumTypeDAO{
	
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	
	@Override
	public List<AlbumType> get() {
		
		List<AlbumType> list = null;
		AlbumType albumtype = null;
		try {
			list = new ArrayList<AlbumType>();
			String sql = "SELECT * FROM tbl_addalbumtype";
			connection = AdminDBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				albumtype = new AlbumType();
				albumtype.setType_id(resultSet.getString("type_id"));
				albumtype.setType_name(resultSet.getString("type_name"));
				albumtype.setType_description(resultSet.getString("type_description"));
				list.add(albumtype);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	@Override
	public boolean save(AlbumType at) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO tbl_addalbumtype(type_name,type_description)VALUES"
					+ "('"+at.getType_name()+"', '"+at.getType_description()+"')";
			connection = AdminDBConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
			
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
		
	}

	@Override
	public AlbumType get(int id) {
		
		
		AlbumType albumtype = null;
		try {
			albumtype = new AlbumType();
			String sql = "SELECT * from tbl_addalbumtype WHERE type_id="+id;
			connection = AdminDBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				albumtype.setType_id(resultSet.getString("type_id"));
				albumtype.setType_name(resultSet.getString("type_name"));
				albumtype.setType_description(resultSet.getString("type_description"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return albumtype;
	}

	@Override
	public boolean update(AlbumType p) {
		boolean flag = false;
		try {
			String sql = "update tbl_addalbumtype set type_name='"+p.getType_name()+"', "
					+ "type_description='"+p.getType_description()+"' where type_id="+p.getType_id();
			connection = AdminDBConnectionUtil.openConnection();
			preparedStatement =  connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean delete(int id) {
		boolean flag = false;
		try {
			String sql = "DELETE from tbl_addalbumtype where type_id="+id;
			connection = AdminDBConnectionUtil.openConnection();
			preparedStatement =  connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

}
