package dto;

public class BigDateDTO {

	
    String location; 
    int pnumber;  
    int mage;
	public BigDateDTO(String location, int pnumber, int mage) {
		super();
		this.location = location;
		this.pnumber = pnumber;
		this.mage = mage;
	}
	public BigDateDTO() {
		super();
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getPnumber() {
		return pnumber;
	}
	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}
	public int getMage() {
		return mage;
	}
	public void setMage(int mage) {
		this.mage = mage;
	}
	@Override
	public String toString() {
		return "BigDateDTO [location=" + location + ", pnumber=" + pnumber + ", mage=" + mage + "]";
	}

	
    
}
