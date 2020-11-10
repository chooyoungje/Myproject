package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.BoardDTO;

public class BoardDAO {

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
	
	public List<BoardDTO> BoardList(String mid) {
		String sql="SELECT * FROM BOARD WHERE BWRITER=?";
		List<BoardDTO> blist = new ArrayList<BoardDTO>();
		BoardDTO bdto =null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mid);
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{bdto = new BoardDTO();
				 bdto.setBnumber(rs.getInt("BNUMBER"));
				 bdto.setBwriter(rs.getString("BWRITER"));
				 bdto.setBtitle(rs.getString("BTITLE"));
				 bdto.setBcontents(rs.getString("BCONTENTS"));
				 bdto.setBdate(rs.getDate("BDATE"));
				 bdto.setBhits(rs.getInt("BHITS"));
				 bdto.setBfile(rs.getString("BFILE"));
				 bdto.setBnotice(rs.getInt("BNOTICE"));
				 blist.add(bdto);
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				 rsClose();
		 		}
		return blist;
	}
	
	
	public int BoardWrite(BoardDTO bdto) {
		String sql="INSERT INTO BOARD(BNUMBER,BWRITER,BTITLE,BCONTENTS,BDATE,BHITS,BFILE,BNOTICE)"
				+ "VALUES(BSEQ2.NEXTVAL,?,?,?,SYSDATE,0,?,?)";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, bdto.getBwriter());
			 pstmt.setString(2, bdto.getBtitle());
			 pstmt.setString(3, bdto.getBcontents());
			 pstmt.setString(4, bdto.getBfile());
			 pstmt.setInt(5, bdto.getBnotice());
			 result=pstmt.executeUpdate();
			} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
		 		}
		return result;
	}
	public int BoardDelete(int bnumber) {
		String sql="DELETE FROM BOARD WHERE BNUMBER=?";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, bnumber);
			 result=pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
 		}
		return result;
	}
	public BoardDTO BoardView(int bnumber) {
		String sql="SELECT * FROM BOARD WHERE BNUMBER=?";
		BoardDTO bdto =null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, bnumber);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{bdto = new BoardDTO();
				 bdto.setBnumber(rs.getInt("BNUMBER"));
				 bdto.setBwriter(rs.getString("BWRITER"));
				 bdto.setBtitle(rs.getString("BTITLE"));
				 bdto.setBcontents(rs.getString("BCONTENTS"));
				 bdto.setBdate(rs.getDate("BDATE"));
				 bdto.setBhits(rs.getInt("BHITS"));
				 bdto.setBfile(rs.getString("BFILE"));
				 bdto.setBnotice(rs.getInt("BNOTICE"));
			 	}
			}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
		 		 rsClose();
				}
		return bdto;
	}
	
	public int BoardUpdateProcess(BoardDTO bdto) {
		String sql="UPDATE BOARD SET BTITLE=?,BCONTENTS=?,BDATE=SYSDATE,BFILE=? WHERE BNUMBER=?";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, bdto.getBtitle());
			 pstmt.setString(2, bdto.getBcontents());
			 pstmt.setString(3, bdto.getBfile());
			 pstmt.setInt(4, bdto.getBnumber());
			 result=pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}
		return result;
	}
	public List<BoardDTO> BoardListAll() {
		String sql="SELECT * FROM (SELECT B.*, ROW_NUMBER() OVER(ORDER BY BNOTICE DESC,BNUMBER DESC) AS RN FROM BOARD B) WHERE RN BETWEEN ? AND ?";
		List<BoardDTO> blist = new ArrayList<BoardDTO>();
		BoardDTO bdto =null;
		try {pstmt=con.prepareStatement(sql);
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{bdto = new BoardDTO();
				 bdto.setBnumber(rs.getInt("BNUMBER"));
				 bdto.setBwriter(rs.getString("BWRITER"));
				 bdto.setBtitle(rs.getString("BTITLE"));
				 bdto.setBcontents(rs.getString("BCONTENTS"));
				 bdto.setBdate(rs.getDate("BDATE"));
				 bdto.setBhits(rs.getInt("BHITS"));
				 bdto.setBfile(rs.getString("BFILE"));
				 bdto.setBnotice(rs.getInt("BNOTICE"));
				 blist.add(bdto);
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				 rsClose();
		 		}
		return blist;
	}
	
	
	public int listCount() {
		String sql = "SELECT COUNT(BNUMBER) FROM BOARDLIST";
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
  	
	
	public List<BoardDTO> boardListPaging(int startRow, int endRow) {
		String sql = "SELECT * FROM (SELECT B.*, ROW_NUMBER() OVER(ORDER BY BNOTICE DESC,BNUMBER DESC) AS RN FROM BOARD B) WHERE RN BETWEEN ? AND ?";
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		BoardDTO board = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new BoardDTO();
				board.setBnumber(rs.getInt("BNUMBER"));
				board.setBwriter(rs.getString("BWRITER"));
				board.setBtitle(rs.getString("BTITLE"));
				board.setBcontents(rs.getString("BCONTENTS"));
				board.setBdate(rs.getDate("BDATE"));
				board.setBhits(rs.getInt("BHITS"));
				board.setBfile(rs.getString("BFILE"));
				board.setBnotice(rs.getInt("BNOTICE"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return boardList;
	}
	
	
	public List<BoardDTO> BoardSearch(String bsearch) {
		String sql="SELECT * FROM BOARD WHERE BTITLE LIKE ? OR BWRITER LIKE ?";
		List<BoardDTO> blist = new ArrayList<BoardDTO>();
		BoardDTO bdto =null;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, "%"+bsearch+"%");
			 pstmt.setString(2, "%"+bsearch+"%");
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{bdto = new BoardDTO();
				 bdto.setBnumber(rs.getInt("BNUMBER"));
				 bdto.setBwriter(rs.getString("BWRITER"));
				 bdto.setBtitle(rs.getString("BTITLE"));
				 bdto.setBcontents(rs.getString("BCONTENTS"));
				 bdto.setBdate(rs.getDate("BDATE"));
				 bdto.setBhits(rs.getInt("BHITS"));
				 bdto.setBfile(rs.getString("BFILE"));
				 bdto.setBnotice(rs.getInt("BNOTICE"));
				 blist.add(bdto);
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				 rsClose();
		 		}
		return blist;
	}
	public List<BoardDTO> BoardListRange() {
		String sql="SELECT * FROM BOARD ORDER BY BDATE DESC" ;
		List<BoardDTO> blist = new ArrayList<BoardDTO>();
		BoardDTO bdto =null;
		try {pstmt=con.prepareStatement(sql);
			 rs=pstmt.executeQuery();
			 while(rs.next())
			 	{bdto = new BoardDTO();
				 bdto.setBnumber(rs.getInt("BNUMBER"));
				 bdto.setBwriter(rs.getString("BWRITER"));
				 bdto.setBtitle(rs.getString("BTITLE"));
				 bdto.setBcontents(rs.getString("BCONTENTS"));
				 bdto.setBdate(rs.getDate("BDATE"));
				 bdto.setBhits(rs.getInt("BHITS"));
				 bdto.setBfile(rs.getString("BFILE"));
				 bdto.setBnotice(rs.getInt("BNOTICE"));
				 blist.add(bdto);
			 	}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				 rsClose();
		 		}
		return blist;
	}
	public int BoardCount(String mid) {
		String sql="SELECT COUNT(BWRITER) FROM BOARD WHERE BWRITER=?";
		int result=0;
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mid);
			 rs=pstmt.executeQuery();
			 if(rs.next())
			 	{result=rs.getInt("COUNT(BWRITER)");
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
	
	public void BoardHits(int bnumber) {
		String sql="UPDATE BOARD SET BHITS=BHITS+1 WHERE BNUMBER=?";
		try {pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, bnumber);
			 pstmt.executeUpdate();
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {pstmtClose();
				}	
	}
}
