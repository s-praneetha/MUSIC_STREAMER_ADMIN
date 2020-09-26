package in.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import in.util.AdminDBConnectionUtil;

public class LogAndAuditDAOImpl implements LogAndAuditDAO{
	Connection connection = null;
	ResultSet resultSet = null;
	Statement st=null;
	PreparedStatement preparedStatement = null;
	
	public boolean save(String event, String source, String userid) {
		boolean flag=false;
		try {
			String sql="insert into auditlogging(event,Source,userid,time_stamp) values('"+event+"','"+source+"','"+userid+"',now())";
			
			connection = AdminDBConnectionUtil.openConnection();
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();

			flag=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
