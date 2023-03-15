<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var path = "${pageContext.request.contextPath }";
	$(document).ready(function() {
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
	});

	// 유효성 검사
	function fnSubmit() {
		var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;

		if ($("#memId").val() == null || $("#memId").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#memId").focus();

			return false;
		}
		if ($("#memName").val() == null || $("#memName").val() == "") {
			alert("이름을 입력해주세요.");
			$("#memName").focus();

			return false;
		}
		if ($("#memPhone").val() == null || $("#memPhone").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#memPhone").focus();

			return false;
		}
		if (confirm("비밀번호를 찾으시겠습니까?")) {
			$("#createForm").submit();

			return false;
		}
	}
</script>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css" type="text/css">
</head>
<body>
	<form action="${pageContext.request.contextPath }/member/searchPass" commandName="searchVO" id="createForm" method="post">
		<div id="wrap" class="wrap">
			<div class="u_skip">
				<a href="https://www.naver.com">본문 바로가기</a>
			</div>
			<div class="col-lg-3">
				<div class="header__logo" style="text-align: center;">
					<a href="./index.html"> <img
						src="${pageContext.request.contextPath }/resources/img/marketLogo.png"
						alt="" style="position: absolute; top: 130px; right: 835px;"
						width="250"></a> <br>
				</div>
			</div>
			<div id="container" class="container">
				<!-- content -->
				<div class="content" style="height: 300px; padding: 200px;">
					<div class="login_wrap">
						<ul class="menu_wrap" role="tablist">
							<li class="menu_item" role="presentation"><a href="idFind"
								id="loinid" class="menu_id" role="tab" aria-selected="false">
									<span class="menu_text"><span class="text">아이디 찾기</span></span>
							</a></li>
							<li class="menu_item" role="presentation">
								<a href="#none" id="ones" class="menu_ones on" role="tab" aria-selected="true">
									<span class="menu_text"><span class="text">비밀번호
											찾기</span></span>
								</a>
							</li>
						</ul>
						<ul class="panel_wrap">
							<li class="panel_item" style="display: block;">
								<div class="panel_inner" role="tabpanel" aria-controls="ones">
									<div class="input_row" id="num_line">
										<input type="text" id="memId" name="memId"
											placeholder="아이디를 입력하세요." class="input_text"
											style="text-align: center;">
									</div>
									<div class="input_row" id="num_line">
										<input type="text" id="memName" name="memName"
											placeholder="이름을 입력하세요." class="input_text"
											style="text-align: center;">
									</div>
									<div class="input_row" id="num_line">
										<input type="text" id="memPhone" name="memPhone"
											placeholder="전화번호를 입력하세요." class="input_text"
											style="text-align: center;">
									</div>
									<div class="btn_login_wrap">
										<button type="submit" class="btn_login" id="log.login"
											onclick="fnSubmit(); return false;">
											<span class="btn_text">비밀번호 찾기</span>
										</button>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<ul class="find_wrap" id="find_wrap">
						<li><a href="login" class="find_text">로그인</a></li>
						<li><a href="idFind" class="find_text">아이디 찾기</a></li>
						<li><a href="insert" class="find_text">회원가입</a></li>
					</ul>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
