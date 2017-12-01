<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- if for 등등 제어문쓸때 사용 -->  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  <!-- fmt는 화폐 단위나 숫자를 이용해서 표현할때 사용 --> 
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/sort.css" rel="stylesheet" >	
	
	
	<head>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../dist/needpopup.min.css">

	  <!-- Styles just for demo -->
	<style>
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
		  box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 1);
		}

		.needpopup p {
			margin: 0;
		}
		.needpopup p + p {
			margin-top: 10px;
		}
	</style>

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
		$(document).on("click", "#log_butten1", function(){
			
			var
			form=$("#form_logpage"),
			userid=$("#id_login"),
			userpw=$("#pw_login"),
			id=$.trim(userid.val()),
			pw=$.trim(userpw.val());
			
			if(id==""){
				userid.focus();
				$("#id_span").empty().append("id를 입력하세요").css("color","red");
				return false;
			}else{
			}
			if(pw==""){
				userpw.focus();
				$("#pw_span").empty().append("pw를 입력하세요").css("color","red");
				return false;
			}
			$("#form_logpage").submit();
		});
			
	
		
	</script>
	</head>
	
	
	<body>
		<div class="wrapper">
			<a href="#" data-needpopup-show="#custom-popup">LOGIN</a>
			<div id='custom-popup' class="needpopup" data-needpopup-options="custom">
			
				<h2 id="h2_header"> ~ LOGIN ~ </h2>
				<div id="log_msg">
					<p id="log_msg1"> 로그인이 필요한 서비스입니다.<br>회원이 아니시면 회원가입을 해주세요. </p>
				</div>
					<form action="LoginAction" id="form_logpage" name="160cm_join" method="post" >
					<section>
						<div id="log_log">
								<br><br>
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
										<span id="id_pw_span" class="login_confrim2">ID/PW</span>
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

		<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="../dist/needpopup.min.js"></script>
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
	</body>
</html>