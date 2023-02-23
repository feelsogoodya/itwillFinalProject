<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>네이버 : 회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/insert.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/insert.js" ></script>
<script type="text/javascript" src="https://nid.naver.com/js/clickcr.js"></script>
<script src="<c:url value ="/resources/js/insert.js"/>"></script>
<script type="text/javascript">
	lcs_do();
</script>
<meta name="decorator" content="V2_JOIN">
<style>
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
</style>
</head>
<body>
			<!-- 스킵네비게이션 : 웹접근성대응-->
			<div id="u_skip">
				<a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;">
				<span>본문으로 바로가기</span></a>
			</div>
			
			<!-- header -->
			<div class="col-lg-3">
				<div class="header__logo" style="text-align: center;">
					<a href="./index.html">
					<img src="${pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>
				</div>
			</div>

		<form action="${pageContext.request.contextPath }/member/updatePro" method="POST">
				<input type="hidden" id="token_sjoin" name="token_sjoin"
					value="TM3vbMIE8Wvp7Nr1"> <input type="hidden" id="encPswd"
					name="encPswd" value=""> <input type="hidden" id="encKey"
					name="encKey" value=""> <input type="hidden" id="birthday"
					name="birthday" value=""> <input type="hidden"
					id="joinMode" name="joinMode" value="unreal"> <input
					type="hidden" id="pbirthday" name="pbirthday" value=""> <input
					type="hidden" id="ipinFlag" name="ipinFlag" value=""> <input
					type="hidden" id="nid_kb2" name="nid_kb2" value="">

				<!-- container -->
				<div id="container" role="main">
					<div id="content">
						<!-- tg-text=title -->
						<h2 class="blind">네이버 회원가입</h2>
						<div class="join_content">
							<!-- 아이디, 비밀번호 입력 -->
							<div class="row_group">
								<div class="join_row">
									<h3 class="join_title">
										<label for="id">아이디</label>
									</h3>
									<span class="ps_box int_id"> 
									<input type="text" name="memId" value="${dto.memId }" class="int" title="ID" maxlength="20" oninput = "checkId()" readonly>
									<span class="error_next_box" id="idMsg" style="display: none" aria-live="assertive"></span>
									<span class="id_ok">사용 가능한 아이디입니다.</span>
									<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
								</div>

								<div class="join_row">
									<h3 class="join_title">
										<label for="pswd1">비밀번호</label>
									</h3>
									<span class="ps_box int_pass" id="pswd1Img"> 
									<input type="password" name="memPass" value="${dto.memPass }" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
										<span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
									</span> <span class="error_next_box" id="pswd1Msg"
										style="display: none" aria-live="assertive">5~12자의 영문
										소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

									<h3 class="join_title">
										<label for="pswd2">비밀번호 재확인</label>
									</h3>
									<span class="ps_box int_pass_check" id="pswd2Img"> <input
										type="password" id="pswd2" name="pswd2" class="int"
										title="비밀번호 재확인 입력" aria-describedby="pswd2Blind"
										maxlength="20"> <span id="pswd2Blind" class="wa_blind">설정하려는
											비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
									</span> <span class="error_next_box" id="pswd2Msg"
										style="display: none" aria-live="assertive"></span>
								</div>
							</div>
							<!-- // 아이디, 비밀번호 입력 -->

							<!-- 이름, 생년월일 입력 -->
							<div class="row_group">

								<!-- lang = ko_KR -->
								<div class="join_row">
									<h3 class="join_title">
										<label for="name">닉네임</label>
									</h3>
									<span class="ps_box box_right_space"> 
									<input type="text" name="memNname" value="${dto.memNname }" title="닉네임" class="int" maxlength="40">
									</span> <span class="error_next_box" id="nameMsg"
										style="display: none" aria-live="assertive"></span>
								</div>
								
								<div class="join_row">
									<h3 class="join_title">
										<label for="name">이름</label>
									</h3>
									<span class="ps_box box_right_space"> 
									<input type="text" name="memName" value="${dto.memName }" title="이름" class="int" maxlength="40">
									</span> <span class="error_next_box" id="nameMsg"
										style="display: none" aria-live="assertive"></span>
								</div>

								<div class="join_address">
									<h3 class="join_title">
										<label for="name">주소</label>
									</h3>
									<span class="ps_box box_right_space"> 
									<input type="text" name="memAddress" value="${dto.memAddress }" title="주소" class="int" maxlength="40">
									</span> <span class="error_next_box" id="nameMsg"
										style="display: none" aria-live="assertive"></span>
								</div>

								<div class="join_row join_email">
									<h3 class="join_title">
										<label for="email">이메일<span class="terms_choice">(선택)</span></label>
									</h3>
									<span class="ps_box int_email box_right_space"> 
									<input type="text" name="memEmail" value="${dto.memEmail }" placeholder="선택입력" aria-label="선택입력" class="int" maxlength="100">
									</span>
								</div>
								<span class="error_next_box" id="emailMsg" style="display: none"
									aria-live="assertive"></span>
							</div>
							<!-- // 이름, 생년월일 입력 -->

							<!-- 휴대전화 번호, 인증번호 입력 -->
							<div class="join_row join_mobile" id="mobDiv">
								<h3 class="join_title">
									<label for="phoneNo">휴대전화</label>
								</h3>

								<div class="int_mobile_area">
									<span class="ps_box int_mobile"> 
									<input type="text" name="memPhone" value="${dto.memPhone }" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16"> <label
										for="phoneNo" class="lbl"></label>
									</span> <a href="#" class="btn_verify btn_primary" id="btnSend"
										role="button"> <span class="">인증번호 받기</span>
									</a>
								</div>
								<div class="ps_box_disable box_right_space" id="authNoBox">
									<input type="tel" id="authNo" name="authNo"
										placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요"
										aria-describedby="wa_verify" class="int" disabled
										maxlength="4"> <label id="wa_verify" for="authNo"
										class="lbl"> <span class="wa_blind">인증받은 후
											인증번호를 입력해야 합니다.</span> <span class="input_code" id="authNoCode"
										style="display: none;"></span>
									</label>
								</div>

								<span class="error_next_box" id="phoneNoMsg"
									style="display: none" aria-live="assertive"></span> <span
									class="error_next_box" id="authNoMsg" style="display: none"
									aria-live="assertive"></span> <span class="error_next_box"
									id="joinMsg" style="display: none" aria-live="assertive"></span>
							</div>
							<!-- // 휴대전화 번호, 인증번호 입력 -->

							<!-- tg-display=>{"보호자 모바일 인증": [], "오류 메시지": []} -->
							<div class="join_minor tab" id="pmobDiv" style="display: none">
								<ul class="tab_m" role="tablist">
									<li class="m1" role="presentation"><a href="#"
										onclick="return false;" class="on" role="tab"
										aria-selected="true" aria-controls="wa_tab_phone">휴대전화인증</a></li>
									<li class="m2" role="presentation"><a href="#"
										id="tabPrtsIpin" role="tab" aria-selected="false"
										aria-controls="wa_tab_ipin">아이핀 인증</a></li>
								</ul>
								<div id="wa_tab_phone" role="tabpanel">
									<div class="agree_check_wrap">
										<div class="terms_chk_all">
											<span class="input_chk"> <input type="checkbox"
												id="pagree_all" class="chk_all"> <label
												for="pagree_all"> <span class="chk_all_txt">아래
														약관에 모두 동의합니다.</span>
											</label>
											</span>
										</div>
										<div class="small_check_box">
											<span class="input_chk"> <input type="checkbox"
												id="pagree_01" class="chk"> <label for="pagree_01">
													<a
													href="https://nid.naver.com/user2/common/terms/terms?m=viewPersonalInfoTerms"
													target="_blank"><span>개인정보 이용</span></a>
											</label>
											</span> <span class="input_chk"> <input type="checkbox"
												id="pagree_02" class="chk"> <label for="pagree_02">
													<a
													href="https://nid.naver.com/user2/common/terms/terms?m=viewUniqInfoTerms"
													target="_blank"><span>고유식별정보 처리</span></a>
											</label>
											</span> <span class="input_chk"> <input type="checkbox"
												id="pagree_03" class="chk"> <label for="pagree_03">
													<a
													href="https://nid.naver.com/user2/common/terms/terms?m=viewCellPhoneCarriersTerms"
													target="_blank"><span>통신사 이용약관</span></a>
											</label>
											</span> <span class="input_chk"> <input type="checkbox"
												id="pagree_04" class="chk"> <label for="pagree_04">
													<a
													href="https://nid.naver.com/user2/common/terms/terms?m=viewServiceTerms"
													target="_blank"><span>인증사 이용약관</span></a>
											</label>
											</span> <span class="input_chk"> <input type="checkbox"
												id="pagree_05" class="chk"> <label for="pagree_05">
													<a
													href="https://nid.naver.com/user2/common/terms/terms?m=viewNaverTerms"
													target="_blank"><span>네이버 개인정보 수집</span></a>
											</label>
											</span>
										</div>
										<span class="error_next_box" id="pagreeMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
									</div>
									<div class="row_group">
										<div class="join_row">
											<h3 class="join_title">
												<label for="pname">보호자 이름</label>
											</h3>
											<span class="ps_box box_right_space"> <input
												type="text" id="pname" name="pname" title="보호자 이름"
												class="int" maxlength="40">
											</span> <span class="error_next_box" id="pnameMsg"
												style="display: none" aria-live="assertive">필수 정보입니다.</span>
										</div>
										<div class="join_row join_birthday">
											<h3 class="join_title">
												<label for="pyy">보호자 생년월일</label>
											</h3>
											<div class="bir_wrap">
												<div class="bir_yy">
													<span class="ps_box"> <input type="text" id="pyy"
														placeholder="년(4자)" aria-label="년(4자)" class="int"
														maxlength="4">
													</span>
												</div>
												<div class="bir_mm">
													<span class="ps_box"> <select id="pmm" name="pmm"
														class="sel" aria-label="월">
															<option>월</option>
															<option>1</option>
															<option>2</option>
															<option>3</option>
															<option>4</option>
															<option>5</option>
															<option>6</option>
															<option>7</option>
															<option>8</option>
															<option>9</option>
															<option>10</option>
															<option>11</option>
															<option>12</option>
													</select>
													</span>
												</div>
												<div class="bir_dd">
													<span class="ps_box"> <input type="text" id="pdd"
														placeholder="일" aria-label="일" class="int" maxlength="2">
														<label for="pdd" class="lbl"></label>
													</span>
												</div>
											</div>
											<span class="error_next_box" id="pbirthdayMsg"
												style="display: none" aria-live="assertive">필수 정보입니다.</span>
										</div>
										<div class="join_row">
											<h3 class="join_title">
												<label for="pgender">보호자 성별/국적</label>
											</h3>
											<div class="join_guardian">
												<div class="gender_nationality">
													<div class="ps_box gender_code">
														<select id="pgender" name="pgender" class="sel"
															aria-label="성별">
															<option value="" selected="">성별</option>
															<option value="0">남자</option>
															<option value="1">여자</option>
														</select>
													</div>
												</div>
												<div class="gender_nationality">
													<div class="ps_box gender_code">
														<select id="pforeign" name="pforeign" class="sel"
															aria-label="내국인여부">
															<option value="0" selected="">내국인</option>
															<option value="1">외국인</option>
														</select>
													</div>
												</div>
											</div>
											<span class="error_next_box" id="pgenderMsg"
												style="display: none" aria-live="assertive"></span>
										</div>
									</div>
									<div class="join_row join_mobile">
										<h3 class="join_title">
											<label for="ptelecom">통신사</label>
										</h3>
										<div class="ps_box country_code">
											<select id="ptelecom" name="ptelecom" class="sel"
												aria-label="통신사">
												<option value="SKT">SKT</option>
												<option value="KTF">KT</option>
												<option value="LGT">LG U+</option>
												<option value="SKR">SKT 알뜰폰</option>
												<option value="KTR">KT 알뜰폰</option>
												<option value="LGR">LG U+ 알뜰폰</option>
											</select>
										</div>
									</div>
									<div class="join_row join_mobile">
										<h3 class="join_title">
											<label for="pphoneNo">휴대전화</label>
										</h3>
										<div class="int_mobile_area">
											<span class="ps_box int_mobile"> <input type="tel"
												id="pphoneNo" name="pphoneNo" placeholder="전화번호 입력"
												aria-label="전화번호 입력" class="int" maxlength="16">
											</span> <a href="#" class="btn_verify btn_primary" id="btnPrtsSend"
												role="button"> <span class="">인증번호 받기</span>
											</a>
										</div>
										<div class="ps_box_disable box_right_space" id="pauthNoBox">
											<input type="tel" id="pauthNo" name="pauthNo"
												placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요"
												aria-describedby="pwa_verify" class="int" disabled
												maxlength="6"> <label id="pwa_verify" for="pauthNo"
												class="lbl"> <span class="wa_blind">인증받은 후
													인증번호를 입력해야 합니다.</span> <span class="input_code" id="pauthNoCode"
												style="display: none;"></span>
											</label>
										</div>
										<span class="error_next_box" id="pphoneNoMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
										<span class="error_next_box" id="pauthNoMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
										<span class="error_next_box" id="pjoinMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
									</div>
								</div>
							</div>
							<!-- tg-display -->

							<!-- tg-display=>{"보호자 아이핀 인증": [], "오류 메시지": []} -->
							<div class="join_minor tab" id="pipinDiv" style="display: none">
								<ul class="tab_m" role="tablist">
									<li class="m1" role="presentation"><a href="#"
										id="tabPrtsMobile" role="tab" aria-selected="false"
										aria-controls="wa_tab_phone">휴대전화인증</a></li>
									<li class="m2" role="presentation"><a href="#"
										onclick="return false;" class="on" role="tab"
										aria-selected="true" aria-controls="wa_tab_ipin">아이핀 인증</a></li>
								</ul>
								<div id="wa_tab_ipin" role="tabpanel">
									<div class="terms_chk_all">
										<span class="input_chk"> <input type="checkbox"
											id="iagree_all" class="chk"> <label for="iagree_all"
											class="ipin_label"> <span class="txt">보호자 인증이
													완료되면 보호자 이름, 생년월일, 성별, 중복가입확인정보(DI)가 보호자 동의 확인을 위하여 아동의 정보와
													함께 저장되며, <strong class="point">아동이 성년이 되는 시점에
														파기됩니다.</strong>
											</span>
										</label>
										</span> <span class="error_next_box" id="iagreeMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
									</div>
									<div class="ipin_box">
										<p class="ipin_certify_txt">
											보호자 명의의 아이핀으로 인증 후<br> 가입이 가능 합니다.
										</p>
										<button type="button" id="btnIpinPopup"
											class="ipin_certify_btn" title="새 창">
											<span>아이핀 인증하기</span>
										</button>
										<span class="error_next_box" id="ipopupMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
									</div>
									<div class="join_row join_mobile">
										<h3 class="join_title">
											<label for="iphoneNo">휴대전화</label>
										</h3>
										<div class="int_mobile_area">
											<span class="ps_box int_mobile"> <input type="tel"
												id="iphoneNo" name="iphoneNo" placeholder="전화번호 입력"
												aria-label="전화번호 입력" class="int" maxlength="16">
											</span> <a href="#" class="btn_verify btn_primary" id="btnIpinSend"
												role="button"> <span class="">인증번호 받기</span>
											</a>
										</div>
										<div class="ps_box_disable box_right_space" id="iauthNoBox">
											<input type="tel" id="iauthNo" name="iauthNo"
												placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요"
												aria-describedby="iwa_verify" class="int" disabled
												maxlength="4"> <label id="iwa_verify" for="iauthNo"
												class="lbl"> <span class="wa_blind">인증받은 후
													인증번호를 입력해야 합니다.</span> <span class="input_code" id="iauthNoCode"
												style="display: none;"></span>
											</label>
										</div>
										<span class="error_next_box" id="iphoneNoMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
										<span class="error_next_box" id="iauthNoMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
										<span class="error_next_box" id="ijoinMsg"
											style="display: none" aria-live="assertive">필수 정보입니다.</span>
									</div>
								</div>
							</div>

							<div class="btn_area">
								<button type="submit" id="btnJoin" class="btn_type btn_primary">
									<span>수정하기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- // container -->
			</form>
</body>
</html>

