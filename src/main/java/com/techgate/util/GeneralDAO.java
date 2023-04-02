package com.techgate.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.techgate.connection.DBConnection;

public class GeneralDAO {

	public String getCateDetails(int id){
		String cateName="";
		Connection con=null;
		Statement stmt=null;
		ResultSet res =null;
		try{
			DBConnection dbcon = new DBConnection();
    		 con = dbcon.getCon();
    		 stmt =  con.createStatement();
    		 res = stmt.executeQuery("select * from categories where cate_id="+id);
            if(res.next()) {
            	cateName= res.getString("cate_name");
            }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				DBConnection.close(con, stmt, res);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cateName;
	}
	
	public String getVendorDetails(int id){
		String cateName="";
		Connection con=null;
		Statement stmt=null;
		ResultSet res =null;
		try{
			DBConnection dbcon = new DBConnection();
    		 con = dbcon.getCon();
    		 stmt =  con.createStatement();
    		 res = stmt.executeQuery("select * from vendorDetails where id="+id);
            if(res.next()) {
            	cateName= res.getString("firstname");
            }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				DBConnection.close(con, stmt, res);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cateName;
	}
	
	public String getImageUploadDetails(int id){
		String cateName="";
		Connection con=null;
		Statement stmt=null;
		ResultSet res =null;
		try{
			DBConnection dbcon = new DBConnection();
    		 con = dbcon.getCon();
    		 stmt =  con.createStatement();
    		 res = stmt.executeQuery("select count(*) from ProductImageDetails where product_id="+id);
            if(res.next()) {
            	cateName= res.getString(1);
            }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				DBConnection.close(con, stmt, res);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cateName;
	}
	
}
