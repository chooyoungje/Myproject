package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.LocationDAO;
import dto.LocationDTO;

public class LocationSearchS {

	public List<LocationDTO> locationSearch(HttpServletRequest request) {
		String search = request.getParameter("lsearch");
		LocationDAO ldao = new LocationDAO();
		ldao.dbconnection();
		List<LocationDTO> llist = ldao.LocationSearch(search);
		ldao.dbClose();
		return llist;
	}

}
