<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	body, h1, ul, p, h3{
		margin:0px;
		padding:0px;
	}
	
	body{
		background-color:#f5f6f7; 
	}
	
	#contract_header{
		width:768px;
		margin:0 auto;
		box-sizing:border-box;
		border:1px solid red;
		
		height: 160px;
		padding-top:62px;
		position:relative;
	}
	
	
	.n_logo{
		display:block;
		width:240px;
		height: 44px;
		
		background:url('img/pc_sp_join.png')0-106px;
				
		margin:0 auto;
		box-sizing:border-box;
		border:1px solid blue;
	}
	
	#langselect{
		font-size: 12px;
		font-weight: 400;
		height: 30px;
		padding: 6px 8px 5px 7px;
		min-width: 98px;
		color:#333;
		border:1px solid #ccc;
		line-height: 17px;
	}
	
	
	.lang{
		position: absolute;
		top : 0px;
		right:0px;
	}
	
/* content */	
	#contract_container{
		width: 768px;
		margin: 0 auto;
		box-sizing:borer-box;
		position: relative;
		/* border: 1px solid blue; */ 
	}
	
	#join_content{
		width:460px!important;
		margin:0 auto!important;
		/* border:1px solid green; */
	}
	
	.lang > select{
		background:url('img/sel_arr.gif') 100% 50% no-repeat;
		width:98px;
		height: 30px;
		background-color: white;
		-webkit-appearance:none;
	}
	
	.terms{
		margin-bottom: 20px;
		background-color: white;
		border:1px solid #dadada;	
	}
	.terms_p{
		display:block;
		padding:15px;
		margin:0px;
		position: relative;
	}
	
	
	.terms_span{
		position: relative;
		display:block;
		height: 58px;
	}
	/* //버튼 숨기기 */
	.terms_span > input{
		position: absolute;
		right: 1px;
		top:50%;
		width: 22px;
		height: 22px;
		margin-top: -11px;
		visibility: hidden;
	}
	
	.terms_span>label{
		background: url('img/check_off.gif') 100% 50% no-repeat;
		display:block;
		line-height: 20px;
		height: 58px;
		top:-1px;
		font-size:14px;
		font-weight: 700;	
	}
	/* 버튼을 클릭했을때(true) */
	.terms_span>input:checked +label{
		background-image: url('img/check_on.gif');
	}
	
	#terms_ul{
		list-style: none;
		padding-bottom:7px;
	}
	
	#terms_ul_li1{
		border-top:1px solid #f0f0f0;
	}
	#terms_ul>li{
		display:block;
		padding:13px 15px 7px;
	}
	.ul_li_span{
		position: relative;
		display: block;
		height: 24px;
	}
	
	.label1{
		height: 24px;
		font-size:14px;
		font-weight: 700;
		line-height: 24px;
		position:absolute;
		color:#333;
		top:0px;
		left:0px;
		width: 100%;
	}
	.span_only{
		color:#0d9900;
		font-size:12px;
		font-weight: 400;
	}
	
	.ul_li_span > input{
		visibility: hidden;
		position: absolute;
		right: 1px;
		width: 22px;
		height: 22px;
		top:50%;
		margin-top:-11px;
	}
	
	.ul_li_span > label{
		background: url('img/check_off.gif')100% 50% no-repeat;
		display:block;
	}
	.ul_li_span > input:checked +label{
		background-image: url('img/check_on.gif');
	}
	
	.terms_box{
		position: relative;
		box-sizing:border-box;
		height: 88px;
		margin-top:11px;
		padding:8px 10px;
		border:1px solid #f0f0f0;
		background-color: #f7f7f7;
		overflow: auto; 
	}
	
	.article{
		margin-top:0px;
	}
	
	.article_title{
		font-size:12px;
		font-weight: 700;
		line-height: 15px;
		color:#666;

	}
	
	.article>p{
		display: block;
		font-size:12px;
		line-height: 16px;
		color:#666; 
	}	
	
	.span_select{
		color:#969696;
		font-size:12px;
		font-weight: 400;
	}
	
	.btn_double_area{
		margin: 30px -5px 0px;
		overflow: hidden;
	}
	.btn_double_area>span{
		display: block;
		float:left;
		width:50%;
	}
	.btn_type{
		width: auto;
		margin:0px 5px;
		font-size:20px;
		font-weight: 600;
		line-height: 61px;
		display:block;
		box-sizing:border-box;
		height: 61px;
		padding-top:1px;
		text-align: center;
	}
	
	a{
		text-decoration: none;
		color:inherit;
	}
	
	.btn_default{
		color:#333;
		border:1px solid #e7e7e7;
		background-color: #fff;
	}
	.btn_agree{
		color:#fff;
		border:1px solid #1fbc02;
		background-color: #1fbc02;
	}
	
	.group_join{
		margin: 20px 0px 65px;
		text-align: center;
		color:#666;
		font-size:12px;
	}
	
	.group_join>a{
		text-decoration: underline;
		color:#333;
	}
	
		#footer{
		padding: 15px 0;
	}
	/* footer 하위 모든 것에 이속성을 부여 */
	#footer * {
		font-size: 11px;
		line-height: normal;
		list-style: none;
		color:#333;
	}
	
	#footer> ul{
		margin: 0 auto 9px;
		text-align: center;
	}
	
	/* 가로로 정렬 */
	#footer> ul> li {
		display:inline;
		padding: 0 5px 0 7px;
		border-left: 1px solid #dadada; /* 글자 사이에 | 넣기 */
	}
	
	#footer > ul > li:first-child{
		border-left: 0px!important;
	}
	/* 글시를 호버 했을때 밑줄과 함께 녹색으로 */
	#footer > ul > li a:HOVER{
		color:#1fbc02;
		text-decoration: underline;
	}
	
	#addr_logo{
		width:63px;
		height:11px;
	}
	
	#address{
		margin: 0px auto;
		text-align: center;
	}
	/* address 하위에 있는 모든 글씨들 사이즈와 폰트 변경 */
	#address *{
		font: 9px verdana;
	}
	
	#address a{
		font-weight: bold;
	}
	
	#address a:HOVER {
		color:#1fbc02;
		text-decoration: underline;
	}
	
	
</style>
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
 		
 		
 		str="네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.";
 		
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
</html>

