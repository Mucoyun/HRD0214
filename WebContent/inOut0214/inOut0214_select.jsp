<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<section>
		<h2>입/출고 정보 목록</h2>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="300">입.출고일자</th>
				<th width="100">매장코드</th>
				<th width="100">매장명</th>
				<th width="100">상품코드</th>
				<th width="300">상품명</th>
				<th width="100">입.출고 구분</th>
				<th width="100">입고 수량</th>
				<th width="100">출고 수량</th>
			</tr>
			<%
				int no = 0;
				try{
					String sql = "select to_char(a.inOutDate,'yyyy-mm-dd'),a.storeCode,b.storeName,a.productCode,c.productName,a.gubun,a.saleQty from inOut0214 a, store0214 b,product0214 c where a.storeCode=b.storeCode and b.productCode=c.productCode order by a.inOutDate asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String inOutDate = rs.getString(1);
						String storeCode = rs.getString(2);
						String storeName = rs.getString(3);
						String productCode = rs.getString(4);
						String productName = rs.getString(5);
						String gubun = rs.getString(6);
						String saleQty = rs.getString(7);
						
						if(gubun.equals("1")){ gubun="입고"; }
						else if(gubun.equals("2")){ gubun="출고"; }
						
						%>
						<tr>
							<td><%=no %></td>
							<td><%=inOutDate %></td>
							<td><%=storeCode %></td>
							<td><%=storeName %></td>
							<td><%=productCode %></td>
							<td><%=productName %></td>
							<td><%=gubun %></td>
							<%
							if(gubun.equals("입고")){ 
								%>
								<td><%=saleQty %></td>
								<td></td>
								<%
							}
							else if(gubun.equals("출고")){ 
								%>
								<td></td>
								<td><%=saleQty %></td>
								<%
							}
							%>
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