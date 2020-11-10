package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.LocationDAO;
import dto.LocationDTO;

public class LocationInputS {

	public int locationInput(HttpServletRequest request) throws IOException {
		String savepath ="C:\\Users\\1\\git\\Myproject\\MyProject0914\\WebContent\\LocationFile";
		MultipartRequest multi = new MultipartRequest(
				request,
				savepath,
				10*1024*1024,
				//10�ް�
				"UTF-8",
				new DefaultFileRenamePolicy());
		LocationDAO ldao = new LocationDAO();
		LocationDTO ldto = new LocationDTO();
		String location1 = multi.getParameter("location1");
		String location2 = multi.getParameter("location2");
		String location3 = multi.getParameter("location3");
		String location4 = multi.getParameter("location4");
		String location5 = multi.getParameter("location5");
		String location =location1+location2+location3+location4+location5;
		ldto.setLpnumber(multi.getParameter("lpnumber"));
		ldto.setLname(multi.getParameter("lname"));
		ldto.setLocation(location);
		ldto.setLfile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		ldao.dbconnection();
		int result = ldao.LocationInput(ldto);
		ldao.dbClose();
		return result;
	}

}
