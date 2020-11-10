package dto;

public class BasketDTO {

	int bpnumber; 
    String bpname; 
    String bmid; 
    String bpfile; 
    int pbamount;
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
	public int getPbamount() {
		return pbamount;
	}
	public void setPbamount(int pbamount) {
		this.pbamount = pbamount;
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
				+ ", pbamount=" + pbamount + ", bpprice=" + bpprice + "]";
	}
	public BasketDTO(int bpnumber, String bpname, String bmid, String bpfile, int pbamount, int bpprice) {
		super();
		this.bpnumber = bpnumber;
		this.bpname = bpname;
		this.bmid = bmid;
		this.bpfile = bpfile;
		this.pbamount = pbamount;
		this.bpprice = bpprice;
	}
	public BasketDTO() {
		super();
	}
	
    
}
