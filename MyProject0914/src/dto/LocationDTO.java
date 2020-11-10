package dto;

public class LocationDTO {

	int lnumber;
	String lname;
	String location ;
	String lpnumber;
	String lfile;
	public int getLnumber() {
		return lnumber;
	}
	public void setLnumber(int lnumber) {
		this.lnumber = lnumber;
	}
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
	public LocationDTO(int lnumber, String lname, String location, String lpnumber, String lfile) {
		super();
		this.lnumber = lnumber;
		this.lname = lname;
		this.location = location;
		this.lpnumber = lpnumber;
		this.lfile = lfile;
	}
	@Override
	public String toString() {
		return "LocationDTO [lnumber=" + lnumber + ", lname=" + lname + ", location=" + location + ", lpnumber="
				+ lpnumber + ", lfile=" + lfile + "]";
	}
	public LocationDTO() {
		super();
	}
	
	
}
