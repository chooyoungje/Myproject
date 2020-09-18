package dto;

public class LocationDTO {

	String lname;
	String location ;
	String lpnumber;
	String lfile;
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLpnumber() {
		return lpnumber;
	}
	public void setLpnumber(String lpnumber) {
		this.lpnumber = lpnumber;
	}
	public String getLfile() {
		return lfile;
	}
	public void setLfile(String lfile) {
		this.lfile = lfile;
	}
	@Override
	public String toString() {
		return "LocationDTO [lname=" + lname + ", location=" + location + ", lpnumber=" + lpnumber + ", lfile=" + lfile
				+ "]";
	}
	public LocationDTO(String lname, String location, String lpnumber, String lfile) {
		super();
		this.lname = lname;
		this.location = location;
		this.lpnumber = lpnumber;
		this.lfile = lfile;
	}
	public LocationDTO() {
		super();
	}
	
}
