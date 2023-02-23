<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/insert.css" type="text/css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/insert.js" ></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>

<script type="text/javascript">
 	$(document).ready(function() {
		$('.dup').click(function(){
			if($('#memId').val() == "" ){
				alert("아이디 입력하세요");
				$('#memId').focus();
				return false;
			}
			$.ajax({
				url:'${pageContext.request.contextPath }/member/idCheck',
				data:{'memId':$('#memId').val()},
				success: function(rdata){
					if(rdata=='iddup'){
						rdata="아이디 중복";
					}else{
						rdata="아이디 사용가능";
					}
					$('.dupdiv').html(rdata);
				}
			});
		});
 	});		

 	function check(){
	
			if($('#memId').val() == "" ){
				alert("아이디 입력하세요");
				$('#memId').focus();
				return false;
			}
			if($('#memPass').val()==""){
				alert("비밀번호 입력하세요");
				$('#memPass').focus();
				return false;
			}
			if($('#memName').val()==""){
				alert("이름 입력하세요");
				$('#memName').focus();
				return false;
			}
			if($('#memNname').val()==""){
				alert("닉네임을 입력하세요");
				$('#memNname').focus();
				return false;
			}
			if($('#memAddress').val()==""){
				alert("주소을 입력하세요");
				$('#memAddress').focus();
				return false;
			}

			if($('#memEmail').val()==""){
				alert("이메일을 입력하세요");
				$('#memEmail').focus();
				return false;
			}
			if($('#memPhone').val()==""){
				alert("전화번호를 입력하세요");
				$('#memPhone').focus();
				return false;
			}
	}		
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/member/insertPro" method="post" id="join" onsubmit="return check()">
			<!-- header -->
			<div class="col-lg-3">
				<div class="header__logo" style="text-align: center;">
					<a href="./index.html">
					<img src="${pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>
				</div>
			</div>
				<!-- container -->
				<div id="container" role="main">
					<div id="content">
						<!-- tg-text=title -->
						<div class="join_content">
							<!-- 아이디, 비밀번호 입력 -->
							<div class="row_group">
								<div class="join_row">
									<h3 class="join_title">
										<label for="id">아이디</label>
									</h3>
									<span class="ps_box int_id"> 
										<input type="text" id="memId" name="memId" class="int" maxlength="20" >
									</span>
									<div class="dupdiv"></div><br>
								</div>
									<input type="button" value="중복확인" class="dup"><br>
								<div class="join_row">
									<h3 class="join_title">
										<label for="pswd1">비밀번호</label>
									</h3>
									<span class="ps_box int_pass" id="pswd1Img"> 
									<input type="password" id="memPass" name="memPass" class="int" aria-describedby="pswd1Msg" maxlength="20">
										<span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
									</span> 

									<h3 class="join_title">
										<label for="pswd2">비밀번호 재확인</label>
									</h3>
									<span class="ps_box int_pass_check" id="pswd2Img"> 
										<input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20"> 
										<span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
									</span> 
									<span class="error_next_box" id="pswd2Msg" style="display: none" aria-live="assertive"></span>
								</div>
							</div>

							<div class="row_group">

								<div class="join_row">
									<h3 class="join_title">
										<label for="name">이름</label>
									</h3>
									<span class="ps_box box_right_space"> 
										<input type="text"id="memName" name="memName" title="이름" class="int" maxlength="10">
									</span> 
									<span class="error_next_box" id="nameMsg" style="display: none" aria-live="assertive"></span>
								</div>

								<div class="join_row">
									<h3 class="join_title">
										<label for="name">닉네임</label>
									</h3>
									<span class="ps_box box_right_space"> 
										<input type="text" id="memNname" name="memNname" title="닉네임" class="int" maxlength="40">
									</span> 
									<span class="error_next_box" id="nameMsg" style="display: none" aria-live="assertive"></span>
								</div>

								<div class="join_address">
									<h3 class="join_title">
										<label for="name">주소</label>
									</h3>
									<span class="ps_box box_right_space"> 
										<input type="text" id="memAddress" name="memAddress" title="주소" class="int" maxlength="40">
									</span> 
										<span class="error_next_box" id="nameMsg"
										style="display: none" aria-live="assertive"></span>
								</div>
								<div class="join_row join_email">
									<h3 class="join_title">
										<label for="email">이메일<span class="terms_choice">(선택)</span></label>
									</h3>
									<span class="ps_box int_email box_right_space"> 
									<input type="text" id="memEmail" name="memEmail" placeholder="선택입력"
										aria-label="선택입력" class="int" maxlength="100">
									</span>
								</div>
								<span class="error_next_box" id="emailMsg" style="display: none"
									aria-live="assertive"></span>
							</div>

							<!-- 휴대전화 번호, 인증번호 입력 -->
							<div class="join_row join_mobile" id="mobDiv">
								<h3 class="join_title">
									<label for="phoneNo">휴대전화</label>
								</h3>

								<div class="int_mobile_area">
									<span class="ps_box int_mobile"> 
									<input type="tel" id="memPhone" name="memPhone" placeholder="전화번호 입력"
										aria-label="전화번호 입력" class="int" maxlength="16"> 
										<label for="memPhone" class="lbl"></label>
									</span> 
									<a href="#" class="btn_verify btn_primary" id="btnSend" role="button">
										<span class="">인증번호 받기</span>
									</a>
								</div>
								<div class="ps_box_disable box_right_space" id="authNoBox">
									<input type="tel" id="authNo" name="authNo"
										placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요"
										aria-describedby="wa_verify" class="int" disabled
										maxlength="4"> 
									<label id="wa_verify" for="authNo" class="lbl">
										<span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span> 
										<span class="input_code" id="authNoCode" style="display: none;"></span>
									</label>
								</div>
							</div>

							<div class="btn_area">
								<button type="submit" id="btnJoin" class="btn_type btn_primary">
									<span>가입하기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
</body>
</html>

