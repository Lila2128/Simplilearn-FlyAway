package DAO;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DbConnect.DbUtil;
import pojo.Flights;
public class FlightsDAO {
	public int insert (Flights f) {
		try {
			System.out.print("Start Executing Insert User DAO");
			Connection con = DbUtil.getConn();
			PreparedStatement ps=con.prepareStatement("insert into flight (flightName, Sources, Destination, Arrival, Duration, Departure_Date, Price) values(?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, f.getFlightName());
			ps.setString(2, f.getSource());
			ps.setString(3, f.getDestination());
			ps.setString(4, f.getArrival());
			ps.setString(5, f.getDuration());
			ps.setDate(6, new java.sql.Date(f.getDepartureDate().getTime()));
			ps.setLong(7, f.getPrice());
			System.out.println("Executed User insert DAO");
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<Flights> getallFlights() throws ClassNotFoundException, SQLException{
		ArrayList<Flights> list= new ArrayList<>();
		Connection con =DbUtil.getConn();
		String sql="select flightName, Sources, Destination, Arrival, Duration, Departure_Date, Price from flight";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();
		while(rs.next()) {
			Flights f = new Flights();
			f.setFlightName(rs.getString(1));
			f.setSource(rs.getString(2));
			f.setDestination(rs.getString(3));
			f.setArrival(rs.getString(4));
			f.setDuration(rs.getString(5));
			f.setDepartureDate(rs.getDate(6));
			f.setPrice(rs.getLong(7));
			list.add(f);
		}
		return list;
	}
	
	//To Check for No duplicate entries
	public int checkDuplicates(String Flights, String Sources, String Destination, String Arrival, Date departureDate) {
		try {
			Connection con=DbUtil.getConn();
			System.out.println("Entered Duplicate Flight DAO" + Flights + Sources + Destination + Arrival + departureDate);
			PreparedStatement ps=con.prepareStatement("select * from flight where (flightName, Sources, Destination, Arrival, Departure_Date)=(?,?,?,?,?)");
			ps.setString(1, Flights);
			ps.setString(2, Sources);
			ps.setString(3, Destination);
			ps.setString(4, Arrival);
			ps.setDate(5, new java.sql.Date(departureDate.getTime()));
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

	
	//DELETE OPERATION------------------------------------------------By passing unique id from the list to delete the record when clicked on the list
			public static int deleteFlights(String FlightName, String Source, String Destination) throws ClassNotFoundException, SQLException {
				Connection con=DbUtil.getConn();
				System.out.println("Flight Delete DAO entered");
				PreparedStatement ps=con.prepareStatement("delete from flight where (flightName, Sources, Destination)=(?,?,?)");
				System.out.println(FlightName + Source + Destination);
				ps.setString(1, FlightName);
				ps.setString(2, Source);
				ps.setString(3, Destination);
				System.out.println("Executed Delete Query in Flights");
				return ps.executeUpdate();
				
			}
			
			
			public List<Flights> getFlights(Date departureDate, String Source, String Destination) throws ClassNotFoundException, SQLException{
				System.out.println("Starting executing Flights List. for DepartureDate: "+ departureDate);
				Flights f= null;
				ArrayList<Flights> list= new ArrayList<>();
				Connection con=null;
				try {
					con =DbUtil.getConn();
					String sql="select flightName, Sources, Destination, Arrival, Duration, Departure_Date, Price from flight where (Departure_Date, Sources, Destination)=(?,?,?)";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setDate(1, new java.sql.Date(departureDate.getTime()));
					ps.setString(2, Source);
					ps.setString(3, Destination);
					ResultSet rs= ps.executeQuery();
					while(rs.next()) {
						f = new Flights();
						f.setFlightName(rs.getString(1));
						f.setSource(rs.getString(2));
						f.setDestination(rs.getString(3));
						f.setArrival(rs.getString(4));
						f.setDuration(rs.getString(5));
						f.setDepartureDate(rs.getDate(6));
						f.setPrice(rs.getLong(7));
						list.add(f);
					}
					return list;
				}catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return list;	
			}
}



