package dto;

public class BasketDTO {

	int bpnumber; 
    String bpname; 
    String bmid; 
    String bpfile; 
    String bpcontents;
    int bpprice;
	public int getBpnumber() {
		return bpnumber;
	}
	public void setBpnumber(int bpnumber) {
		this.bpnumber = bpnumber;
	}
	public String getBpname() {
		return bpname;
	}
	public void setBpname(String bpname) {
		this.bpname = bpname;
	}
	public String getBmid() {
		return bmid;
	}
	public void setBmid(String bmid) {
		this.bmid = bmid;
	}
	public String getBpfile() {
		return bpfile;
	}
	public void setBpfile(String bpfile) {
		this.bpfile = bpfile;
	}
	public int getBpprice() {
		return bpprice;
	}
	public void setBpprice(int bpprice) {
		this.bpprice = bpprice;
	}
	@Override
	public String toString() {
		return "BasketDTO [bpnumber=" + bpnumber + ", bpname=" + bpname + ", bmid=" + bmid + ", bpfile=" + bpfile
				+ ", bpprice=" + bpprice + "]";
	}
	public BasketDTO(int bpnumber, String bpname, String bmid, String bpfile, int bpprice) {
		super();
		this.bpnumber = bpnumber;
		this.bpname = bpname;
		this.bmid = bmid;
		this.bpfile = bpfile;
		this.bpprice = bpprice;
	}
	public BasketDTO() {
		super();
	}
    
}
