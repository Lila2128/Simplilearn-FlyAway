package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DbConnect.DbUtil;
import pojo.Places;

public class PlacesDAO {
	
	public int insert(Places p) {
		try {
			Connection con= DbUtil.getConn();
			PreparedStatement ps= con.prepareStatement("insert into places (sources,destination) values(?,?)");
			ps.setString(1, p.getSource());
			ps.setString(2, p.getDestination());
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return 0;	
	}
	
	// To Check for No duplicate entries
	public int checkDuplicates(String source, String destination) {
		try {
			Connection con=DbUtil.getConn();
			System.out.println("Entered Duplicate Place DAO" + source + destination);
			PreparedStatement ps=con.prepareStatement("select * from places where sources=? and destination=?");
			ps.setString(1, source);
			ps.setString(2, destination);
			ResultSet rs= ps.executeQuery();
			int rowCount=0;
	        while(rs.next())
	        {
	           rowCount=+1;           
	        }
			return rowCount;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;	
	}
	
	//RETRIEVE OPERATION OF ALL THE SUBJECTS--------------------------------
		public List<Places> getallplaces() throws ClassNotFoundException, SQLException{
			ArrayList<Places> list= new ArrayList<>();
			System.out.println("Entered into retrieve all places");
			Connection con =DbUtil.getConn();
			String sql="select sources, destination from places";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				Places p = new Places();
				p.setSource(rs.getString(1));
				p.setDestination(rs.getString(2));
				list.add(p);
			}
			return list;
		}
	
		
		//DELETE OPERATION------------------------------------------------By passing unique id from the list to delete the record when clicked on the list
		public static int deletePlaces(String source) throws ClassNotFoundException, SQLException {
			Connection con=DbUtil.getConn();
			String sql="delete from places where sources=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, source);
			return ps.executeUpdate();
		}

}
