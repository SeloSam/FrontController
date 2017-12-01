<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!-- if for 등등 제어문쓸때 사용 -->  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!-- fmt는 화폐 단위나 숫자를 이용해서 표현할때 사용 --> 

<!DOCTYPE html>
<html>
<head>
<!-- MODAL -->
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="dist/needpopup.min.css">
		
		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cm160_home</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sort.css" rel="stylesheet" >
<style type="text/css">

.wrapper {
	padding: 40px 60px;
}
p {
	font-size: 1.2em;
	line-height: 1.4;
	color: #343638;
	margin: 20px 0;
}


.needpopup {
  border-radius: 6px;
  height:650px;
  box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 1);
}

.needpopup p {
	margin: 0;
}
.needpopup p + p {
	margin-top: 10px;
}

</style>

<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="dist/needpopup.min.js"></script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	#id_login, #pw_login{
		font-family: 'Nanum Gothic', serif;
		
	}
	
	#id_pw_span{
		display:none;
		color:red;
	}
	
	#id_span{
		padding-top:5px;
	}
</style>


<script src="js/jquery-3.2.1.js"></script>

<script>  
	needPopup.config.custom = {
		'removerPlace': 'outside',
		'closeOnOutside': false,
		onShow: function() {
			console.log('needPopup is shown');
		},
		onHide: function() {
			console.log('needPopup is hidden');
		}
	};
	needPopup.init();	
</script>

<script type="text/javascript">
	window.onload = function(){
		var 
		code = ${code};
		if(code=='1'){
			alert("회원가입해라")	
		}else if(code=='2'){
			document.getElementById('id_pw_span').style.display="block";
		}
	};


	
</script>


<script type="text/javascript">
	$(document).ready(function(){
	


	$("#log_butten1").click(function(){
		
		var
		form=$("#form_logpage"),
		userid=$("#id_login").val(),
		userpw=$("#pw_login").val();
		
		
		$.ajax({
			url:"login.bizpoll",
			type:"POST",
			dataType:"json",
			data:"id="+userid+"&pw="+userpw,
			success:function(data){
				if(data.message=="1"){
					location.reload();
				}
			},
				
			error:function(){
				$("#id_pw_span").css("display","block");
				$("#id_pw_span").empty().append("ID/PW 다시입력하세요.").css("color","red");
			}
		});
	})
});
		

	
</script>
							
