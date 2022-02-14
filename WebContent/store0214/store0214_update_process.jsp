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
		String storeName = request.getParameter("storeName");
		String productCode = request.getParameter("productCode");
		String Qty = request.getParameter("Qty");
		
		try{
			String sql = "update store0214 set storeName=?,productCode=?,Qty=? where storeCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeName);
			pstmt.setString(2, productCode);
			pstmt.setString(3, Qty);
			pstmt.setString(4, storeCode);
			pstmt.executeUpdate();
			%><script>
				alert("매장 테이블 수정 성공");
				location.href = "/HRD0214/store0214/store0214_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>