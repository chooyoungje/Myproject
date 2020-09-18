package service;

import javax.servlet.http.HttpServletRequest;

import dao.LocationDAO;
import dto.LocationDTO;

public class LocationViewS {

	public LocationDTO locationView(HttpServletRequest request) {
		LocationDAO ldao = new LocationDAO();
		String lview =request.getParameter("location");
		ldao.dbconnection();
		LocationDTO ldto = ldao.LocationView(lview);
		ldao.dbClose();
		return ldto;
	}

}
