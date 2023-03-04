<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/insert.css" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	// 아이디 중복확인
	$(document).ready(function() {
		$('.dup').click(function() {
			if ($('#memId').val() == "") {
				alert("아이디 입력하세요");
				$('#memId').focus();
				return false;
			}
			$.ajax({
				url : '${pageContext.request.contextPath }/member/idCheck',
				data : {
					'memId' : $('#memId').val()
				},
				success : function(rdata) {
					if (rdata == 'iddup') {
						rdata = "누군가 이 아이디를 사용하고 있어요.";
					} else {
						rdata = "사용 가능한 아이디입니다.";
					}
					$('.dupdiv').html(rdata);
				}
			});
		});
	});
	// 비밀번호 재입력
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var memPass = $("#memPass").val();
			var memPass2 = $("#memPass2").val();
			if (memPass != "" || memPass2 != "") {
				if (memPass == memPass2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
	// 유효성 검사
	function check() {
		var hobbyCheck = false;
		var memEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		var memName = RegExp(/^[가-힣]{2,6}$/);
		var memNname = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
		var memphone = RegExp(/^01[0179][0-9]{7,8}$/);
		
	 		
	 	if(document.getElementById("Idchk").checked == false) {
	 	     alert("중복확인을 해주세요");
	 	     return false;
	    }
		if ($('#memId').val() == "") {
			alert("아이디를 입력하세요");
			$('#memId').focus();
			return false;
		}
		//아이디 유효성검사
		if (!getCheck.test($("#memId").val())) {
			alert("아이디 형식에 맞게 입력해주세요");
			$("#memId").val("");
			$("#memId").focus();
			return false;
		}
		if ($('#memPass').val() == "") {
			alert("비밀번호를 입력하세요");
			$('#memPass').focus();
			return false;
		}
		//비밀번호 유효성검사
		if (!getCheck.test($("#memPass").val())) {
			alert("비밀번호 형식에 맞게 입력해주세요");
			$("#memPass").val("");
			$("#memPass").focus();
			return false;
		}
		if ($('#memPass2').val() == "") {
			alert("비밀번호를 재입력하세요");
			$('#memPass2').focus();
			return false;
		}
		if ($("#memPass").val() != $("#memPass2").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#memPass").val("");
			$("#memPass2").val("");
			$("#memPass").focus();
			return false;
		}
		if ($('#memName').val() == "") {
			alert("이름을 입력하세요");
			$('#memName').focus();
			return false;
		}
		//이름 유효성 검사
		if (!memName.test($("#memName").val())) {
			alert("이름 형식에 맞게 입력해주세요")
			$("#memName").val("");
			$("#memName").focus();
			return false;
		}
		if ($('#memNname').val() == "") {
			alert("닉네임을 입력하세요");
			$('#memNname').focus();
			return false;
		}
		//닉네임 유효성 검사
		if (!memNname.test($("#memNname").val())) {
			alert("닉네임 형식에 맞게 입력해주세요")
			$("#memNname").val("");
			$("#memNname").focus();
			return false;
		}
// 		if($('#memAddress').val()==""){
// 			alert("주소을 입력하세요");
// 			$('#memAddress').focus();
// 			return false;
// 		}
		if ($('#memEmail').val() == "") {
			alert("이메일을 입력하세요");
			$('#memEmail').focus();
			return false;
		}

		//이메일 유효성 검사
		if (!memEmail.test($("#memEmail").val())) {
			alert("이메일 형식에 맞게 입력해주세요")
			$("#memEmail").val("");
			$("#memEmail").focus();
			return false;
		}
		if ($('#memPhone').val() == "") {
			alert("전화번호를 입력하세요");
			$('#memPhone').focus();
			return false;
		}
		//전화번호 유효성 검사
		if (!memPhone.test($("#memPhone").val())) {
			alert("전화번호 형식에 맞게 입력해주세요")
			$("#memPhone").val("");
			$("#memPhone").focus();
			return false;
		}

	}
	
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
// 	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
// 	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
</script>
</head>
<body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<form action="${pageContext.request.contextPath }/member/insertPro" method="post" id="join" onsubmit="return check()">
		<!-- header -->
		<div class="col-lg-3">
			<div class="header__logo" style="text-align: center;">
				<a href="./index.html"> 
				<img src="${pageContext.request.contextPath }/resources/img/marketLogo.png" alt=""  width="200"></a>
			</div>
		</div>
		<!-- container -->
		<div id="container" role="main">
			<div id="content">
				<!-- tg-text=title -->
				<div class="join_content">
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<span class="ps_box int_id"> 
							<input type="text" id="memId" name="memId" class="int" maxlength="20" placeholder="4~12자의 영문 대소문자와 숫자로만 입력">
							</span>
							<div class="dupdiv"></div>
						</div>
						<input type="button" value="중복확인" id="Idchk" class="dup"><br>
						<div class="join_row">
							<h3 class="join_title">
								<label for="pswd1">비밀번호</label>
							</h3>
							<span class="ps_box int_pass" id="pw1"> 
							<input type="password" id="memPass" name="memPass" class="int"
								aria-describedby="pswd1Msg" maxlength="20"
								placeholder="4~12자의 영문 대소문자와 숫자로만 입력">
							</span>
							<h3 class="join_title">
								<label for="pswd2">비밀번호 재확인</label>
							</h3>
							<span class="ps_box int_pass_check" id="pw2"> 
							<input type="password" id="memPass2" name="memPass2" class="int"
								aria-describedby="pswd2Blind" maxlength="20" placeholder="비밀번호 재입력">
							</span>
							<div class="alert alert-success" id="alert-success">
								비밀번호가 일치합니다.</div>
							<div class="alert alert-danger" id="alert-danger" style="color: #FF0000;">
								비밀번호가 일치하지 않습니다.</div>
						</div>
					</div>
						
					<div class="row_group">

						<div class="join_row">
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<span class="ps_box box_right_space"> 
							<input type="text" id="memName" name="memName" title="이름" class="int"
								maxlength="10" placeholder="2~6자의 한글만 입력">
							</span> <span class="error_next_box" id="nameMsg" style="display: none"
								aria-live="assertive"></span>
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="name">닉네임</label>
							</h3>
							<span class="ps_box box_right_space"> 
							<input type="text" id="memNname" name="memNname" title="닉네임" class="int"
								maxlength="40" placeholder="2~10자의 한글, 영문 대소문자와 숫자로만 입력">
							</span> <span class="error_next_box" id="nameMsg" style="display: none"
								aria-live="assertive"></span>
						</div>
						
<!-- 						<input type="text" id="sample6_postcode" placeholder="우편번호"> -->
<!-- 						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> -->
<!-- 						<input type="text" id="sample6_address" placeholder="주소"><br> -->
<!-- 						<input type="text" id="sample6_detailAddress" placeholder="상세주소"> -->
<!-- 						<input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
						
						<div class="join_row join_mobile">
							<h3 class="join_title">
								<label for="name">주소<span class="terms_choice">(선택)</span></label>
							</h3>
							
							<div class="int_mobile_area">
								<span class="ps_box int_mobile"> 
									<input type="text" id="sample6_address" name="memAddress" placeholder="선택입력" class="int" >
								</span>
								<a href="#" class="btn_verify btn_primary" id="btnSend" role="button" onclick="sample6_execDaumPostcode()" > 
									<span class="">우편번호 찾기</span>
								</a>
							</div>
							<span class="ps_box box_right_space"> 
								<input type="text" id="sample6_extraAddress" name="memAddress" class="int" placeholder="상세주소">
							</span>
							
						</div>
						
						<div class="join_row join_email">
							<h3 class="join_title">
								<label for="email">이메일<span class="terms_choice"></span></label>
							</h3>
							<span class="ps_box int_email box_right_space"> 
							<input type="text" id="memEmail" name="memEmail" aria-label="선택입력"
								class="int" maxlength="100" placeholder="ex)...@naver.com">
							</span>
						</div>
						<span class="error_next_box" id="emailMsg" style="display: none"
							aria-live="assertive"></span>
					</div>
					<div class="join_row join_mobile" id="mobDiv">
						<h3 class="join_title">
							<label for="phoneNo">전화번호</label>
						</h3>
						<div class="int_mobile_area">
							<span class="ps_box int_mobile"> 
								<input type="text" id="memPhone" name="memPhone" placeholder="전화번호 입력"
										aria-label="전화번호 입력" class="int" >
								 <label for="memPhone" class="lbl"></label>
							</span> 
							<a href="#" class="btn_verify btn_primary" id="btnSend"
								role="button"> <span class="">인증번호 받기</span>
							</a>
						</div>
						<div class="ps_box_disable box_right_space" id="authNoBox">
							<input type="tel" id="authNo" name="authNo"
								placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요"
								aria-describedby="wa_verify" class="int" disabled maxlength="4">
							<label id="wa_verify" for="authNo" class="lbl"> <span
								class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span> <span
								class="input_code" id="authNoCode" style="display: none;"></span>
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