</head>
<body>
		<div id = "header">
			<span id="bookmark">160Cm +</span>
		
			<!-- 로그인 회원가입 등등 담겨있는 div -->
			<div id="header_inner">
				<ul id="header_ul">
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<a href = "login.bizpoll" data-needpopup-show="#custom-popup"><li class="header_li"> 로그인</li></a>
							<a href = "cm160_contract.jsp"><li class="header_li"> 회원가입</li></a>
								<div class="wrapper" style="display: none">
									
									<div id='custom-popup' class="needpopup" data-needpopup-options="custom">

											<h2 id="h2_header"> ~ LOGIN ~ </h2>
											<div id="log_msg">
												<p id="log_msg1"> 로그인이 필요한 서비스입니다.<br>회원이 아니시면 회원가입을 해주세요. </p>
											</div>
											<form action="login.bizpoll" id="form_logpage" name="160cm_join" method="post">
												<section>
													<div id="log_log">
															
															<div id="id_div" class="input_label">
																	 <input type="text" name="logpage_id" id="id_login" class="input_160cm" placeholder="id">
																	 <span id="id_span" class="login_confirm"></span>
																</div>
												
																<div id="pw_div" class="input_label">
																	<input type="password" name="logpage_pw" id="pw_login" class="input_160cm" placeholder="pw"> 
																	<br><span id="pw_span" class="login_confirm"></span>
																</div>
																<ul>
																	<p>
																		<span id="id_pw_span" class="login_confrim2"></span>
																	</p>
																</ul>
																<div id="state">
																	<span id="check_id"><input type="checkbox" name="Id_save" value="saveOK">아이디 저장</span> 
																
																	<span id="state1_pw"><a href="#"> PW 찾기 </a></span>
																	<span id="state1_id"><a href="#"> ID 찾기 </a></span>
																</div>
																<br>
																<div id="log_buuten">
																	<a href="#" class="ctn1" id="log_butten1"> login </a>				
															</div>
													</div>
												</section>
											</form>
												
									</div>	
								</div>
								
						</c:when>
						<c:otherwise>
							<li id="login_user">${sessionScope.loginUser.username}(${sessionScope.loginUser.userid})</li>
							<a href = "logout.bizpoll"><li class="header_li"> 로그아웃</li></a>
							
						</c:otherwise>
					</c:choose>
						<li class="header_li">
							<a href = "#"> 마이페이지▼</a>
								<div class = "header_dropdown">
									<a href = "#" class="dropdown_a">주문배송</a>
									<a href = "update.bizpoll" class="dropdown_a">회원정보</a>
									<a href = "cm160_basket.jsp" class="dropdown_a">장바구니</a>
									<a href = "#" class="dropdown_a">위시리스트</a>
									<a href = "#" class="dropdown_a">쿠폰조회</a>
								</div>
						</li>
					<a href = "#"><li class="header_li">고객행복센터</li></a>
				</ul>
			</div>
		</div>
		
		<!-- 로고 -->
		<div id = "logo">
			<a href = "#">
				<div id = "mainlogo">
					<span class = "logo_span"><a href = "index.bizpoll">기지게 펴도 160CM</a></span>
				</div>
			</a>
		</div>
			<div id="nav">
			<div2 id="nav_inner">
				<ul id="nav_ul">
					<li class="nav_li"><a href ="#">베스트 100</a></li>
					<li class="nav_li"><a href ="#">작은 사이즈</a></li>
					<li class="nav_li"><a href ="#">아우터</a>
						<div class="nav_d">
							<div class= "nav_dropdown">
								<a href="#" class="dropdown_b">자켓</a>
								<a href="#" class="dropdown_b">가디건</a>
								<a href="#" class="dropdown_b">집업</a>
								<a href="#" class="dropdown_b">코트</a>
								<a href="#" class="dropdown_b">점퍼/블루종</a>
							</div>
						</div>
					</li>
					<li class="nav_li"><a href ="#">티셔츠</a>
						<div>
								<div class= "nav_dropdown">
								<a href="#" class="dropdown_b">긴팔티</a>
								<a href="#" class="dropdown_b">맨투맨</a>
								<a href="#" class="dropdown_b">후드티</a>
								<a href="#" class="dropdown_b">소프트</a>
								</div>
						</div>
					</li>
					<li class="nav_li"><a href ="#">셔츠</a>
						<div>
							<div class= "nav_dropdown">
								<a href="#" class="dropdown_b">긴팔남방</a>
								<a href="#" class="dropdown_b">반팔/7부</a>
								<a href="#" class="dropdown_b">무지남방</a>
							</div>
						</div>	
					</li>
					<li class="nav_li"><a href ="#">바지</a>
						<div>
							<div class= "nav_dropdown">
								<a href="#" class="dropdown_b">인생바지</a>
								<a href="#" class="dropdown_b">슬랙스</a>
								<a href="#" class="dropdown_b">반바지</a>
								<a href="#" class="dropdown_b">청바지</a>
								<a href="#" class="dropdown_b">면바지</a>
								<a href="#" class="dropdown_b">7부/9부</a>
							</div>
						</div>
					</li>
					<li class="nav_li"><a href ="#">신발</a>
						<div>
							<div class= "nav_dropdown">
								<a href="#" class="dropdown_b">스니커즈</a>
								<a href="#" class="dropdown_b">슬립온</a>
								<a href="#" class="dropdown_b">로퍼/보트화</a>
								<a href="#" class="dropdown_b">구두</a>
								<a href="#" class="dropdown_b">워커</a>
								<a href="#" class="dropdown_b">샌들</a>
								<a href="#" class="dropdown_b">수제화</a>
							</div>
						</div>
					</li>
					<li class="nav_li"><a href ="#">가방</a>
						<div>
							<div class= "nav_dropdown">
								<a href="#" class="dropdown_b">크로스백</a>
								<a href="#" class="dropdown_b">백팩</a>
								<a href="#" class="dropdown_b">숄더/토드백</a>
								<a href="#" class="dropdown_b">클러치</a>
								<a href="#" class="dropdown_b">에코백</a>
							</div>
						</div>	
					</li>
					<li class="nav_li"><a href ="#">악세서리</a>
						<div>
							<div class= "nav_dropdown">
								<a href="#" class="dropdown_b">모자</a>
								<a href="#" class="dropdown_b">벨트</a>
								<a href="#" class="dropdown_b">헤어</a>
								<a href="#" class="dropdown_b">패션소품</a>
								<a href="#" class="dropdown_b">시계</a>
								<a href="#" class="dropdown_b">반지/팔찌</a>
							</div>
						</div>
					</li>
				</ul>
			</div2>
		</div>

</body>
</html>