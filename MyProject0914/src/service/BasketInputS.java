package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.BasketDAO;
import dao.BigDateDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import dto.BasketDTO;
import dto.BigDateDTO;
import dto.ProductDTO;

public class BasketInputS {

	public int basketInput(HttpServletRequest request) throws IOException {
	
		BasketDAO bdao = new BasketDAO();
		BasketDTO bdto = new BasketDTO();
		MemberDAO mdao = new MemberDAO();
		ProductDAO pdao = new ProductDAO();
		BigDateDTO datadto = new BigDateDTO();
		BigDateDAO datadao = new BigDateDAO();
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("loginid");
		int pnumber=Integer.parseInt(request.getParameter("pnumber"));
		bdao.dbconnection();
		pdao.dbconnection();
		datadao.dbconnection();
		mdao.dbconnection();
		ProductDTO pdto=pdao.ProductViewNumber(pnumber);
		bdto.setBmid(mid);
		bdto.setBpnumber(pdto.getPnumber());
		bdto.setBpname(pdto.getPname());
		bdto.setBpprice(pdto.getPprice());
		bdto.setPbamount(Integer.parseInt(request.getParameter("pbamount")));
		
		String magedate=mdao.MemberAGE(mid);
		int mage=Integer.parseInt(magedate.substring(0, 2));
		int age=0;
		if(mage-20<=0)
			{age=-(mage-20);
			}
		else 
			{age=100-(mage-20);
			}
		datadto.setMage(age);
		datadto.setPnumber(pnumber);
		datadao.InData(datadto);
		pdao.ProcutAmountout(pnumber); 
		
		int result = bdao.BasketInput(bdto);
		mdao.dbClose();
		datadao.dbClose();
		pdao.dbClose();
		bdao.dbClose();
		return result;
	}
}