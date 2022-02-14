<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 29 -</title>
	<style>
		*{
			margin: 0; padding: 0;
		}html, body{
			width: 100%; height: 100%;
		}a{
			text-decoration: none;
		}table{
			border: 3px solid black;
			margin: 0 auto;
			border-collapse: collapse;
		}tr,th,td{
			border: 1px solid black;
		}th{
			background-color: #EEEEEE;
		}
		
		header{
			width: 100%; height: 10%;
			color: white; background-color: blue;
			text-align: center; display: table;
		}header > h1{
			display: table-cell;
			vertical-align: middle;
			font-size: 2vw;
		}
		
		nav{
			width: 100%; height: 5%;
			color: white; background-color: purple;
			text-align: center; display: table;
		}nav > ul{
			display: table-cell;
			vertical-align: middle;
			list-style: none;
		}nav > ul li{
			font-size: 1vw;
			display: inline-block;
			margin: 0 10px;
		}nav > ul li > a{
			color: white;
			font-weight: bold;
		}nav > ul li > a:HOVER {
			color: red;
			font-weight: bold;
		}
		
		section{
			width: 100%; height: 80%;
			color: black; background-color: white;
		}section > h2{
			text-align: center;
			padding: 20px 0;
		}section > p{
			padding-left: 40px;
		}section > ol{
			padding-left: 40px;
		}
		
		footer{
			width: 100%; height: 5%;
			color: white; background-color: gray;
			text-align: center; display: table;
		}footer > h3{
			display: table-cell;
			vertical-align: middle;
			font-size: 1vw;
		}
		
	</style>
	<style>
		#iu_table tr{
			height: 30px;
		}#iu_table th{
			width: 200px;
		}#iu_table td{
			width: 500px;
		}
		
		#iu_table input[type="text"]{
			height: 25px;
			width: 300px;
		}#iu_table input[type="number"]{
			height: 25px;
			width: 300px;
		}
		
		#btntd{
			text-align: center;
		}#btntd button{
			height: 25px;
			width: 150px;
		}
	</style>
	<style>
		#s_table tr:FIRST-CHILD{
			height: 50px;
		}#s_table tr{
			height: 25px;
		}#s_table td{
			text-align: center;
		}#s_table #selecttd{
			background-color: gray;
		}#s_table #selecttd a{
			color: white;
			font-weight: bold;
		}#s_table #selecttd a:HOVER{
			color: red;
			font-weight: bold;
		}#s_table a{
			color: blue;
			font-weight: bold;
		}#s_table a:HOVER{
			color: red;
			font-weight: bold;
		}
		
		#btn{
			display: block;
			margin: 20px auto;
			width: 150px;
			height: 30px;
			color: white;
			background-color: black;
		}
	</style>
</head>
<body>
	<header>
		<h1>매장 입출고 관리 시스템 ver 1.0</h1>
	</header>
</body>
</html>