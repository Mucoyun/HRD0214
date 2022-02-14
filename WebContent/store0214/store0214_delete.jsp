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
		String send_storeCode = request.getParameter("send_storeCode");		
		
		try{
			String sql = "delete from store0214 where storeCode=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, send_storeCode);
			pstmt.executeUpdate();
			%><script>
				alert("상품 테이블 삭제 성공");
				location.href = "/HRD0214/store0214/store0214_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>