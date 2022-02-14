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
			location.href = "inOut0214_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<% DecimalFormat de = new DecimalFormat("###,###,###"); %>
	<section>
		<h2>출고 정보(금액) 목록</h2>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="300">입.출고일자</th>
				<th width="100">매장코드</th>
				<th width="100">매장명</th>
				<th width="100">상품코드</th>
				<th width="300">상품명</th>
				<th width="100">출고 수량</th>
				<th width="200">단가</th>
				<th width="200">출고 금액</th>
				<th width="200">할인된 금액(10%)</th>
			</tr>
			<%
				int no = 0;
				try{
					String sql = "select to_char(a.inOutDate,'yyyy-mm-dd'),a.storeCode,b.storeName,a.productCode,c.productName,a.saleQty,c.unitPrice,(a.saleQty*c.unitPrice) from inOut0214 a, store0214 b,product0214 c where a.storeCode=b.storeCode and a.productCode=c.productCode and a.gubun='2' order by a.inOutDate asc,a.storeCode asc,a.productCode asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String inOutDate = rs.getString(1);
						String storeCode = rs.getString(2);
						String storeName = rs.getString(3);
						String productCode = rs.getString(4);
						String productName = rs.getString(5);
						int saleQty = rs.getInt(6);
						int unitPrice = rs.getInt(7);
						int result = rs.getInt(8);
						
						%>
						<tr>
							<td><%=no %></td>
							<td><%=inOutDate %></td>
							<td><%=storeCode %></td>
							<td><%=storeName %></td>
							<td><%=productCode %></td>
							<td><%=productName %></td>
							<td><%=saleQty %></td>
							<td><%=de.format(unitPrice) %></td>
							<td><%=de.format(result) %></td>
							<td>
							<%
								if(saleQty >= 5){
								%>
									<%=de.format(result*0.9) %>
								<%
								}else{
								%>
									<%=de.format(result*1) %>
								<%
								}
							%>
							</td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
		<button id="btn" type="button" onclick="notry()">입출고 정보 추가</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>