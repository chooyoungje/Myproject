package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.BasketDAO;

public class BasketDeleteS {

	public int basDelete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mid= (String)session.getAttribute("loginid");
		int bpnum = Integer.parseInt(request.getParameter("bpnumber"));
		BasketDAO bdao = new BasketDAO();
		bdao.dbconnection();
		int result = bdao.BasketDelete(mid,bpnum);
		bdao.dbClose();
		return result;
	}

}
