package service;

import javax.servlet.http.HttpServletRequest;

import dao.MemberDAO;
import dto.MemberDTO;

public class FindIdS {

	public MemberDTO findId(HttpServletRequest request) {
		MemberDAO mdao = new MemberDAO();
		mdao.dbconnection();
		String mname=request.getParameter("mname");
		String mbirth=request.getParameter("mbirth");
		MemberDTO mdto = mdao.FindId(mname,mbirth);
		mdao.dbClose();
		return mdto;
	}

}
