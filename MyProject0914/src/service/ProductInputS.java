package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDAO;
import dto.ProductDTO;

public class ProductInputS {

	public int productInput(HttpServletRequest request) throws IOException {
		String savepath ="D:\\source\\servlet\\MyProject0914\\WebContent\\ProductFile";
		MultipartRequest multi = new MultipartRequest(
				request,
				savepath,
				10*1024*1024,
				//10�ް�
				"UTF-8",
				new DefaultFileRenamePolicy());
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = new ProductDTO();
		pdto.setPnumber(Integer.parseInt(multi.getParameter("pnumber")));
		pdto.setPname(multi.getParameter("pname"));
		pdto.setPcontents(multi.getParameter("pcontents"));
		pdto.setPprice(Integer.parseInt(multi.getParameter("pprice")));
		pdto.setPfile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		pdao.dbconnection();
		int result = pdao.ProductInput(pdto);
		pdao.dbClose();
		return result;
	}

}
