package dto;

import java.sql.Date;

public class BoardDTO {

	int bnumber ;
    String bwriter; 
    String btitle; 
    String bcontents; 
    int bhits;
    Date bdate;
    String bfile; 
    int bnotice;
	public int getBnumber() {
		return bnumber;
	}
	public void setBnumber(int bnumber) {
		this.bnumber = bnumber;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public int getBhits() {
		return bhits;
	}
	public void setBhits(int bhits) {
		this.bhits = bhits;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public int getBnotice() {
		return bnotice;
	}
	public void setBnotice(int bnotice) {
		this.bnotice = bnotice;
	}
	@Override
	public String toString() {
		return "BoardDTO [bnumber=" + bnumber + ", bwriter=" + bwriter + ", btitle=" + btitle + ", bcontents="
				+ bcontents + ", bhits=" + bhits + ", bdate=" + bdate + ", bfile=" + bfile + ", bnotice=" + bnotice
				+ "]";
	}
	public BoardDTO(int bnumber, String bwriter, String btitle, String bcontents, int bhits, Date bdate, String bfile,
			int bnotice) {
		super();
		this.bnumber = bnumber;
		this.bwriter = bwriter;
		this.btitle = btitle;
		this.bcontents = bcontents;
		this.bhits = bhits;
		this.bdate = bdate;
		this.bfile = bfile;
		this.bnotice = bnotice;
	}
	public BoardDTO() {
		super();
	}
    
}
