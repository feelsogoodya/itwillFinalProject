<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>내프로필</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/member/mypage.css"
	type="text/css">
<link href="https://nid.naver.com/favicon_1024.png"
	rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<script type="text/javascript"></script>
<meta name="decorator" content="NEW_USER_MYINFO_V2">
</head>

<c:if test="${empty sessionScope.memId}">
	<c:redirect url="/member/login"></c:redirect>
</c:if>

<body onclick="clearDocs();gnbClose();" id="mainBody" class="bgother">

	<div id="wrap" class="wrap naverid">
		<!-- skip navigation -->
		<div class="u_skip">
			<a href="#container">본문 바로가기</a>
		</div>
		<!-- //skip navigation -->

		<header class="header" role="banner">
			<div class="header_subindex">

				<!--N로고/네이버ID-->
				<div class="gnb_area">
					<a href="https://www.naver.com/" class="logo"
						onclick="clickcr(this,'gnb.naver','','',event)"> <span
						class="blind">네이버</span>
					</a> <a href="/user2/help/myInfoV2?lang=ko_KR" class="gnb_title"
						onclick="clickcr(this,'gnb.naverID','','',event)">
						<h1 class="text">
							<span class="blind">가지마켓</span>
						</h1>
					</a>
				</div>

				<!--프로필-사진,아이디,메일주소,2단계인증알림-->
				<div class="profile_area">
					<div class="profile_inner">
						<a href="#" onclick="changeImage()" class="photo"> <img
							src="https://static.nid.naver.com/images/web/user/default.png"
							width="84" height="84" alt="프로필 이미지"> <span
							class="photo_edit"></span>
						</a>
						<div class="profile">
							<p class="useid">${dto.memName }</p>
							<p class="usemail">${dto.memEmail }</p>
						</div>
					</div>
				</div>

				<div id="headerLeft" class="header_left">

					<ul class="left_menu" role="menu">
						<li><a href="#none" class="left_item" role="menuitem"
							onclick="clickcr(this,'lnb.info','','',event)"
							aria-current="true">
								<div class="menu_text on">내 프로필</div>
						</a></li>
						<li><a href="myshop" class="left_item" role="menuitem"
							onclick="clickcr(this,'lnb.protect','','',event)" aria-current=>
								<div class="menu_text ">내 상점</div>
						</a></li>
						<li><a
							href="/user2/help/myInfoV2?m=viewManageHistory&lang=ko_KR"
							class="left_item" role="menuitem"
							onclick="clickcr(this,'lnb.history','','',event)" aria-current=>
								<div class="menu_text ">흠</div>
						</a></li>
					</ul>
					<ul class="left_link">
						<li><a href="https://nca.naver.com/chat/account/view"
							class="left_item"
							onclick="clickcr(this,'fot.smartbot','','',event)">
								<div class="link_text">음</div>
						</a></li>
						<li><a href="https://talk.naver.com/ct/wc4bsu#nafullscreen"
							class="left_item"
							onclick="clickcr(this,'fot.membertalktalk','','',event)">
								<div class="link_text">흠</div>
						</a></li>
						<li><a
							href="${pageContext.request.contextPath }/list/buylist"
							class="left_item">
								<div class="link_text">구매내역</div>
						</a></li>
						<li><a
							href="${pageContext.request.contextPath }/list/selllist"
							class="left_item">
								<div class="link_text">판매내역</div>
						</a></li>
					</ul>

					<!-- footerLeft -->
					<footer class="left_footer" role="contentinfo">
						<ul class="left_guide">
							<li><a href="javascript:;" onclick="logout()"
								class="left_item">
									<div class="footer_text">로그아웃</div>
							</a></li>
							<li><a href="javascript:;" onclick="goHelpPage()"
								class="left_item">
									<div class="footer_text">고객센터</div>
							</a></li>
						</ul>
						<ul class="footer_list">
							<li><a href="https://policy.naver.com/rules/privacy.html"
								class="footer_item"
								onclick="clickcr(this,'fot.privarypolicy','','',event)"> <span
									class="footer_text bold">개인정보처리방침</span>
							</a></li>
							<li><a href="https://policy.naver.com/rules/service.html"
								class="footer_item"
								onclick="clickcr(this,'fot.termsofuse','','',event)"> <span
									class="footer_text">이용약관</span>
							</a></li>
						</ul>
					</footer>
					<!-- //footerLeft -->

				</div>
				<!--//-->

			</div>
		</header>
		<div id="container" class="container">
			<!-- container -->
			<div id="content" class="content">
				<div class="subindex_wrap" role="main">

					<div id="headerTop" class="path_area">
						<div id="gnb" class="" style="float: right;">
							<script type='text/javascript' charset='utf-8'
								src='https://static.nid.naver.com/template/gnb_utf8.nhn?2023. 2. 13'>
								
							</script>
						</div>
					</div>
					<div class="subindex_item">
						<div class="subindex_greenbox">
							<div class="myprofile">
								<div class="info_title">
									<h3 class="title_text">기본정보</h3>
								</div>
								<ul class="myinfo_area">
									<li>
										<div class="myphoto">
											<img
												src="https://static.nid.naver.com/images/web/user/default.png"
												width="56" height="56" alt="내 프로필 이미지">
										</div>
									</li>
									<li>
										<div class="myaccount">
											<div class="myname">
												<div class="name_text">${dto.memNname }</div>
												<div class="myaddress">${dto.memId }</div>
												<!--                             <button type="button" class="btn_edit" onclick="changeName()"> -->
												<!--                                 <span class="text">수정</span> -->
												<!--                             </button> -->
											</div>
										</div>

									</li>
								</ul>
							</div>

							<ul class="subindex_row">
								<li>
									<div id="phoneNoRegDiv" class="row_item name ">
										<span id="phoneNoRegSpan" class="item_text">${dto.memName }</span>
										<!--                     <button type="button" id="phoneNoRegBtn" class="btn_edit" -->
										<!--                             onclick="showPhoneNumberChangePopUp()"> -->
										<!--                         <span id="phoneNoRegBtnTxt" class="text">실명수정</span> -->
										<!--                     </button> -->
									</div>
								</li>
								<li>
									<div class="row_item mail ">
										<span id="myLetterEmailRegSpan" class="item_text">${dto.memEmail }</span>
										<!--                     <button type="button" class="btn_edit" -->
										<!--                             onclick="showMyLetterEmailChangePopUp()"> -->
										<!--                         <span class="text">수정</span> -->
										<!--                     </button> -->
									</div>
								</li>
								<li>
									<div id="phoneNoRegDiv" class="row_item phone ">
										<span id="phoneNoRegSpan" class="item_text">${dto.memPhone }</span>
										<!--                     <button type="button" id="phoneNoRegBtn" class="btn_edit" -->
										<!--                             onclick="showPhoneNumberChangePopUp()"> -->
										<!--                         <span id="phoneNoRegBtnTxt" class="text">수정</span> -->
										<!--                     </button> -->
									</div>
								</li>
								<li>
									<div id="phoneNoRegDiv" class="row_item other ">
										<span id="phoneNoRegSpan" class="item_text">${dto.memAddress }</span>
										<!--                     <button type="button" id="phoneNoRegBtn" -->
										<!--                             class="btn_edit" -->
										<!--                             onclick="showPhoneNumberChangePopUp()"> -->
										<!--                         <span id="phoneNoRegBtnTxt" -->
										<!--                               class="text">수정</span> -->
										<!--                     </button> -->
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="subindex_link">
						<div class="drop_link">
							<a href="${pageContext.request.contextPath }/member/update"
								class="btn_link"> <span class="text">정보수정</span>
							</a>
						</div>
						<br>
						<div class="drop_link">
							<a href="${pageContext.request.contextPath }/member/delete"
								class="btn_link"> <span class="text">회원탈퇴</span>
							</a>
						</div>
						<br>
						<div class="drop_link">
							<a href="${pageContext.request.contextPath }/member/logout"
								class="btn_link"> <span class="text">로그아웃</span>
							</a>
						</div>
					</div>

					<!--관련링크-->
					<div class="link_cover">
						<div class="link_area">
							<ul class="link_list">
								<li>
									<button type="button" class="link_item"
										onclick="goSmartBotChat()">
										<span class="link_text">음</span>
									</button>
								</li>
								<li>
									<button type="button" class="link_item"
										onclick="goMemberTalkTalk()">
										<span class="link_text">흠</span>
									</button>
								</li>
							</ul>
						</div>
					</div>

					<footer class="footer" role="contentinfo">
						<div class="footer_home">
							<ul class="guide_link">
								<li><a
									href="${pageContext.request.contextPath }/member/logout"
									onclick="logout()" class="guide_item"> <span
										class="footer_text">로그아웃</span>
								</a></li>
								<li><a href="javascript:;" onclick="goHelpPage()"
									class="guide_item"> <span class="footer_text">고객센터</span>
								</a></li>
							</ul>
							<ul class="footer_list">
							</ul>
						</div>
					</footer>
				</div>
				<!-- //container -->
			</div>
		</div>

		<div id="myLetterEmailChangePopUpLayer" class="layer"
			style="display: none;">
			<div class="popup_layer">
				<div class="popup_layer_inner">
					<div class="popup_content">
						<!--팝업콘텐츠영역-->
						<div class="contact_edit_popup" style="width: 329px;">
							<h4 class="contact_edit_title">
								<strong class="bold">조보규님</strong>의 회원정보 중 <em class="accent">연락처
									이메일</em>을 수정하기 위해 인증절차가 필요합니다.
							</h4>
							<div id="p_txt_myLetterEmailForm" class="row_item mail">
								<span id="p_txt_myLetterEmail" class="item_text">pd******@n*******.com</span>
							</div>
							<div id="myLetterEmailForm" class="contact_form one">
								<div class="popup_row rightgap">
									<input type="email" placeholder="현재 연락처 이메일 입력"
										id="confirmMyLetterEmail" class="popup_input">
									<button type="button" class="btn_contact"
										onclick="doConfirmMyLetterEmail()">확인</button>
								</div>
							</div>
							<div class="contact_edit_desc">네이버 서비스의 변경/종료 등 대부분의 네이버
								안내에 사용합니다.</div>
							<div id="myLetterEmailPhoneVerify" class="contact_edit_desc">
								등록된 이메일 주소가 기억나지 않는다면 휴대전화 인증 후 이메일을 수정할 수 있습니다. <a
									href="javascript:;" class="link_come"
									onclick="userMobile('myLetterEmail')"> <span class="text">전화번호
										인증</span>
								</a>
							</div>
							<div class="contact_form">
								<div class="popup_row rightgap">
									<input type="email" placeholder="변경할 이메일 입력" id="myLetterEmail"
										class="popup_input" disabled>
									<button type="button" class="btn_contact"
										onclick="sendAuthNoForEmailAuth('myLetterEmail')">인증
									</button>
								</div>
								<div class="popup_row">
									<input type="text" placeholder="인증번호 입력"
										id="myLetterEmailAuthNo" class="popup_input"
										oninput="changeVerifyToPopupInput('myLetterEmailAuthNo')"
										disabled>
								</div>
								<a href="javascript:;" id="myLetterEmailAuthGuide"
									class="link_come"
									onclick="clickcr(this,'inf.primaryhelp','','',event)"> <span
									class="text">인증번호가 오지 않나요?</span>
								</a>
								<div id="myLetterEmailAuthGuideTxt" class="link_come_desc"
									style="display: none;">네이버가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해
									주세요. 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증'을 눌러주세요.</div>
								<p id="e_myLetterEmail" class="popup_error"></p>
							</div>
							<div class="btn_duo_popup">
								<a href="javascript:;" class="btn_item" role="button"
									onclick="clickcr(this,'inf.primarycancel','','',event);hideMyLetterEmailChangePopUp()">
									<span class="btn_text">취소</span>
								</a> <a href="javascript:;" class="btn_item on" role="button"
									onclick="setEmail()"> <span id="b_txt_myLetterEmail_reg"
									class="btn_text">변경</span>
								</a>
							</div>
							<button type="button" class="close_popup"
								onclick="clickcr(this,'inf.primaryx','','',event);hideMyLetterEmailChangePopUp()">
								<span class="blind">닫기</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="pswdEmailChangePopUpLayer" class="layer"
			style="display: none;">
			<div class="popup_layer">
				<div class="popup_layer_inner">
					<div class="popup_content">

						<!--팝업콘텐츠영역-->
						<div class="contact_edit_popup" style="width: 329px;">
							<h4 class="contact_edit_title">
								<strong class="bold">조보규님</strong>의 회원정보 중 <em class="accent">본인확인
									이메일</em>을 <span id="p_txt_pswdEmail_changeYn">등록</span>하기 위해 인증절차가
								필요합니다.
							</h4>
							<div id="p_txt_pswdEmailForm" class="row_item mail"
								style="display: none;">
								<span id="p_txt_pswdEmail" class="item_text"></span>
							</div>
							<div id="pswdEmailForm" class="contact_form one"
								style="display: none;">
								<div class="popup_row rightgap">
									<input type="email" placeholder="현재 본인확인 이메일 입력"
										id="confirmPswdEmail" class="popup_input">
									<button type="button" class="btn_contact"
										onclick="doConfirmPswdEmail()">확인</button>
								</div>
							</div>
							<div class="contact_edit_desc" aria-expanded="false">아이디,
								비밀번호 찾기, 로그인이 안되는 경우 등 본인확인이 필요한 경우 사용합니다.</div>
							<div class="contact_edit_desc">지금 로그인한 네이버 아이디나, 다른 사람의 네이버
								아이디는 연락처로 사용하실 수 없습니다. 비상 시 사용할 이메일 정보이니 정확하게 입력해 주세요.</div>
							<div id="pswdEmailPhoneVerify" class="contact_edit_desc"
								style="display: none;">
								등록된 이메일 주소가 기억나지 않는다면 휴대전화 인증 후 이메일을 수정할 수 있습니다. <a
									href="javascript:;" class="link_come"
									onclick="userMobile('pswdEmail')"> <span class="text">전화번호
										인증</span>
								</a>
							</div>
							<div class="contact_form">
								<div class="popup_row rightgap">
									<input type="email" placeholder="등록할 이메일 입력" id="pswdEmail"
										class="popup_input" disabled>
									<button type="button" class="btn_contact"
										onclick="sendAuthNoForEmailAuth('pswdEmail')">인증</button>
								</div>
								<div class="popup_row">
									<input type="text" placeholder="인증번호 입력" id="pswdEmailAuthNo"
										class="popup_input"
										oninput="changeVerifyToPopupInput('pswdEmailAuthNo')" disabled>
								</div>
								<a href="javascript:;" id="pswdEmailAuthGuide" class="link_come"
									onclick="clickcr(this,'inf.recoveryhelp','','',event)"> <span
									class="text">인증번호가 오지 않나요?</span>
								</a>
								<div id="pswdEmailAuthGuideTxt" class="link_come_desc"
									style="display: none;">네이버가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해
									주세요. 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증'을 눌러주세요.</div>
								<p id="e_pswdEmail" class="popup_error"></p>
							</div>
							<div class="btn_duo_popup">
								<a href="javascript:;" class="btn_item" role="button"
									onclick="excuteNclicksCancelAsPswdEmailYn();hidePswdEmailChangePopUp()">
									<span class="btn_text">취소</span>
								</a> <a href="javascript:;" class="btn_item on" role="button"
									onclick="setPswdEmail()"> <span id="b_txt_pswdEmail_reg"
									class="btn_text">등록</span>
								</a>
							</div>
							<button type="button" class="close_popup"
								onclick="excuteNclicksCloseAsPswdEmailYn();hidePswdEmailChangePopUp()">
								<span class="blind">닫기</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
</body>
</html>
