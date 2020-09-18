package service;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BasketDAO;
import dao.BigDateDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import dto.BasketDTO;
import dto.BigDateDTO;

public class BasketInputS {

	public int basketInput(HttpServletRequest request) throws IOException {
		String savepath ="D:\\source\\servlet\\MyProject0914\\WebContent\\BasketFile";
		MultipartRequest multi = new MultipartRequest(
				request,
				savepath,
				10*1024*1024,
				//10�ް�
				"UTF-8",
				new DefaultFileRenamePolicy());
		BasketDAO bdao = new BasketDAO();
		BasketDTO bdto = new BasketDTO();
		bdto.setBmid(multi.getParameter("bmid"));
		bdto.setBpname(multi.getParameter("bpname"));
		bdto.setBpnumber(Integer.parseInt(multi.getParameter("bpnumber")));
		bdto.setBpprice(Integer.parseInt(multi.getParameter("bpprice")));
		bdto.setBpfile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		bdao.dbconnection();
		
		int pnumber=Integer.parseInt(multi.getParameter("pnumber"));
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("loginid");
		MemberDAO mdao = new MemberDAO();
		ProductDAO pdao = new ProductDAO();
		BigDateDTO datadto = new BigDateDTO();
		BigDateDAO datadao = new BigDateDAO();
		GregorianCalendar today = new GregorianCalendar ( );
		int year = today.get ( today.YEAR );
		String magedate=mdao.MemberAGE(mid);
		int mage=Integer.parseInt(magedate.substring(0, 5));
		int age=year-mage;
		datadto.setMage(age);
		datadto.setPnumber(pnumber);
		datadao.InData(datadto);
		pdao.ProcutAmountout(pnumber);
	
		int result = bdao.BasketInput(bdto);
		bdao.dbClose();
		return result;
	}

}
