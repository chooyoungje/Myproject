package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.LocationDTO;
import service.LocationSearchS;

@WebServlet("/locationsearch")
public class LocationSearchC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LocationSearchC() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		LocationSearchS svc = new LocationSearchS();
		List<LocationDTO> llist =svc.locationSearch(request);
		request.setAttribute("llist", llist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("locationsearch.jsp");
		dispatcher.forward(request, response);
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request,response);
}


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request,response);
}
}
