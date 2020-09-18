package dto;

public class MemberDTO {

	String mid;
	String mpassword ;
	String mname ;
	String maddress ;
	String mphone ;
	String mbirth;
	@Override
	public String toString() {
		return "MemberDTO [mid=" + mid + ", mpassword=" + mpassword + ", mname=" + mname + ", maddress=" + maddress
				+ ", mphone=" + mphone + ", mbirth=" + mbirth + "]";
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public MemberDTO(String mid, String mpassword, String mname, String maddress, String mphone, String mbirth) {
		super();
		this.mid = mid;
		this.mpassword = mpassword;
		this.mname = mname;
		this.maddress = maddress;
		this.mphone = mphone;
		this.mbirth = mbirth;
	}
	public MemberDTO() {
		super();
	}
	
}
