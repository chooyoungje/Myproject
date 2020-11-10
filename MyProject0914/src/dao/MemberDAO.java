package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.BoardDTO;
import dto.MemberDTO;

public class MemberDAO {

	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public void dbClose() {
		try {con.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
      public void rsClose() {
		try {rs.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void pstmtClose() {
		try {pstmt.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void dbconnection() {
		con=DBConnection.getConnection();
	}
	
	public int MemberJoin(MemberDTO mdto) {
		String sql="INSERT INTO MEMBER(MID,MPASSWORD,MNAME,MADDRESS,MPHONE,MBIRTH)"
				+ "VALUES(?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD'))";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mdto.getMid());
			 pstmt.setString(2, mdto.getMpassword());
			 pstmt.setString(3, mdto.getMname());
			 pstmt.setString(4, mdto.getMaddress());
			 pstmt.setString(5, mdto.getMphone());
			 pstmt.setString(6, mdto.getMbirth());
			 result=pstmt.executeUpdate();
			} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		
		return result;
	}
	public int MemberLogIn(String mid, String mpassword) {
		String sql="SELECT * FROM MEMBER WHERE MID=? AND MPASSWORD=?";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,mid);
			 pstmt.setString(2,mpassword);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{result=1;
			 	}
			 else 
			 	{result=0;
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				 rsClose();
				 }
		return result;
	}
	
	public MemberDTO MemberView(String mid) {
		String sql="SELECT * FROM MEMBER WHERE MID=?";
		MemberDTO mdto =new MemberDTO();
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,mid);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{mdto.setMid(rs.getString("MID"));
			  	 mdto.setMpassword(rs.getString("MPASSWORD"));
			 	 mdto.setMname(rs.getString("MNAME"));
			 	 mdto.setMbirth(rs.getString("MBIRTH"));
			 	 mdto.setMaddress(rs.getString("MADDRESS"));
			 	 mdto.setMphone(rs.getString("MPHONE"));
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				 rsClose();
				 }
		return mdto;
	}
	public List<MemberDTO> MemberListAll() {
		String sql="SELECT * FROM MEMBER";
		List<MemberDTO> mlist = new ArrayList<MemberDTO>();
		MemberDTO mdto =null;
		try {pstmt=con.prepareStatement(sql);
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{mdto = new MemberDTO();
				 mdto.setMid(rs.getString("MID"));
				 mdto.setMpassword(rs.getString("MPASSWORD"));
				 mdto.setMname(rs.getString("MNAME"));
				 mdto.setMbirth(rs.getString("MBIRTH"));
				 mdto.setMaddress(rs.getString("MADDRESS"));
				 mdto.setMphone(rs.getString("MPHONE"));
				 mlist.add(mdto);
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				 rsClose();
		 		}
		return mlist;
	}
	public int MemberDelete(String mid) {
		String sql= "DELETE FROM MEMBER WHERE MID=?";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mid);
			 result=pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		return result;
	}
	public MemberDTO MemberUpdate(String mid) {
		String sql="SELECT * FROM MEMBER WHERE MID=?";
		MemberDTO mdto =null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mid);
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{mdto = new MemberDTO();;
				 mdto.setMid(rs.getString("MID"));
				 mdto.setMpassword(rs.getString("MPASSWORD"));
				 mdto.setMname(rs.getString("MNAME"));
				 mdto.setMbirth(rs.getString("MBIRTH"));
				 mdto.setMaddress(rs.getString("MADDRESS"));
				 mdto.setMphone(rs.getString("MPHONE"));
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				 rsClose();
		 		}
		return mdto;
	}
	public int MemberUpdateProcess(MemberDTO mdto) {
		String sql="UPDATE MEMBER SET MPASSWORD=?,MNAME=?,MADDRESS=?,MPHONE=?,MBIRTH=TO_DATE(?,'YYYY-MM-DD') WHERE MID=?";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mdto.getMpassword());
			 pstmt.setString(2, mdto.getMname());
			 pstmt.setString(3, mdto.getMaddress());
			 pstmt.setString(4, mdto.getMphone());
			 pstmt.setString(5, mdto.getMbirth());
			 pstmt.setString(6, mdto.getMid());
			 result=pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		return result;
	}
	
	public String MemberAGE(String mid) {
		String sql="SELECT MBIRTH FROM MEMBER WHERE MID=?";
		String age=null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mid);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{age=rs.getString("MBIRTH");
			 	}
			} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
		 rsClose();
		}
		return age;
	}
	
	
	
	public int listCount() {
		String sql = "SELECT COUNT(MID) FROM MEMBERLIST";
		int listCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return listCount;
	}
  	
	
	public List<MemberDTO> memberListPaging(int startRow, int endRow) {
		String sql = "SELECT * FROM MEMBERLIST WHERE RN BETWEEN ? AND ?";
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		MemberDTO member = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) 
			{member= new MemberDTO();
			 member.setMid(rs.getString("MID"));
			 member.setMpassword(rs.getString("MPASSWORD"));
			 member.setMname(rs.getString("MNAME"));
			 member.setMaddress(rs.getString("MADDRESS"));
			 member.setMbirth(rs.getString("MBIRTH"));
			 member.setMphone(rs.getString("MPHONE"));
			 memberList.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return memberList;
	}
	public MemberDTO FindId(String mname, String mbirth) {
		String sql="SELECT * FROM MEMBER WHERE MNAME=? AND MBIRTH=?";
		MemberDTO mdto= null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mname);
			 pstmt.setString(2, mbirth);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{mdto=new MemberDTO();
				 mdto.setMid(rs.getString("MID"));
			 	 mdto.setMbirth(rs.getString("MBIRTH"));
			 	}
			} 
		catch (SQLException e) 
			{e.printStackTrace();
			}
		finally {pstmtClose();
				 rsClose();
				}
		
		return mdto;
	}
	
	public MemberDTO FindPW(String mid, String mbirth) {
		String sql="SELECT * FROM MEMBER WHERE MID=? AND MBIRTH=?";
		MemberDTO mdto= null;
		try {pstmt=con.prepareStatement(sql);
		
			 pstmt.setString(1, mid);
			 pstmt.setString(2, mbirth);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{mdto=new MemberDTO();
				 mdto.setMid(rs.getString("MID"));
			 	 mdto.setMbirth(rs.getString("MPASSWORD"));
			 	}
			} 
		catch (SQLException e) 
			{e.printStackTrace();
			}
		finally {pstmtClose();
				 rsClose();
				}
		
		return mdto;
	}
	
	
	
	
	
	
}
