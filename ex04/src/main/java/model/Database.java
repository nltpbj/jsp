package model;
import java.sql.*;

public class Database {
	public static Connection CON;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			CON = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "jsp", "pass" );//
			System.out.println("접속성공");
		}catch (Exception e) {
			System.out.println("접속실패:" + e.toString());
		}
	}//static
}//class

