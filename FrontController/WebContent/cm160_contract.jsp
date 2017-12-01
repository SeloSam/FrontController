<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- if for 등등 제어문쓸때 사용 -->  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  <!-- fmt는 화폐 단위나 숫자를 이용해서 표현할때 사용 -->  


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css"></style>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#cbox").click(function(){
			var 
			cVal=$('input:checkbox[id = "cbox"]').is(":checked");
			if(cVal==true){
				$('input:checkbox[id = "li1box"]').prop("checked",true);
				$('input:checkbox[id = "li2box"]').prop("checked",true);
				$('input:checkbox[id = "li3box"]').prop("checked",true);
				$('input:checkbox[id = "li4box"]').prop("checked",true);
				
			}else if(cVal==false){
				$('input:checkbox[id = "li1box"]').prop("checked",false);
				$('input:checkbox[id = "li2box"]').prop("checked",false);
				$('input:checkbox[id = "li3box"]').prop("checked",false);
				$('input:checkbox[id = "li4box"]').prop("checked",false);		
			}
		});
	});
	

	$(document).on("click","#otl",function(){
			
 		var
 		form=$("#join_content"),
 		cVal=$('input:checkbox[id = "li1box"]').is(":checked"),
 		cVal1=$('input:checkbox[id = "li2box"]').is(":checked");
 		
 		
 		str="cm160 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.";
 		
			if(cVal==true && cVal1 ==true){
		 		$('input:checkbox[id = "cbox"]').prop("checked",false);
				$('input:checkbox[id = "li1box"]').prop("checked",false);
				$('input:checkbox[id = "li2box"]').prop("checked",false);
				$('input:checkbox[id = "li3box"]').prop("checked",false),
				$('input:checkbox[id = "li4box"]').prop("checked",false);
			}else if(cVal !=true || cVal1 !=true){
				$("#event_error").empty().append(str).css("color", "red");
				$("#event_error").css("font-size","11px");
				return false;
		}
		
		
		form.submit();

	});
	
</script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sort.css" rel="stylesheet" >

</head>

<body id=contract_body>
	<%@ include file="cm160_home.jsp" %>
	
	<div id="contract_container">
		<form action="join.bizpoll" id="join_content">
			<div class="terms"> 
				<p class="terms_p">
					<span class="terms_span">
						<input type="checkbox" id="cbox" onclick="allChecked()">
						<label for="cbox">
						이용약관, 개인정보 수집 및 이용,<br>
						위치정보 이용약관(선택), 프로모션 안내<br>
						메일 수신(선택)에 모두 동의합니다.
						</label>
					</span>
				</p>
				
				<ul id="terms_ul">
					<li id="terms_ul_li1">
						<span class="ul_li_span">
							<input type="checkbox" id="li1box">
							<label for="li1box" class="label1">
								cm160 이용약관 동의<span class="span_only">(필수)</span>
							</label>
						</span>
						
						<div class="terms_box">
							<div class="article">
								<h3 class="article_title">제 1 조(목적)</h3>
								<p>이 약관은 cm160 주식회사 ("회사" 또는 "cm160")가 제공하는 cm160<br>
								및 cm160 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리,<br>
								의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p><br>

								<h3 class="article_title">제 2 조(정의)</h3>
								<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
								①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유<br>
								무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 cm160 및 cm160<br>
								 관련 제반 서비스를 의미합니다.</p>
							</div>
						</div>
						
					</li>

					<li id="terms_ul_li2">
						<span class="ul_li_span">
							<input type="checkbox" id="li2box">
							<label for="li2box" class="label1">
								개인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)</span>
							</label>
						</span>
						
						<div class="terms_box">
							<div class="article">
								<p>정보통신망법 규정에 따라 cm160에 회원가입 신청하시는 분께 수집하<br>
								는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및<br>
								 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p><br>

								<h3 class="article_title">1. 수집하는 개인정보</h3>
								<p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 cm<br>
								160 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘<br>
								린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위<br>
								해 회원가입을 할 경우, cm160는 서비스 이용을 위해 필요한 최소한의<br>
								 개인정보를 수집합니다.</p>
							</div>
						</div>
						
					</li>

					<li id="terms_ul_li3">
						<span class="ul_li_span">
							<input type="checkbox" id="li3box">
							<label for="li3box" class="label1">
								위치정보 이용약관 동의<span class="span_select">(선택)</span>
							</label>
						</span>
						
						<div class="terms_box">
							<div class="article">
								<p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을<br>
								 포함하는 cm160 위치기반 서비스를 이용할 수 있습니다.</p><br>

								<h3 class="article_title">제1조 (목적)</h3>
								<p>이 약관은 cm160 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는<br>
								 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의<br>
								 무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
							</div>
						</div>
						
					</li>
					
					<li id="terms_ul_li4">
						<span class="ul_li_span">
							<input type="checkbox" id="li4box">
							<label for="li4box" class="label1">
								이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)</span>
							</label>
						</span>
						<span id="event_error"></span>
					</li>
				</ul>
			</div>
			
			<div class="btn_double_area">
				<span><a href="#" class="btn_type btn_agree" id="otl">동의</a></span>
				<span><a href="#" class="btn_type btn_default">비동의</a></span>
			
			</div>
			
		</form>
		
		
	</div>
	
		<!-- 이용약관 머릿말 쪽 -->
	<footer>
	
		<div id="footer">
			<ul>
				<li><a href="#">이용약관</a></li>
				<li><strong><a href="#">개인정보처리방침</a></strong></li>
				<li><a href="#">책임의 한계와 법적고지</a></li>
				<li><a href="#">회원정보 고객센터</a></li>
			</ul>
			
			<div id="address">
			
				
				<span>Copyright</span>
				<span>©</span>
				<span><strong><a href="#">cm160 Corp.</a></strong></span>
				<span>All Rights Reserved.</span>
			
			</div>
			
		
		</div>
	</footer>
	
</body>


</html>