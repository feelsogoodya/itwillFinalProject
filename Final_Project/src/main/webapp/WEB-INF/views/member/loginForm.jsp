<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="description" content="Ogani Template">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
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
	}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/member/loginPro" method="post" id="join" onsubmit="return check()">
	<div id="wrap" class="wrap">
		<div class="u_skip">
			<a href="https://www..com">본문 바로가기</a>
		</div>
		<div class="col-lg-3">
			<div class="header__logo" style="text-align: center;">
				<a href="./index.html">
				<img src="${pageContext.request.contextPath }/resources/img/marketLogo.png" alt="" style="position : absolute; top : 130px; right : 835px;" width="250"></a>
				<br>
			</div>
		</div>

		<div id="container" class="container">
			<!-- content -->
			<div class="content" style="height: 300px; padding : 200px;" >
				<div class="login_wrap">
					<ul class="menu_wrap" role="tablist">
						<li class="menu_item" role="presentation">
							<a href="#none" id="loinid" class="menu_id on" role="tab"
							aria-selected="true"> <span class="menu_text">
							<span class="text">ID 로그인</span></span>
						</a>
					</ul>
					
						
						<ul class="panel_wrap">
							<li class="panel_item" style="display: block;">
								<div class="panel_inner" role="tabpanel" aria-controls="loinid">
								
									
									<div class="id_pw_wrap">
										<div class="input_row" id="id_line">
											<div class="icon_cell" id="id_cell">
												<span class="icon_id"> 
													<span class="blind">아이디</span>
												</span>
											</div>
											<input type="text" id="memId" name="memId" placeholder="아이디" class="input_text" maxlength="12">
										</div>
										<div class="input_row" id="pw_line">
											<div class="icon_cell" id="pw_cell">
												<span class="icon_pw"> 
													<span class="blind">비밀번호</span>
												</span>
											</div>
											<input type="password" id="memPass" name="memPass" placeholder="비밀번호" class="input_text" maxlength="16"> 
										</div>
									</div>
									
									<div class="btn_login_wrap">
										<button type="submit" class="btn_login" id="log.login">
											<span class="btn_text">로그인</span>
										</button>
									</div>
								</div>
							</li>
						</ul>
				</div>
				<ul class="find_wrap" id="find_wrap">
					<li><a href="idFind" class="find_text">아이디 찾기</a></li>
					<li><a href="passFind" class="find_text">비밀번호 찾기</a></li>
					<li><a href="insert" class="find_text">회원가입</a></li>
				</ul>
				
				<!--배너-->
				<div id="gladbanner" class="banner_wrap">&nbsp;</div>
			</div>
			<!-- //content -->
		</div>
		<!-- footer -->
		<div class="footer">
			<div class="footer_inner">
			
			</div>
		</div>
	</div>
</form>
</body>
</html>
