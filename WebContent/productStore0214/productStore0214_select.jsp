<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 29 -</title>
	<script>
		function notry() {
			location.href = "/HRD0214/product0214/product0214_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<% DecimalFormat de = new DecimalFormat("###,###,###"); %>
	<section>
		<h2>상품/매장 정보 목록</h2>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="100">상품코드</th>
				<th width="300">상품명</th>
				<th width="100">매장코드</th>
				<th width="100">매장명</th>
				<th width="200">단가</th>
				<th width="100">수량</th>
			</tr>
			<%
				int no = 0;
				try{
					String sql = "select a.productCode,a.productName,a.storeCode,b.storeName,a.unitPrice,a.stockQty from product0214 a, store0214 b where a.storeCode=b.storeCode order by a.productCode asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String productCode = rs.getString(1);
						String productName = rs.getString(2);
						String storeCode = rs.getString(3);
						String storeName = rs.getString(4);
						int unitPrice = rs.getInt(5);
						String stockQty = rs.getString(6);
						%>
						<tr>
							<td><%=no %></td>
							<td><%=productCode %></td>
							<td><%=productName %></td>
							<td><%=storeCode %></td>
							<td><%=storeName %></td>
							<td><%=de.format(unitPrice) %></td>
							<td><%=stockQty %></td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
		<button id="btn" type="button" onclick="notry()">상품 정보 추가</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>