<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Refresh" content="3; url=cm160_home.jsp">
<title>Insert title here</title>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	body, ul{
		font-family: 'Jeju Hallasan', serif;
		margin:0px;
		padding:0px;
	}
	
	#welcome_box{
		border:1px solid blue;
		height: 250px;
		width: 400px;
		margin:0 auto;
		

	}
	
	#welcom_img{
		border:2px solid red;
		height:350px;
		width:350px; 
		margin:0 auto;
	}
	
	img{
		height:350px;
		width:350px; 
	}
	
	#welcome_span{
		font-family:'Jeju Hallasan', serif;
		font-size: 14px;
		text-align:center;
	}
</style>

</head>
<body>
	<% String name=request.getParameter("join_name_name"); %>
	<div id="welcom_img">
		<img src="img/welcome.jpg"/>
	</div>
	<div id="welcome_box">
		<span id="welcome_span"><%=name%><strong>짱~ 이런 환영회 처음이지?</strong><br>
		
		<span> 어서와~~</span>	
		</span>
			
	</div>


</body>
</html>