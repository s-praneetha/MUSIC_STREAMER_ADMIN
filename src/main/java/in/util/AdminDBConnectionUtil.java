package in.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class AdminDBConnectionUtil {
	
	//defining database properties
		private static final String URL = "jdbc:mysql://localhost:3306/Users";
		private static final String DRIVER = "com.mysql.jdbc.Driver";
		private static final String USERNAME = "root";
		private static final String PASSWORD = "geethasudha";
		private static Connection connection = null;
		//define static properties
		public static Connection openConnection() {
			if(connection != null) {
				return connection;
			}else {
				try {
					Class.forName(DRIVER);
					
					
					connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
					
					
				} catch (Exception e) {
					e.printStackTrace();

				}
				return connection;
			}
		}

}
