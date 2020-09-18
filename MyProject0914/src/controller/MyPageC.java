package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BasketDTO;
import dto.BoardDTO;
import dto.MemberDTO;
import service.MyPageS;

@WebServlet("/mypage")
public class MyPageC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageC() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		MyPageS svc = new MyPageS();
		HttpSession session = request.getSession();
		String loginid=(String) session.getAttribute("loginid");
		List<BasketDTO> baslist = svc.basketGet(loginid);
		MemberDTO mdto =svc.memberGet(loginid);
		List<BoardDTO> blist =svc.boardGet(loginid);
		request.setAttribute("baslist",baslist);
		request.setAttribute("mdto",mdto);
		request.setAttribute("blist", blist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Mypage.jsp");
		dispatcher.forward(request, response);
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request,response);
}


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request,response);
}
}
