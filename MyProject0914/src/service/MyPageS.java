package service;

import java.util.List;

import dao.BasketDAO;
import dao.BoardDAO;
import dao.MemberDAO;
import dto.BasketDTO;
import dto.BoardDTO;
import dto.MemberDTO;

public class MyPageS {

	public List<BasketDTO> basketGet(String loginid) {
		BasketDAO basdao = new BasketDAO();
		basdao.dbconnection();
		List<BasketDTO> baslist = basdao.BasketView(loginid);
		basdao.dbClose();
		return baslist;
	}

	
	
	public MemberDTO memberGet(String loginid) {
		MemberDAO mdao = new MemberDAO();
		mdao.dbconnection();
		MemberDTO mdto = mdao.MemberView(loginid);
		mdao.dbClose();
		return mdto;
	}

	
	
	public List<BoardDTO> boardGet(String loginid) {
		BoardDAO bdao = new BoardDAO();
		bdao.dbconnection();
		List<BoardDTO> blist = bdao.BoardList(loginid);
		bdao.dbClose();
		return blist;
	}
	
	

}
