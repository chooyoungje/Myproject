package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BasketDTO;
import service.BasketViewS;

@WebServlet("/basketview")
public class BasketViewC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BasketViewC() {
        super();
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BasketViewS svc = new BasketViewS();
		List<BasketDTO> blist = svc.basketView(request);
		request.setAttribute("basket",blist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("basketview.jsp");
		dispatcher.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
