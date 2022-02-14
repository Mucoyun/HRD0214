<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 29 -</title>
	<script>
		function gotry() {
			var asd = document.getElementsByName("asd");
			var jj = false;
			for()
			
			
			if(document.iu_form.inOutDate.value == ""){
				alert("입출고 일자가 입력되지 않았습니다.");
				document.iu_form.inOutDate.focus();
			}else if(document.iu_form.storeCode.value == ""){
				alert("매장코드가 입력되지 않았습니다.");
				document.iu_form.storeCode.focus();
			}else if(document.iu_form.productCode.value == ""){
				alert("상품 코드가 입력되지 않았습니다.");
				document.iu_form.productCode.focus();
			}else if(document.iu_form.saleQty.value == ""){
				alert("입출고 수량이 입력되지 않았습니다.");
				document.iu_form.saleQty.focus();
			}else{
				document.iu_form.action = "inOut0214_insert_process.jsp";
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
		
		String inOutDate = request.getParameter("inOutDate");
		String gubun = request.getParameter("gubun");
		String saleQty = request.getParameter("saleQty");
		
		try{
			String sql = "select storeCode from store0214 where storeCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				storeCode = rs.getString(1);
			}else if(storeCode == null || storeCode.equals("")){
				storeCode = "";
			}else{
				storeCode = "";
				%><script>
					alert("등록되지 않은 매장코드입니다.");
					storeCodeChk();
				</script><%
			}
			
			sql = "select productCode from product0214 where productCode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCode);
			rs = pstmt.executeQuery();
			if(rs.next()){
				productCode = rs.getString(1);
			}else if(productCode == null || productCode.equals("")){
				productCode = "";
			}else{
				productCode = "";
				%><script>
					alert("등록되지 않은 상품코드입니다.");
					storeCodeChk();
				</script><%
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(inOutDate == null) { inOutDate = "2022-01-01"; }
		if(gubun == null) { gubun = "1"; }
		if(saleQty == null) { saleQty = "0"; }
		
		if(Integer.parseInt(saleQty) < 0){
			saleQty = "0";
		}
		
	%>
	<section>
		<h2>입출고 내역 등록 화면</h2>
		<form name="iu_form" method="post" action="inOut0214_insert.jsp">
			<table id="iu_table">
				<tr>
					<th>입출고 일자</th>
					<td><input type="text" name="inOutDate" value="<%=inOutDate %>"></td>
				</tr>
				<tr>
					<th>매장코드</th>
					<td><input type="text" name="storeCode" value="<%=storeCode %>" onchange="storeCodeChk()"></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productCode" value="<%=productCode %>" onchange="storeCodeChk()"></td>
				</tr>
				<tr>
					<th>입/출고 구분</th>
					<td>
						<input type="radio" name="gubun" value="1" <%if(gubun.equals("1")){ %> checked <% } %>> 입고
						<input type="radio" name="gubun" value="2" <%if(gubun.equals("2")){ %> checked <% } %>> 출고
					</td>
				</tr>
				<tr>
					<th>입출고 수량</th>
					<td><input type="number" name="saleQty" value="<%=saleQty %>" onchange="storeCodeChk()"></td>
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