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
				document.iu_form.action = "store0214_insert_process.jsp";
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
		String storeCode = request.getParameter("storeCode");
	
		String productCode = request.getParameter("productCode");	
		String productName = "";
		
		String storeName = request.getParameter("storeName");
		String Qty = request.getParameter("Qty");
	
		try{
			String sql = "select productName from product0214 where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				productName = rs.getString(1);
			}else if(productCode == null){
				productCode = "";
				
				sql = "select store0214_storeCode_seq.nextval from dual";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					storeCode = rs.getString(1);
				}
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
		<h2>매장 등록 화면</h2>
		<form name="iu_form" method="post" action="store0214_insert.jsp">
			<table id="iu_table">
				<tr>
					<th>매장 코드(자동생성)</th>
					<td><input type="text" name="storeCode" value="<%=storeCode %>" readonly>sequence 발생</td>
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