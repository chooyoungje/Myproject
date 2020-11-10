package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.BigDateDTO;

public class BigDateDAO {

	
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
	public void InData(BigDateDTO datadto) {
		String sql="INSERT INTO BIG_DATE(PNUMBER,MAGE)"
				+ "VALUES(?,?)";
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1,datadto.getPnumber());
			 pstmt.setInt(2, datadto.getMage());
			 pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			pstmtClose();
		}
	}
	public List<BigDateDTO> DataView() {
	String sql="SELECT * FROM BIG_DATE";
	List<BigDateDTO> list= new ArrayList<BigDateDTO>();
	BigDateDTO dto =null;
	try {pstmt=con.prepareStatement(sql);
		 rs=pstmt.executeQuery();
		 while(rs.next())
		 	{dto = new BigDateDTO();
		 	 dto.setMage(rs.getInt("MAGE"));
		 	 dto.setPnumber(rs.getInt("PNUMBER"));
		 	 list.add(dto);
		 	}
		} 
	catch (SQLException e) {
		e.printStackTrace();
	}
	finally {rsClose();
			 pstmtClose();
			}
	return list;
	}
	
}
