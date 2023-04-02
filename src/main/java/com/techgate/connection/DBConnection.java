package com.techgate.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {

	Connection con=null;
	//static final String connectionURL = "jdbc:mysql://localhost:3306/numberwale";
	static final String connectionURL = "jdbc:mysql://localhost:3306/vipnumberstore";
	public Connection getCon() {
		return con;
	}

	public DBConnection() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException{
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		//con= DriverManager.getConnection(connectionURL, "vipnumberstore", "V!Pstore#321");
		con= DriverManager.getConnection(connectionURL, "root", "root");
	}

	public static void  close(Connection con,Statement stmt,ResultSet res) throws SQLException{

		if(res!=null)
			res.close();

		if(stmt!=null)
			stmt.close();

		if(con!=null)
			con.close();
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
		System.out.println(new DBConnection().getCon());
	}
}

