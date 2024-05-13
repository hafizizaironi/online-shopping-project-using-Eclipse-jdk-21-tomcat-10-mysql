package project;

import java.sql.*;

public class ConnectionProvider {
	

	private static Connection connection;

	public static Connection getCon()throws ClassNotFoundException, SQLException {

		try {
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp", "root", "Hafizi@123");
				System.out.print("connected");
		
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print("not connected");
		}
		return connection;
	}

}