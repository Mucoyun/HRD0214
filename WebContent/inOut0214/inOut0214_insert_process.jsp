<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 29 -</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String storeCode = request.getParameter("storeCode");
		String productCode = request.getParameter("productCode");
		String inOutDate = request.getParameter("inOutDate");
		String gubun = request.getParameter("gubun");
		String saleQty = request.getParameter("saleQty");
		
		try{
			String sql = "insert into inOut0214 values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCode);
			pstmt.setString(2, productCode);
			pstmt.setString(3, inOutDate);
			pstmt.setString(4, gubun);
			pstmt.setString(5, saleQty);
			pstmt.executeUpdate();
			%><script>
				alert("입출고 테이블 등록 성공");
				location.href = "/HRD0214/inOut0214/inOut0214_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>