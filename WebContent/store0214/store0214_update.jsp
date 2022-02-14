<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 29 -</title>
	<script>
		function gotry() {
			if(document.iu_form.storeName.value == ""){
				alert("매장명이 입력되지 않았습니다.");
				document.iu_form.storeName.focus();
			}else if(document.iu_form.productCode.value == ""){
				alert("상품코드가 입력되지 않았습니다.");
				document.iu_form.productCode.focus();
			}else if(document.iu_form.Qty.value == ""){
				alert("수량이 입력되지 않았습니다.");
				document.iu_form.Qty.focus();
			}else{
				document.iu_form.action = "store0214_update_process.jsp";
				document.iu_form.submit();
			}
		}
		function notry() {
			//document.iu_form.reset();
			location.href = "/HRD0214/store0214/store0214_select.jsp";
		}
		function storeCodeChk() {
			document.iu_form.submit();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_storeCode = request.getParameter("send_storeCode");
	
		String storeCode = request.getParameter("storeCode");
	
		String productCode = request.getParameter("productCode");	
		String productName = "";
		
		String storeName = request.getParameter("storeName");
		String Qty = request.getParameter("Qty");
	
		try{
			String sql = "select storeCode,productCode,storeName,Qty from store0214 where storeCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_storeCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				storeCode = rs.getString(1);
				productCode = rs.getString(2);
				storeName = rs.getString(3);
				Qty = rs.getString(4);
			}
			
			sql = "select productName from product0214 where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				productName = rs.getString(1);
			}else if(productCode == null){
				productCode = "";
			}else{
				productCode = "";
				%><script>
					alert("등록되어 있지 않은 상품코드 입니다.");
					storeCodeChk();
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(productCode == null) { productCode = ""; }
		if(storeName == null) { storeName = ""; }
		if(Qty == null) { Qty = ""; }
		
	%>
	<section>
		<h2>매장 수정 화면</h2>
		<form name="iu_form" method="post" action="store0214_update.jsp">
			<table id="iu_table">
				<tr>
					<th>매장 코드</th>
					<td><input type="text" name="storeCode" value="<%=storeCode %>" readonly></td>
				</tr>
				<tr>
					<th>매장명</th>
					<td><input type="text" name="storeName" value="<%=storeName %>"></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productCode" value="<%=productCode %>" onchange="storeCodeChk()"></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="productName" value="<%=productName %>" readonly></td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="Qty" value="<%=Qty %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="notry()">목록</button>
						<button type="button" onclick="gotry()">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>