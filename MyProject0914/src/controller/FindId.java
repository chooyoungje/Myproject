package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.FindIdS;

@WebServlet("/findid")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindId() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		FindIdS svc = new FindIdS();
		MemberDTO mdto =svc.findId(request);
		if(mdto==null)
			{response.sendRedirect("FindIdFail.jsp");
			}
		else
			{request.setAttribute("mdto", mdto);
			 RequestDispatcher dispatcher = request.getRequestDispatcher("FindIdSuccess.jsp");
			 dispatcher.forward(request, response);
			}
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request,response);
}


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request,response);
}

}
