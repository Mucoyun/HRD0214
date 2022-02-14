<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 29 -</title>
	<script>
		function gotry() {
			if(document.iu_form.productName.value == ""){
				alert("상품명이 입력되지 않았습니다.");
				document.iu_form.productName.focus();
			}else if(document.iu_form.storeCode.value == ""){
				alert("매장코드가 입력되지 않았습니다.");
				document.iu_form.storeCode.focus();
			}else if(document.iu_form.unitPrice.value == ""){
				alert("단가가 입력되지 않았습니다.");
				document.iu_form.unitPrice.focus();
			}else if(document.iu_form.stockQty.value == ""){
				alert("재고수량이 입력되지 않았습니다.");
				document.iu_form.stockQty.focus();
			}else{
				document.iu_form.action = "product0214_insert_process.jsp";
				document.iu_form.submit();
			}
		}
		function notry() {
			document.iu_form.reset();
			//location.href = "";
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
		int productCode = 0;
		String storeCode = request.getParameter("storeCode");
		String storeName = "";
		
		String productName = request.getParameter("productName");
		String unitPrice = request.getParameter("unitPrice");
		String stockQty = request.getParameter("stockQty");
		
		try{
			String sql = "select max(productCode) from product0214";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				productCode = rs.getInt(1);
				productCode++;
			}else{
				productCode = 100001;
			}
			
			sql = "select storeName from store0214 where storeCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				storeName = rs.getString(1);
			}else if(storeCode == null){
				storeCode = "";
			}else{
				storeCode = "";
				%><script>
					alert("등록되어 있지 않은 매장코드 입니다.");
					storeCodeChk();
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(storeCode == null) { storeCode = ""; }
		if(storeName == null) { storeName = ""; }
		if(productName == null) { productName = ""; }
		if(unitPrice == null) { unitPrice = ""; }
		if(stockQty == null) { stockQty = ""; }
		
		
	%>
	<section>
		<h2>상품 등록 화면</h2>
		<form name="iu_form" method="post" action="product0214_insert.jsp">
			<table id="iu_table">
				<tr>
					<th>상품 코드(자동생성)</th>
					<td><input type="text" name="productCode" value="<%=productCode %>" readonly>마지막번호+1</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="productName" value="<%=productName %>"></td>
				</tr>
				<tr>
					<th>매장코드</th>
					<td><input type="text" name="storeCode" value="<%=storeCode %>" onchange="storeCodeChk()"></td>
				</tr>
				<tr>
					<th>매장명</th>
					<td><input type="text" name="storeName" value="<%=storeName %>" readonly></td>
				</tr>
				<tr>
					<th>단가</th>
					<td><input type="text" name="unitPrice" value="<%=unitPrice %>"></td>
				</tr>
				<tr>
					<th>재고수량</th>
					<td><input type="text" name="stockQty" value="<%=stockQty %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">등록</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>