package service;

import javax.servlet.http.HttpServletRequest;

import dao.LocationDAO;
import dto.LocationDTO;

public class LocationViewS {

	public LocationDTO locationView(HttpServletRequest request) {
		LocationDAO ldao = new LocationDAO();
		int lnumber = Integer.parseInt(request.getParameter("lnumber"));
		ldao.dbconnection();
		LocationDTO ldto = ldao.LocationView(lnumber);
		ldao.dbClose();
		return ldto;
	}

}
