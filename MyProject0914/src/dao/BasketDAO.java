package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.BasketDTO;

public class BasketDAO {

	
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
	public int BasketInput(BasketDTO bdto) {
		String sql="INSERT INTO MEMBER_BASKET(BPNUMBER,BPNAME,BMID,BPFILE,BPPRICE)"
				+ "VALUES(?,?,?,?,?)";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, bdto.getBpnumber());
			 pstmt.setString(2, bdto.getBpname());
			 pstmt.setString(3, bdto.getBmid());
			 pstmt.setString(4, bdto.getBpfile());
			 pstmt.setInt(5, bdto.getBpprice());
			 result=pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		return result;
	}
	
	public List<BasketDTO> BasketView(String bmid) {
		String sql="SELECT * FROM MEMBER_BASKET WHERE BMID=?";
		List<BasketDTO> blist = new ArrayList<BasketDTO>();
		BasketDTO bdto = null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, bmid);
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{bdto = new BasketDTO();
			 	 bdto.setBpnumber(rs.getInt("BPNUMBER"));
			 	 bdto.setBpname(rs.getString("BPNAME"));
			 	 bdto.setBmid(rs.getString("BMID"));
			 	 bdto.setBpfile(rs.getString("BPFILE"));
			 	 bdto.setBpprice(rs.getInt("BPPRICE"));
			 	 blist.add(bdto);
			 	}
			}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {rsClose();
		 pstmtClose();
}
		return blist;
	}
	
	
}
