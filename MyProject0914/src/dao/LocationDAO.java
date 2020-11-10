package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.LocationDTO;

public class LocationDAO {

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
	public int LocationInput(LocationDTO ldto) {
		String sql="INSERT INTO LOCATION_INFO(LNUMBER,LNAME,LOCATION,LPNUMBER,LFILE)"
				+ "VALUES(LSEQ.NEXTVAL,?,?,?,?)";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, ldto.getLname());
			 pstmt.setString(2, ldto.getLocation());
			 pstmt.setString(3, ldto.getLpnumber());
			 pstmt.setString(4, ldto.getLfile());
			 result=pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		
		return result;
	}
	public List<LocationDTO> LocationSearch(String search) {
		String sql="SELECT * FROM LOCATION_INFO WHERE LNAME LIKE ?";
		List<LocationDTO> llist = new ArrayList<LocationDTO>();
		LocationDTO ldto = null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,"%"+search+"%");
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{ldto= new LocationDTO();
			 	 ldto.setLname(rs.getString("LNAME"));
			 	 ldto.setLocation(rs.getString("LOCATION"));
			 	 ldto.setLpnumber(rs.getString("LPNUMBER"));
			 	 ldto.setLfile(rs.getString("LFILE"));
			 	 llist.add(ldto);
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {rsClose();
				 pstmtClose();
		}
		return llist;
	}
	
	public LocationDTO LocationView(int lnumber) {
		String sql = "SELECT * FROM LOCATION_INFO WHERE LNUMBER=?";
		LocationDTO ldto = null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1,lnumber);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{ldto= new LocationDTO();
			 	 ldto.setLname(rs.getString("LNAME"));
			 	 ldto.setLocation(rs.getString("LOCATION"));
			 	 ldto.setLpnumber(rs.getString("LPNUMBER"));
			 	 ldto.setLfile(rs.getString("LFILE"));
			 	}
			} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {rsClose();
		 		 pstmtClose();
				}
		return ldto;
	}
	public LocationDTO LocationInfo(int lnumber) {
		String sql = "SELECT * FROM LOCATION_INFO WHERE LNUMBER=?";
		LocationDTO ldto = null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1,lnumber);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{ldto= new LocationDTO();
			 	 ldto.setLname(rs.getString("LNAME"));
			 	 ldto.setLocation(rs.getString("LOCATION"));
			 	 ldto.setLpnumber(rs.getString("LPNUMBER"));
			 	 ldto.setLfile(rs.getString("LFILE"));
			 	}
			} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {rsClose();
		 		 pstmtClose();
				}
		return ldto;
	}
	public int GGYM(LocationDTO ldto) {
		String sql="INSERT INTO GGYM(LNUMBER,LNAME,LOCATION)"
				+ "VALUES(?,?,?)";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, ldto.getLnumber());
			 pstmt.setString(2, ldto.getLname());
			 pstmt.setString(3, ldto.getLpnumber());
			 result=pstmt.executeUpdate();
			}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		return result;
	}
}
