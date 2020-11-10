package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.BigDateDAO;
import dto.BigDateDTO;

public class AdminS {

	public AdminS() {
	}

	public List<BigDateDTO> graph(HttpServletRequest request) {
		BigDateDAO dao = new BigDateDAO(); 
		dao.dbconnection();
		List<BigDateDTO> list = dao.DataView();
		dao.dbClose();
		return list;
	}	
}