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
		String productCode = request.getParameter("productCode");		
		String productName = request.getParameter("productName");
		String storeCode = request.getParameter("storeCode");
		String storeName = request.getParameter("storeName");
		String unitPrice = request.getParameter("unitPrice");
		String stockQty = request.getParameter("stockQty");
		
		try{
			String sql = "insert into product0214 values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCode);
			pstmt.setString(2, productName);
			pstmt.setString(3, storeCode);
			pstmt.setString(4, unitPrice);
			pstmt.setString(5, stockQty);
			pstmt.executeUpdate();
			%><script>
				alert("상품 테이블 등록 성공");
				location.href = "/HRD0214/product0214/product0214_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>