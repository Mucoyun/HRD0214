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
		String send_productCode = request.getParameter("send_productCode");		
		
		try{
			String sql = "delete from product0214 where productCode=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, send_productCode);
			pstmt.executeUpdate();
			%><script>
				alert("상품 테이블 삭제 성공");
				location.href = "/HRD0214/product0214/product0214_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>