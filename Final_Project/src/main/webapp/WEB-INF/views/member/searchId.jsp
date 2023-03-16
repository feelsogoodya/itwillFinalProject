<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
<meta name="title" content="아이디 찾기 결과">
<title>아이디 찾기 결과</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/searchId.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/searchId2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/searchId3.css" type="text/css">
<script>
	var path = "${pageContext.request.contextPath }";

	$(document).ready(function() {

	});
</script>
<title>아이디 찾기 결과</title>
</head>
<body class="devicePC">
	<div class="container login" role="main">

		<div id="headerCommonLayout"></div>
		<header data-system="CCommonAppbar"
			class="common-layout__sc-1q47zu5-0 bUzayd">
			<div class="common-layout__sc-1q47zu5-1 gKMDnM">

				<h2 class="common-layout__sc-wllrag-0 gZwINX">아이디 찾기 결과</h2>
				<div
					class="common-layout__sc-1q47zu5-2 common-layout__sc-1q47zu5-3 dTSzMK dckHmY">
				</div>
				<div
					class="common-layout__sc-1q47zu5-2 common-layout__sc-1q47zu5-4 dTSzMK iCQSvQ"></div>
			</div>

		</header>
		<section class="content content--middle">

			<div class="login-find-result">
				<p class="login-find-result__title">
					고객님의 정보와 <br>일치하는 아이디 입니다.
				</p>
				<ul class="login-find-result__result-list">
					<li class="login-find-result__result-item">
						<div class="text-center">
							<c:choose>
								<c:when test="${empty searchVO}">
									<p class="mb-4">조회결과가 없습니다.</p>
								</c:when>
								<c:otherwise>
									<p class="mb-4">${searchVO.memId}</p>
									<div class="login-find-result__result-item__membership-date">${searchVO.memTime}
										가입</div>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</ul>
			</div>

			<div class="login-button">
				<p class="login-button__link">
					비밀번호가 기억나지 않으세요? <a href="passFind"
						class="login-button__link__link">비밀번호 찾기</a>
				</p>
				<a href="login" class="login-button__item login-button__item--blue">로그인</a>
			</div>
		</section>
		<div id="commonLayoutFooter"></div>
	</div>
</body>
</html>