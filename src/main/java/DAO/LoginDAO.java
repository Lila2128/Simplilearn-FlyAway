package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DbConnect.DbUtil;
import pojo.Login;

public class LoginDAO {
	
	public int insert (Login l) {
		try {
			System.out.print("Start Executing Insert User DAO");
			Connection con = DbUtil.getConn();
			PreparedStatement ps=con.prepareStatement("insert into userdetails (firstName, lastName, email, username, password) values(?, ?, ?, ?, ?)");
			ps.setString(1, l.getFirstName());
			ps.setString(2, l.getLastName());
			ps.setString(3, l.getEmail());
			ps.setString(4, l.getUsername());
			ps.setString(5, l.getPassword());
			System.out.println("Executed User insert DAO");
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	// To Check for No duplicate entries
		public int checkDuplicates(String email) {
			try {
				Connection con=DbUtil.getConn();
				System.out.println("Entered Duplicate Place DAO" + email);
				PreparedStatement ps=con.prepareStatement("select * from userdetails where email=?");
				ps.setString(1, email);
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
	
	public List<Login> retrieve (String userP) {
		Login l=null;
		ArrayList <Login> list= new ArrayList<>();
		System.out.println("DAO: "+userP);
		try {
			Connection con= DbUtil.getConn();
			PreparedStatement ps= con.prepareStatement("select * from userdetails where username=?");
			ps.setString(1, userP);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				l=new Login();
				l.setUid(rs.getString(1));
				l.setFirstName(rs.getString(2));
				l.setLastName(rs.getString(3));
				l.setEmail(rs.getString(4));
				l.setUsername(rs.getString(5));
				l.setPassword(rs.getString(6));
				list.add(l);
			}
			return list;
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;	
	}
	
	public int update (Login l) {
		try {
			System.out.print("Start Executing Update User DAO");
			Connection con = DbUtil.getConn();
			PreparedStatement ps=con.prepareStatement("update userdetails set firstName=? , lastName=?, password=? where username=?");
			ps.setString(1, l.getFirstName());
			ps.setString(2, l.getLastName());
			ps.setString(3, l.getPassword());
			ps.setString(4, l.getUsername());
			System.out.println(" Executed User Update DAO");
			System.out.println(ps.executeUpdate());
			return ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
