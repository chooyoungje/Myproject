package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.LocationDTO;
import service.LocationViewS;

@WebServlet("/locationview")
public class LocationViewC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LocationViewC() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		LocationViewS svc = new LocationViewS();
		LocationDTO ldto = svc.locationView(request);
		request.setAttribute("ldto", ldto);
		RequestDispatcher dipatcher = request.getRequestDispatcher("Main.jsp");
		dipatcher.forward(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
