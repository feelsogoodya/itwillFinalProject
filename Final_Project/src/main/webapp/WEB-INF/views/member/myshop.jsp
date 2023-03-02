<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>샵</title>
<script type="text/javascript" src="/inc/common/js/jquery.min.js"></script>
<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/mypage.css" type="text/css">
</head>
<body>
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i>
									gajimarket@secondhand.com</li>
								<li>중고거래 편하고 쉽게 집에서 즐겨보세요</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">

							<!-- SNS 연결 로고 => 앱 버전 다운로드 링크 연결 예정 -->
							<!--                             <div class="header__top__right__social"> -->
							<!--                                 <a href="#"><i class="fa fa-facebook"></i></a> -->
							<!--                                 <a href="#"><i class="fa fa-twitter"></i></a> -->
							<!--                                 <a href="#"><i class="fa fa-linkedin"></i></a> -->
							<!--                                 <a href="#"><i class="fa fa-pinterest-p"></i></a> -->
							<!--                             </div> -->

							<!-- 세션값이 없을 때, 로그인 / 있을 때, 닉네임 & 로그아웃 -->
							<c:if test="${empty sessionScope.memId}">
								<div class="header__top__right__auth">
									<a href="${pageContext.request.contextPath }/member/login"><i
										class="fa fa-user"></i> Login</a>
								</div>
							</c:if>
							<c:if test="${! empty sessionScope.memId}">
								<div class="header__top__right__auth">
									<i class="fa fa-user"></i> ${sessionScope.memId }님 로그인하셨습니다.</a>
								</div>
								<div class="header__top__right__auth">
									<a href="${pageContext.request.contextPath }/member/logout"><i
										class="fa fa-user"></i> Logout</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 메뉴 아래 연결 -->
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="${pageContext.request.contextPath }/main/main"> <img
							src="${pageContext.request.contextPath }/resources/img/marketLogo.png"
							alt="" style="width: 190px;"></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a
								href="${pageContext.request.contextPath }/main/main">Home</a></li>

							<li><a href="./shop-grid.html">전체상품</a></li>

							<li><a href="${pageContext.request.contextPath }/free/list">자유게시판</a></li>

							<li><a
								href="${pageContext.request.contextPath }/notice/list">고객센터</a>
								<ul class="header__menu__dropdown">
									<li><a
										href="${pageContext.request.contextPath }/notice/list">공지사항</a></li>
									<li><a
										href="${pageContext.request.contextPath }/customerservice/list">Q
											& A</a></li>
								</ul></li>

							<li><a
								href="${pageContext.request.contextPath }/member/mypage">마이페이지</a>
								<ul class="header__menu__dropdown">
									<li><a
										href="${pageContext.request.contextPath }/member/mypage">마이프로필</a></li>
									<li><a
										href="${pageContext.request.contextPath }/mypage/wish">관심상품</a></li>
									<li><a href="./blog-details.html">채팅목록</a></li>
									<li><a href="./shoping-cart.html">판매내역</a></li>
									<li><a href="./checkout.html">구매내역</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
							<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
						</ul>
						<!-- 가격 -->
						<!-- <div class="header__cart__price">item: <span>$150.00</span></div> -->
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<div id="wrap" class="wrap naverid">
		<header class="header" role="banner">
			<div class="header_subindex">
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
						<li><a href="mypage" class="left_item" role="menuitem"
							onclick="clickcr(this,'lnb.info','','',event)" aria-current=>
								<div class="menu_text ">내 프로필</div>
						</a></li>
						<li><a href="#none" class="left_item" role="menuitem"
							onclick="clickcr(this,'lnb.protect','','',event)"
							aria-current="true">
								<div class="menu_text on">내 상점</div>
						</a></li>
						<!-- 					<li><a -->
						<!-- 						href="/user2/help/myInfoV2?m=viewManageHistory&lang=ko_KR" -->
						<!-- 						class="left_item" role="menuitem" -->
						<!-- 						onclick="clickcr(this,'lnb.history','','',event)" aria-current=> -->
						<!-- 							<div class="menu_text ">흠</div> -->
						<!-- 					</a></li> -->
					</ul>
					<ul class="left_link">
						<!-- 					<li><a href="https://nca.naver.com/chat/account/view" -->
						<!-- 						class="left_item" -->
						<!-- 						onclick="clickcr(this,'fot.smartbot','','',event)"> -->
						<!-- 							<div class="link_text">음</div> -->
						<!-- 					</a></li> -->
						<!-- 					<li><a href="https://talk.naver.com/ct/wc4bsu#nafullscreen" -->
						<!-- 						class="left_item" -->
						<!-- 						onclick="clickcr(this,'fot.membertalktalk','','',event)"> -->
						<!-- 							<div class="link_text">흠</div> -->
						<!-- 					</a></li> -->
					</ul>

					<!-- footerLeft -->
					<footer class="left_footer" role="contentinfo">
						<ul class="left_guide">
							<li><a
								href="${pageContext.request.contextPath }/member/logout"
								class="btn_link">
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
				</div>
			</div>
		</header>
		<div id="container" class="container">
			<!-- container -->
			<div id="content" class="content">
				<div class="subindex_wrap" role="main">

					<div id="headerTop" class="path_area">
						<div id="gnb" class="" style="float: right;">
							<script type='text/javascript' charset='utf-8'
								src='https://static.nid.naver.com/template/gnb_utf8.nhn?2023. 2. 14'>
								
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
