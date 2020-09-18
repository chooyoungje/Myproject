package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.LocationDAO;
import dto.LocationDTO;

public class LocationInputS {

	public int locationInput(HttpServletRequest request) throws IOException {
		String savepath ="D:\\source\\servlet\\MyProject0914\\WebContent\\LocationFile";
		MultipartRequest multi = new MultipartRequest(
				request,
				savepath,
				10*1024*1024,
				//10�ް�
				"UTF-8",
				new DefaultFileRenamePolicy());
		LocationDAO ldao = new LocationDAO();
		LocationDTO ldto = new LocationDTO();
		ldto.setLpnumber(multi.getParameter("lpnumber"));
		ldto.setLname(multi.getParameter("lname"));
		ldto.setLocation(multi.getParameter("location"));
		ldto.setLfile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		ldao.dbconnection();
		int result = ldao.LocationInput(ldto);
		ldao.dbClose();
		return result;
	}

}
