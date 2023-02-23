<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">

<title>보안설정</title>

<script type="text/javascript" src="/inc/common/js/jquery.min.js"></script>
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/mypage.css" type="text/css">
<meta name="decorator" content="NEW_USER_MYINFO_V2">
    <script type="text/javascript">
        var nsc = "my.protect" + "";
        var ccsrv = "cc.naver.com";
    </script>
</head>


<body onclick="clearDocs();gnbClose();" id="mainBody" class="bgother">
<div id="wrap" class="wrap naverid">
    <!-- skip navigation -->
    <div class="u_skip"><a href="#container">본문 바로가기</a></div>
    <!-- //skip navigation -->

<header class="header" role="banner">
    <div class="header_subindex">

    <!--N로고/네이버ID-->
    <div class="gnb_area">
        <a href="https://www.naver.com/" class="logo" onclick="clickcr(this,'gnb.naver','','',event)">
            <span class="blind">네이버</span>
        </a>
        <a href="/user2/help/myInfoV2?lang=ko_KR" class="gnb_title" onclick="clickcr(this,'gnb.naverID','','',event)">
            <h1 class="text"><span class="blind">가지마켓</span></h1>
        </a>
    </div>

    <!--프로필-사진,아이디,메일주소,2단계인증알림-->
    <div class="profile_area">
        <div class="profile_inner">
            <a href="#" onclick="changeImage()" class="photo">
                <img src="https://static.nid.naver.com/images/web/user/default.png" width="84"
                     height="84" alt="프로필 이미지">
                <span class="photo_edit"></span>
            </a>
            <div class="profile">
                <p class="useid">${dto.memName }</p>
                <p class="usemail">${dto.memEmail }</p>
            </div>
        </div>
    </div>

    <div id="headerLeft" class="header_left">

        <ul class="left_menu" role="menu">
            <li>
                <a href="mypage" class="left_item" role="menuitem" onclick="clickcr(this,'lnb.info','','',event)"
                   aria-current=>
                    <div class="menu_text ">내 프로필</div>
                </a>
            </li>
            <li>
                <a href="#none" class="left_item" role="menuitem" onclick="clickcr(this,'lnb.protect','','',event)"
                   aria-current="true">
                    <div class="menu_text on">내 상점</div>
                </a>
            </li>
            <li>
                <a href="/user2/help/myInfoV2?m=viewManageHistory&lang=ko_KR" class="left_item"
                   role="menuitem" onclick="clickcr(this,'lnb.history','','',event)"
                   aria-current=>
                    <div class="menu_text ">흠</div>
                </a>
            </li>
        </ul>
        <ul class="left_link">
            <li><a href="https://nca.naver.com/chat/account/view" class="left_item" onclick="clickcr(this,'fot.smartbot','','',event)">
                    <div class="link_text">음</div>
                </a></li>
            <li><a href="https://talk.naver.com/ct/wc4bsu#nafullscreen" class="left_item" onclick="clickcr(this,'fot.membertalktalk','','',event)">
                    <div class="link_text">흠</div>
                </a></li>
        </ul>

        <!-- footerLeft -->
        <footer class="left_footer" role="contentinfo">
            <ul class="left_guide">
                <li><a href="javascript:;" onclick="logout()" class="left_item">
                        <div class="footer_text">로그아웃</div>
                    </a></li>
                <li><a href="javascript:;" onclick="goHelpPage()" class="left_item">
                        <div class="footer_text">고객센터</div>
                    </a></li>
            </ul>
            <ul class="footer_list">
                
                <li>
                    <a href="https://policy.naver.com/rules/privacy.html" class="footer_item" onclick="clickcr(this,'fot.privarypolicy','','',event)">
                        <span class="footer_text bold">개인정보처리방침</span>
                    </a>
                </li>
                <li>
                    <a href="https://policy.naver.com/rules/service.html" class="footer_item" onclick="clickcr(this,'fot.termsofuse','','',event)">
                        <span class="footer_text">이용약관</span>
                    </a>
                </li>
            </ul>
        </footer>


</header>
    <div id="container" class="container">
        <!-- container -->
        <div id="content" class="content">
            <div class="subindex_wrap" role="main">

                <div id="headerTop" class="path_area">
                    <div id="gnb" class="" style="float:right;">
                        <script type='text/javascript' charset='utf-8'
                                src='https://static.nid.naver.com/template/gnb_utf8.nhn?2023. 2. 14'>
                        </script>
                    </div>
                </div>
                <!--기본보안설정-->
<div class="subindex_item">
    <div class="subindex_greenbox">
        <div class="info_title">
            <h3 class="title_text">기본보안설정</h3>
            <a href="javascript:;" id="info1" class="link_info" aria-expanded="false"><span class="blind">도움말</span></a>

            <div id="info1ToolTip" class="info_tooltip" aria-hidden="true" style="display: none;">
                <strong class="info_head">비밀번호</strong>
                <p class="info_desc">네이버에 로그인할 때 사용하는 비밀번호를 변경할 수 있어요. 다른 사람이 알 수 없는 비밀번호로 설정해 주세요.</p>
                <strong class="info_head">2단계 인증</strong>
                <p class="info_desc">핸드폰으로 알림을 발송하여 회원님이 허락할 때만 로그인할 수 있는 보안 기능입니다. 네이버 아이디를 보호하기 위해 2단계 인증을 꼭 설정해 주세요.</p>
                <button type="button" id="infoExit1" class="btn_exit"><span class="blind">닫기</span></button>
            </div>

        </div>

        <ul class="subindex_row">
            <li>
                <div class="row_item lock">
                    <span class="item_text">비밀번호</span>
                    <button type="button" class="btn_edit" onclick="goChangePassword()">
                        <span class="text">수정</span>
                    </button>
                </div>
            </li>

            <li>
                <div class="row_item step">
                    <span class="item_text">2단계 인증</span>
                    <button type="button"
                            class="btn_edit"
                            onclick="excuteNclicksAs2StepVerification();go2StepVerification()">
                        <span class="text">
                                관리
                        </span>
                    </button>
                </div>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
