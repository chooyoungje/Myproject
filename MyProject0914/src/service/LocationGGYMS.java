package service;

import javax.servlet.http.HttpServletRequest;

import dao.LocationDAO;
import dto.LocationDTO;

public class LocationGGYMS {

	public int locationGgym(HttpServletRequest request) {
		LocationDAO ldao = new LocationDAO();
		int lnumber = Integer.parseInt(request.getParameter("lnumber"));
		ldao.dbconnection();
		LocationDTO ldto = ldao.LocationInfo(lnumber);
		int result=ldao.GGYM(ldto);
		ldao.dbClose();
		return result;
	}
}