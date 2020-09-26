package in.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import in.entity.Admin;
import in.util.AdminDBConnectionUtil;



public class LoginAdminDAOImpl implements LoginAdminDAO{
	
	
	@Override
	public String authenticate(Admin admin) {
		
		LogAndAuditDAO logAndAuditDAO = null;
		logAndAuditDAO = new LogAndAuditDAOImpl();
		if(logAndAuditDAO.save("Admin Login process", "Admin", admin.getEmail())) {
		System.out.println("Login event inserted");
		}
		String sql =  "select * from tbl_admin where email=? and password=?";
		
		try {
			Connection connection = AdminDBConnectionUtil.openConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1,admin.getEmail());
		ps.setString(2,admin.getPassword());
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			return "true";
		}
		else {
			return "false";
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
		
	}

	
}
