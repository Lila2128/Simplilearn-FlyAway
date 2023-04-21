package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DbConnect.DbUtil;
import pojo.Airlines;

public class AirlinesDAO {
	
	public int insert(Airlines air) {
		try {
			Connection con= DbUtil.getConn();
			PreparedStatement ps= con.prepareStatement("insert into airlines (airline, flightName, Capacity) values(?,?,?)");
			ps.setString(1, air.getAirlines());
			ps.setString(2, air.getFlightName());
			ps.setString(3, air.getCapacity());
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return 0;	
	}
	
	// To Check for No duplicate entries
	public int checkDuplicates(String airlines, String flightName) {
		try {
			Connection con=DbUtil.getConn();
			System.out.println("Entered Duplicate Place DAO: " + airlines + flightName);
			PreparedStatement ps=con.prepareStatement("select * from airlines where airline=? and flightName=?");
			ps.setString(1, airlines);
			ps.setString(2, flightName);
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
		public List<Airlines> getallairlines() throws ClassNotFoundException, SQLException{
			ArrayList<Airlines> list= new ArrayList<>();
			System.out.println("Entered into retrieve all Airlines");
			Connection con =DbUtil.getConn();
			String sql="select airline, flightName, Capacity from airlines";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				Airlines air = new Airlines();
				air.setAirlines(rs.getString(1));
				air.setFlightName(rs.getString(2));
				air.setCapacity(rs.getString(3));
				list.add(air);
			}
			return list;
		}

		
		//DELETE OPERATION------------------------------------------------By passing unique id from the list to delete the record when clicked on the list
		public static int deleteAirlines(String FlightName) throws ClassNotFoundException, SQLException {
			Connection con=DbUtil.getConn();
			System.out.println("Airline Delete DAO entered");
			String sql="delete from airlines where flightName=?";
			PreparedStatement ps=con.prepareStatement(sql);
			System.out.println(FlightName);
			ps.setString(1, FlightName);
			System.out.println("Executed Airline Delete DAO");
			return ps.executeUpdate();
		}


}
