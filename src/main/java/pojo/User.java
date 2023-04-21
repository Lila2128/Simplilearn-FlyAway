package pojo;
import java.util.*;

public class User {

	public Date departureDate;
	public Date returnDate;
	public int traveller;
	public String source;
	public String destination;
	
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public int getTraveller() {
		return traveller;
	}
	public void setTraveller(int traveller) {
		this.traveller = traveller;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	
	
	
}
