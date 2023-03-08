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
    <!-- Header Section Begin -->
    <jsp:include page="../../../resources/fragments/header.jsp"></jsp:include>
    <!-- Header Section End -->
    
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
					</ul>
					<ul class="left_link">
					</ul>
					<!-- footerLeft -->
					<footer class="left_footer" role="contentinfo">
						<ul class="left_guide">
							<li><a
								href="${pageContext.request.contextPath }/member/logout"
								class="btn_link">
									<div class="footer_text">로그아웃</div>
							</a></li>
							<li><a href="${pageContext.request.contextPath }/notice/list">
									<div class="footer_text">고객센터</div>
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
