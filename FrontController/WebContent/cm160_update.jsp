<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- if for 등등 제어문쓸때 사용 -->  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  <!-- fmt는 화폐 단위나 숫자를 이용해서 표현할때 사용 -->  


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
	
	
	#update_pw1, #update_pw2{
		font-family: 'Nanum Gothic', serif;
	}
	
	#update_id{
		background-color: #dadada;
	}
	
	h2{
		background-color: #cbe86b;
	}
</style>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).on("click", "#butten1", function(){
		$("#form_logchange").submit();
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
                document.getElementById('update_address2').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('update_address1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    }
    
</script>





</head>
<body>

	<%@ include file="cm160_home.jsp" %>

	<form action="updateplay.bizpoll" class="w3-container" id="form_logchange"  name="160cm_join" method="post" onSubmit="return checked()" onReset="index.bizpoll">
			
			<fieldset>
				<div class="w3-contrainer w3-red" id="field_id">
					<h2> -회원 수정- </h2>
				</div>	
							<p>
							<label for="add1"> ID </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
							<input type="text" class="w3-input" readonly="readonly" id="update_id" name="update_id" size ="15" maxlength="15" placeholder="ID" value="${sessionScope.loginUser.userid}">
							<span id="id_span"></span>
							</p>
							
							<p>
							<label for="add2"> PW </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
							<input type="password" class="w3-input" id="update_pw1" name="update_pw1" size ="15" maxlength="15" placeholder="Pw1">
							<span id="pw_span"></span>
							</p>
							
							<p>
							<label for="add3"> PW 확인 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
							<input type="password" class="w3-input" id="update_pw2" name="update_pw2"  size ="15" maxlength="15" placeholder="Pw2">
							<span id="pw1_span"></span>
							</p>
							
							<p>
							<label for="add4"> 회원 이름 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
							<input type="text" id="update_name" class="w3-input" name="update_name" size ="15" maxlength="4" placeholder="Name"  value="${sessionScope.loginUser.username}">
							<span id="name_span"></span>
							</p>
							
							<p>
							<label for="add5"> 전화번호 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
							<input type="text" id="update_phone" class="w3-input" name="update_phone"  size ="15" maxlength="13" placeholder="Phone" value="${sessionScope.loginUser.userphone}">
							<span id="phone_span"></span>
							</p>
							
							<p>
							<label for="add6"> 이메일 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
							<input type="text" id="update_email" class="w3-input" name="update_email" size ="15" maxlength="18" placeholder="Email"  value="${sessionScope.loginUser.useremail}">
							<span id="email_span"></span>
							</p>
							
							<p>
							<label for="add7"> 주소 </label><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수">
							<input type="button" value="검색" onclick="sample6_execDaumPostcode()" id = "butten4">
							<input type="text" id="update_address2" name="update_address2" size ="8" maxlength="10" placeholder="우편번호" class="w3-input"value=" ${sessionScope.loginUser.useraddress}">
							<input type="text" id="update_address1" name="update_address" size ="35" maxlength="18" placeholder="기본주소" class="w3-input"value=" ${sessionScope.loginUser.useraddress2}">
							<span id="address1_span"></span>
							</p>
							
							<div id="group_butten">	
								<input type="submit" value="수정하기" id="butten1">
								<input type="reset" value="취소" id="butten2"><br><br>
							</div>
			</fieldset>
	</form> 
</body>
</html>