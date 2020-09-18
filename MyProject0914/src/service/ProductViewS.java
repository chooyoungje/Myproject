package service;


import javax.servlet.http.HttpServletRequest;

import dao.ProductDAO;
import dto.ProductDTO;

public class ProductViewS {

	public ProductDTO productView(HttpServletRequest request) {
		ProductDAO pdao = new ProductDAO();
		pdao.dbconnection();
		String search = request.getParameter("psearch");
		ProductDTO pdto = pdao.ProductView(search);
		pdao.dbClose();
		return pdto;
	}

}
