package service;

import javax.servlet.http.HttpServletRequest;

import dao.ProductDAO;

public class ProductDeleteS {

	public int productDelete(HttpServletRequest request) {
		ProductDAO pdao = new ProductDAO();
		int pnumber =Integer.parseInt(request.getParameter("pnumber"));
		pdao.dbconnection();
		int result= pdao.ProductDelete(pnumber);
		pdao.dbClose();
		return result;
	}

}
