package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemberJoinS {

	public int memberJoion(HttpServletRequest request) throws IOException {
		
		String mid = request.getParameter("mid");
		String mpassword= request.getParameter("mpassword");
		String mname= request.getParameter("mname");
		String mbirth= request.getParameter("mbirth"); 
		String maddress= request.getParameter("maddress");
		String mphone= request.getParameter("mphone");
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		mdto.setMid(mid);
		mdto.setMpassword(mpassword);
		mdto.setMname(mname);
		mdto.setMbirth(mbirth);
		mdto.setMaddress(maddress);
		mdto.setMphone(mphone);
		mdao.dbconnection();
		int result= mdao.MemberJoin(mdto);
		mdao.dbClose();
		return result;
	}
}