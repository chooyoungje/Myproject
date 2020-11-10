package service;

import javax.servlet.http.HttpServletRequest;

import dao.MemberDAO;
import dto.MemberDTO;

public class FindPwS {

	public MemberDTO findPw(HttpServletRequest request) {
		MemberDAO mdao= new MemberDAO();
		String mid=request.getParameter("mid");
		String mbirth=request.getParameter("mbirth");
		mdao.dbconnection();
		MemberDTO mdto = mdao.FindPW(mid, mbirth);
		mdao.dbClose();
		return mdto;
	}
}
