package dto;

public class ProductDTO {

	int pnumber;
	String pname;
	String pcontents;
	String pfile;
	int pprice;
	public int getPnumber() {
		return pnumber;
	}
	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	@Override
	public String toString() {
		return "ProductDTO [pnumber=" + pnumber + ", pname=" + pname + ", pcontents=" + pcontents + ", pfile=" + pfile
				+ ", pprice=" + pprice + "]";
	}
	public ProductDTO(int pnumber, String pname, String pcontents, String pfile, int pprice) {
		super();
		this.pnumber = pnumber;
		this.pname = pname;
		this.pcontents = pcontents;
		this.pfile = pfile;
		this.pprice = pprice;
	}
	public ProductDTO() {
		super();
	}
	
}
