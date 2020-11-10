package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.ProductDTO;

public class ProductDAO {

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
	public List<ProductDTO> ProductList(String search) {
		String sql="SELECT * FROM SHOPPING_PRODUCT WHERE PNAME LIKE?";
		List<ProductDTO> plist =new ArrayList<ProductDTO>();
		ProductDTO pdto =null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, "%"+search+"%");
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{pdto = new ProductDTO();
			 	 pdto.setPnumber(rs.getInt("PNUMBER"));
			 	 pdto.setPname(rs.getString("PNAME"));
			 	 pdto.setPcontents(rs.getString("PCONTENTS"));
			 	 pdto.setPfile(rs.getString("PFILE"));
			 	 pdto.setPprice(rs.getInt("PPRICE"));
			 	 plist.add(pdto);
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {rsClose();
		pstmtClose();
		}
		return plist;
	}
	
	public ProductDTO ProductView(String search) {
		String sql="SELECT * FROM SHOPPING_PRODUCT WHERE PNAME=?";
		ProductDTO pdto =null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, search);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{pdto = new ProductDTO();
			 	 pdto.setPnumber(rs.getInt("PNUMBER"));
			 	 pdto.setPname(rs.getString("PNAME"));
			 	 pdto.setPcontents(rs.getString("PCONTENTS"));
			 	 pdto.setPfile(rs.getString("PFILE"));
			 	 pdto.setPprice(rs.getInt("PPRICE"));
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {rsClose();
				 pstmtClose();
				}
		return pdto;
	}
	public int ProductInput(ProductDTO pdto) {
		String sql ="INSERT INTO SHOPPING_PRODUCT(PNUMBER,PNAME,PCONTENTS,PFILE,PPRICE,PAMOUNT)"
				+ "VALUES(PSEQ.NEXTVAL,?,?,?,?,?)";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, pdto.getPname());
			 pstmt.setString(2, pdto.getPcontents());
			 pstmt.setString(3, pdto.getPfile());
			 pstmt.setInt(4, pdto.getPprice());
			 pstmt.setInt(5, pdto.getPamount());
			 result=pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		return result;
	}
	public int ProductDelete(int pnumber) {
		String sql = "DELETE FROM SHOPPING_PRODUCT WHERE PNUMBER=?";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, pnumber);
			 result=pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		return result;
	}
	public void ProcutAmountout(int pnumber) {
		String sql="UPDATE SHOPPING_PRODUCT SET PAMOUNT=PAMOUNT-1 WHERE PNUMBER=?";
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, pnumber);
			 pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
		}
				
	}
	public ProductDTO ProductViewNumber(int pnumber) {
		String sql="SELECT * FROM SHOPPING_PRODUCT WHERE PNUMBER=?";
		ProductDTO pdto =null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, pnumber);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{pdto = new ProductDTO();
			 	 pdto.setPnumber(rs.getInt("PNUMBER"));
			 	 pdto.setPname(rs.getString("PNAME"));
			 	 pdto.setPcontents(rs.getString("PCONTENTS"));
			 	 pdto.setPfile(rs.getString("PFILE"));
			 	 pdto.setPprice(rs.getInt("PPRICE"));
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {rsClose();
				 pstmtClose();
				}
		return pdto;
	}
}
