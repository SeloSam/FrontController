<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- if for 등등 제어문쓸때 사용 -->  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  <!-- fmt는 화폐 단위나 숫자를 이용해서 표현할때 사용 -->  


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sort.css" rel="stylesheet" >

<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	body{
		margin:0px;
		padding:0px;
	}
	.w3-table{
		width: 500px;
		height: 500px;
		padding: 0 10px;
		text-align:center;
		margin: 0 auto;
		boder-bottom:blakc;
	}
	.w3-container{
		text-align:center;
	}
	td, tr{
		width: 100px;
		text-align:center;
	}
	.w3-table>td{
		padding:0 10px;
	}
	
	#money_font{
		color:red;
	}
	th{
		background-color: lime;
		text-align: center;
	}
	.bottom_btn{
		width: 500px;
		height: 500px;
		margin:0 auto;
		border-top:1px solid black;
	}
</style>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="cm160_home.jsp" %>
	<!-- best 상품 -->
	<div class="w3-container">
		<c:forEach items="${bestdetail}" var="bPdto">
			<h2>${bPdto.p_name}</h2>
			
				<table class="w3-table">
				<tr>
					<th><span id="header_name">상세페이지</span></th>
					<th></th>
				</tr>
				<tr>
					<td><img alt="best" id="img05" src="img/${bPdto.p_img}"></td>
					<td></td>
				</tr>
				
				<div>
					<tr>
						<td><span>${bPdto.p_name}</span></td>
						<td></td>
					</tr>
					<tr>
						<td>가격</td>
						<td>
							<span id="money_font">
								<fmt:setLocale value="ko_kr"/><!--(국가 지정) ko_kr,en_us ja_jp -->
								<fmt:formatNumber value="${bPdto.p_price2}" type="currency"/>
							</span>
						</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td>2000원</td>
					</tr>
					<tr>
						<td>SNS 상품홍보</td>
						<td><a  href="" ><img src="img/icon_facebook.gif" alt="facebook_log"></a>
						<a  href="" ><img src="img/icon_twitter.gif" alt="twitter_log"></a></td>
					</tr>
					
					<tr>
						<td></td>
						<td></td>
					</tr>
				
				</div>
				</table>
				
				<div id="log_buuten">
						<a href="#" class="ctn1" id="log_butten1"> By Now </a>				
						<a href="#" class="ctn1" id="log_butten1"> WISH </a>				
					</div>
		</c:forEach>
		
	</div>
</body>
</html>