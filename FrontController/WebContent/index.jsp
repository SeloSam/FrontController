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
	
	body, div{
		margin: 0px;
		padding:0px;
	}
	hr{
		color:black;
	}
	h1{
		margin:0px;
		font-family: 'Jeju Hallasan', serif;
	}
	h2{	
		clear:both;
		font-family: 'Jeju Hallasan', serif;
	}
	img{
		height: 225px;
		width: 225px;
	}
	
	a{
		text-decoration: none;
	}
	
	.pdt_item{
		float:left;
		margin:0px 10px;
	
	}
	
		
</style>
<script src="js/bootstrap.min.js"></script>

</head>
<body>
		<%@ include file="cm160_home.jsp" %>
		<div class="item_list">		
			<h1> -Best of Best!-</h1>
			<hr>
		</div>
	
		<c:forEach items="${bestlist}" var="bPdto">
			<div class="pdt_item">
				<a href="detail2.bizpoll?p_code=${bPdto.p_code}">
					<img alt="best" id="img05" src="img/${bPdto.p_img}">
					<div class="wrap_info" id="text1">
						<table>
						<tr>
							<th><span>${bPdto.p_name}</span></th><br>
							<th><span>
								<fmt:setLocale value="ko_kr"/><!--(국가 지정) ko_kr,en_us ja_jp -->
								<fmt:formatNumber value="${bPdto.p_price2}" type="currency"/>
							</span></th>
						</tr>
						</table>
					</div>
				</a>			
			</div>
		</c:forEach>
		<br>
		
		<div class="item_list">
			<br>
			<h2> -New!!- </h2>
			<hr>
		</div>
		
		<c:forEach items="${newlist}" var="nPdto">
			<div class="pdt_item">
				<a href="detail1.bizpoll?p_code=${nPdto.p_code}">
					<img alt="new" id="img01" src="img/${nPdto.p_img}">
					<div class="wrap_info2" id="text2">
						<table>
						<tr>
							<th><span>${nPdto.p_name}</span></th><br>
							<th><span>
								<fmt:setLocale value="ko_kr"/>
								<fmt:formatNumber value="${nPdto.p_price2}" type="currency"/> 
							</span></th>
						</tr>
						</table>
					</div>
				</a>
			</div>
		</c:forEach>
	
</body>
</html>









