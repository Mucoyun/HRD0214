<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 29 -</title>
	<style>
		p{
			display: block;
			padding: 0 !important;
			margin: 0 auto;
			width: 900px;
		}
	</style>
	<script>
		function notry() {
			location.href = "store0214_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int no = 0;
		try{
			String sql = "select count(*) from store0214";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>상품 등록 화면</h2>
		<p>총 <%=no %>개의 매장정보가 있습니다.</p>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="100">매장코드</th>
				<th width="100">매장명</th>
				<th width="100">상품코드</th>
				<th width="300">상품명</th>
				<th width="100">상품수량</th>
				<th width="100">관리</th>
			</tr>
			<%
				no = 0;
				try{
					String sql = "select a.storeCode,a.storeName,a.productCode,b.productName,a.Qty from store0214 a, product0214 b where a.productCode=b.productCode order by a.storeCode asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String storeCode = rs.getString(1);
						String storeName = rs.getString(2);
						String productCode = rs.getString(3);
						String productName = rs.getString(4);
						String Qty = rs.getString(5);
						%>
						<tr>
							<td><%=no %></td>
							<td id="selecttd"><a href="store0214_update.jsp?send_storeCode=<%=storeCode %>"><%=storeCode %></a></td>
							<td><%=storeName %></td>
							<td><%=productCode %></td>
							<td><%=productName %></td>
							<td><%=Qty %></td>
							<td>
								<a href="store0214_delete.jsp?send_storeCode=<%=storeCode %>"
								onclick="if(!confirm('정말로 삭제하시겠습니까?')){ return false; }">삭제</a>
							</td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
		<button id="btn" type="button" onclick="notry()">매장 정보 추가</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>