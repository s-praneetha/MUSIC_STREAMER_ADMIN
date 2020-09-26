package in.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import in.entity.Admin;
import in.util.AdminDBConnectionUtil;


public class AdminDAOImpl implements AdminDAO{
	
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	
	
	@Override
	public List<Admin> get() {
		
		List<Admin> list = null;
		Admin admin = null;
		try {
			list = new ArrayList<Admin>();
			String sql = "SELECT * FROM tbl_admin";
			connection = AdminDBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				admin = new Admin();
				admin.setAdminId(resultSet.getString("AdminId"));
				admin.setUsername(resultSet.getString("username"));
				admin.setEmail(resultSet.getString("email"));
				admin.setPassword(resultSet.getString("password"));
				list.add(admin);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	@Override
	public boolean save(Admin e) {
		boolean flag = false;
		try {
			
			String sql = "INSERT INTO tbl_admin(AdminId,username, email, password)VALUES"
					+ "('"+e.getAdminId()+"', '"+e.getUsername()+"', '"+e.getEmail()+"', '"+e.getPassword()+"')";
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
	public boolean update(String email,String password) {
		boolean flag = false;
		try {
			String sql = "update tbl_admin set password='"+password+"' where email='"+email+"'";
			connection = AdminDBConnectionUtil.openConnection();
			preparedStatement =  connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	


}
