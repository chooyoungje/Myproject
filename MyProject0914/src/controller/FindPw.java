package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.FindPwS;

@WebServlet("/findpw")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindPw() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		FindPwS svc = new FindPwS();
		MemberDTO mdto =svc.findPw(request);
		if(mdto==null)
			{response.sendRedirect("FindPwFail.jsp");
			}
		else
			{request.setAttribute("mdto", mdto);
			 RequestDispatcher dispatcher = request.getRequestDispatcher("FindPwSuccess.jsp");
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
