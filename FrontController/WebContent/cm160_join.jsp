<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sort.css" rel="stylesheet" >

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	#join_pw, #join_pw1{
		font-family: 'Nanum Gothic', serif;
	}
	
	h2{
		background-color: #cbe86b;
		text-align: center;
	}
	
	.w3-container>h2{
		color:white;
	}
	#id_span{
		border:1px solid red;
	}
</style>

<script src="js/jquery-3.2.1.js"></script>


<script type="text/javascript">

	$(document).ready(function(){
		
		$("#join_id").blur(function(){
			var 
			re_id = /^[a-z0-9_-]{6,16}$/, // 아이디 검사식
			id=$("#join_id"),
			userid=id.val();
			
			if(userid == ""){
				id.focus();
				$("#id_span2").empty().append("id를 입력하세요").css("color", "red");
			}else if(!re_id.test(userid)){
				id.focus();
				$("#id_span2").empty().append("정확히 입력하세요").css("color", "red");
				id.focus();
			}else if(userid != ""){
				$.ajax({
					url:"idch.bizpoll",
					type:"POST",
					dataType:"json",
					data:"id="+id,
					success:function(data){
						if(data.message=="1"){
							$("#id_span2").empty().append("중복된 id입니다.").css("color", "red");
							id.select();
						}else{
							$("#id_span2").empty().append("사용 가능한 id입니다.").css("color", "green");
							$("#join_pw").focus();
						}
					},
					error:function(){
						alert("system error");
					}
				});
			}			
		});
	});	
		

	 $(document).on("click", "#butten1", function(){

		re_pw = /^[a-z0-9_-]{6,18}$/, // 비밀번호 검사식
		re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/, // 이메일 검사식
		re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/, // URL 검사식
		re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
		
		var
		
		form=$("#form_id"),
		userpw =$("#join_pw"),
		userpw1=$("#join_pw1"),
		username =$("#join_name"), 
		userphone =$("#join_phone"), 
		useremail =$("#join_email"), 
		useraddress =$("#join_adr");
		
		var
		pw=$.trim(userpw.val()),
		pw1=$.trim(userpw1.val()),
		name=$.trim(username.val()),
		phone=$.trim(userphone.val()),
		email=$.trim(useremail.val()),
		address=$.trim(useraddress.val());
		
		
		
		
		/* pw  */
		if(pw==""){
			userpw.focus();
			$("#pw_span").empty().append("pw를 입력하세요").css("color", "red");
			return false;
			
		}else if(!re_pw.test(pw)){
			userpw.focus();
			$("#pw_span").empty().append("정확히 입력하세요.").css("color","red");
			return false;
		}else{
			$("#pw_span").empty().append("사용가능한 pw입니다.").css("color","green");
		}
		
		/* pw2  */
		if(pw1 != pw){
			userpw1.focus();
			$("#pw1_span").empty().append("동일하게 입력해주세요.").css("color","red");
			return false;
		}else{
			$("#pw1_span").empty().append("사용가능한 pw입니다.").css("color","green");
		}
		
		
		/* name  */
		if(name==""){
			username.focus();
			$("#name_span").empty().append("name을 입력하세요").css("color","red");
			return false;
		}else{
			$("#name_span").empty().append("Ok").css("color","green");
		}
		
		
		/* phone  */
		if(phone==""){
			userphone.focus();
			$("#phone_span").empty().append("phone을 입력하세요").css("color","red");
			return false;
		}else if(!re_tel.test(phone)){
			userphone.focus();
			$("#phone_span").empty().append("정확히 입력하세요.").css("color","red");
			return false;
		}else{
			$("#phone_span").empty().append("사용 가능한 phone입니다.").css("color","green");
		}
		
		
		
		/*email */
		 if(email==""){
			useremail.focus();
			$("#email_span").empty().append("email을 입력하세요").css("color","red");
			return false;
		 } else{
			$("#email_span").empty().append("사용 가능한 email입니다.").css("color","green");
		}
		
		
		
		/*address  */
		if(address==""){
			useraddress.focus();
			$("#address_span").empty().append("address을 입력하세요").css("color","red");
			return false;
		}else{
			$("#address_span").empty().append("사용 가능한 address입니다.").css("color","green");
		}

		form.submit();
	});
	
	
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('join_adr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('join_adr').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    }
    
</script>

</head>
<body> 
	<%@ include file="cm160_home.jsp" %>

	<form action="joinplay.bizpoll" class="w3-container" id= "form_id" name="cm160_join" method="post" >
			<fieldset>
					<div class="w3-container w3-#cbe86b;"> 
						<h2>-회원 가입-</h2> 
					</div><br><br>
					<p>
					<label for="join_id1"> ID </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
					<input type="text" id="join_id" name="join_name_id" size ="15" maxlength="15" placeholder="ID" class="w3-input">
					<span id="id_span2" name="idname_span"></span>
					</p>
					
					<p>
					<label for="join_pw"> PW </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
					<input type="password" id="join_pw" name="join_name_pw1" size ="15" maxlength="15" placeholder="Pw1" class="w3-input">
					<span id="pw_span"></span>
					</p>
					
					<p>
					<label for="join_pw1"> PW 확인 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
					<input type="password" id="join_pw1" name="join_name_pw2" size ="15" maxlength="15" placeholder="Pw2" class="w3-input">
					<span id="pw1_span"></span>
					</p>
					
					<p>
					<label for="join_name"> 회원 이름 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
					<input type="text" id="join_name" name="join_name_name" size ="15" maxlength="4" placeholder="Name" class="w3-input">
					<span id="name_span"></span>
					</p>
					
					<p>
					<label for="join_phone"> 전화번호 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
					<input type="text" id="join_phone" name="join_name_phone" size ="15" maxlength="13" placeholder="Phone" class="w3-input">
					<span id="phone_span"></span>
					</p>
					
					<p>
					<label for="join_email"> 이메일 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
					<input type="text" id="join_email" name="join_name_email" size ="15" maxlength="18" placeholder="Email" class="w3-input">
					<span id="email_span"></span>
					</p>
					
					<p>
					<label for="join_adr"> 주소 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
					<input type="button" value="검색" onclick="sample6_execDaumPostcode()" id = "butten4">
					<input type="text" id="join_adr1" name="join_name_address2" size ="8" maxlength="10" placeholder="우편번호" class="w3-input">
					<input type="text" id="join_adr" name="join_name_address" size ="35" maxlength="18" placeholder="기본주소" class="w3-input">
					<span id="address1_span"></span>
					</p>
				
				
					<div id="group_butten">	
						<input type="submit" value="가입하기" id="butten1">
						<input type="reset" value="reset" id="butten2"><br><br>
					</div>
			</fieldset>
	</form> 


</body>
</html>