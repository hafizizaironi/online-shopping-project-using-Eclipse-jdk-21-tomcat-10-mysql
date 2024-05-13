package project;

import java.sql.*;

public class ConnectionProvider {
	

	private static Connection connection;

	public static Connection getCon() {

		try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp", "root", "Hafizi@123");
				
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

}