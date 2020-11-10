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
		String maddress1= request.getParameter("maddress1");
		String maddress2= request.getParameter("maddress2");
		String maddress3= request.getParameter("maddress3");
		String maddress4= request.getParameter("maddress4");
		String maddress5= request.getParameter("maddress5");
		String maddress = maddress1+maddress2+maddress3+maddress4+maddress5;
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