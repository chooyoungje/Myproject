package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.BasketDAO;
import dto.BasketDTO;

public class BasketViewS {

	public List<BasketDTO> basketView(HttpServletRequest request) {
		BasketDAO bdao = new BasketDAO();
		String bmid = request.getParameter("bmid");
		bdao.dbconnection();
		List<BasketDTO> blist = bdao.BasketView(bmid);
		bdao.dbClose();
		return blist;
	}

}
