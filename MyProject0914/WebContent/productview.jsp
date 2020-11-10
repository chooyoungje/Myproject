<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="maintool.jsp" flush="false"/>
<body>
	
	${bdto.pnumber}
	${bdto.pname}
	${bdto.pcontents}
	${bdto.pfile}
	${bdto.pprice}

</body>
</html>