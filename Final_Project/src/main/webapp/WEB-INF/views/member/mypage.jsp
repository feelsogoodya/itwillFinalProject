<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>마이페이지</title>
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
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<script type="text/javascript"></script>
<meta name="decorator" content="NEW_USER_MYINFO_V2">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
// 유효성 검사
function check() {
	var memEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var memName = RegExp(/^[가-힣]{2,6}$/);
	var memNname = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
	var memphone = RegExp(/^01[0179][0-9]{7,8}$/);
	
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
//		if($('#memAddress').val()==""){
//			alert("주소을 입력하세요");
//			$('#memAddress').focus();
//			return false;
//		}
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

// 주소 api
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
//             document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
//             document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
</head>

<c:if test="${empty sessionScope.memId}">
	<c:redirect url="/member/login"></c:redirect>
</c:if>

<body onclick="clearDocs();gnbClose();" id="mainBody" class="bgother">
    <!-- Header Section Begin -->
    <jsp:include page="../../../resources/fragments/header.jsp"></jsp:include>
    <!-- Header Section End -->
<form action="${pageContext.request.contextPath }/member/updatePro" onsubmit="return check()" method="POST">
	<div id="wrap" class="wrap naverid">
		<div class="u_skip">
			<a href="#container">본문 바로가기</a>
		</div>

		<header class="header" role="banner">
			<div class="header_subindex">

				<!-- 				<div class="gnb_area"> -->
				<!-- 					<div class="header__logo" style="text-align: center;"> -->
				<!-- 						<a href="./index.html"> <img -->
				<%-- 							src="${pageContext.request.contextPath }/resources/img/marketLogo.png" --%>
				<!-- 							alt="" width="180"></a> -->
				<!-- 					</div> -->
				<!-- 					        </a> -->
				<!-- 					        <a href="/user2/help/myInfoV2?lang=ko_KR" class="gnb_title" onclick="clickcr(this,'gnb.naverID','','',event)"> -->
				<!-- 					            <h1 class="text"><span class="blind"></span></h1> -->
				<!-- 					        </a> -->
				<!-- 				</div> -->

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
						<li>
						</li>
					</ul>
					<ul class="left_link">
<<<<<<< HEAD
=======
						<!--             <li><a href="https://nca.naver.com/chat/account/view" class="left_item" onclick="clickcr(this,'fot.smartbot','','',event)"> -->
						<!--                     <div class="link_text">음</div> -->
						<!--                 </a></li> -->
						<!--             <li><a href="https://talk.naver.com/ct/wc4bsu#nafullscreen" class="left_item" onclick="clickcr(this,'fot.membertalktalk','','',event)"> -->
						<!--                     <div class="link_text">흠</div> -->
						<!--                 </a></li> -->
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
						
						
>>>>>>> 58dfeda2880c7828687e5c688f5cf8a9c5c83a32
					</ul>

					<!-- footerLeft -->
					<footer class="left_footer" role="contentinfo">
						<ul class="left_guide">
							<li><a href="${pageContext.request.contextPath }/member/logout" class="btn_link">
								<div class="footer_text">로그아웃</div>
							</a></li>
							<li>
							<a href="${pageContext.request.contextPath }/notice/list">
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
<!-- 										<div class="myaccount"> -->
<!-- 											<div class="myname"> -->
<%-- 												<div class="name_text">${dto.memNname }</div> --%>
<%-- 												<div class="myaddress">${dto.memId }</div> --%>
<!-- 						                            <button type="button" class="btn_edit" onclick="changeName()"> -->
<!-- 						                                <span class="text">닉네임 수정</span> -->
<!-- 						                            </button> -->
<!-- 											</div> -->
<!-- 										</div> -->
										<div class="myaccount">
											<div class="myname">
<<<<<<< HEAD
												<input type="text" id="memNname" name="memNname" title="닉네임" class="int" value="${dto.memNname }"
													maxlength="40" placeholder="2~10자의 한글, 영문 대소문자와 숫자로만 입력" style="font-size:25px;">
<%-- 												<div class="myaddress">${dto.memId }</div> --%><br>
													<input type="text" name="memId" value="${dto.memId }" class="myaddress" 
														title="ID" maxlength="20" oninput="checkId()" readonly>
						                            <button type="submit" class="btn_edit" >
						                                <span class="text">닉네임 수정</span>
						                            </button>
=======
												<div class="name_text">${dto.memNname }</div>
												<div class="myaddress">${dto.memId }</div><br>
											<div class="myreviewscore">
												나의 거래점수: ${dto.revTotal}점</div>
												<!--                             <button type="button" class="btn_edit" onclick="changeName()"> -->
												<!--                                 <span class="text">수정</span> -->
												<!--                             </button> -->
>>>>>>> 58dfeda2880c7828687e5c688f5cf8a9c5c83a32
											</div>
										</div>

									</li>
								</ul>
							</div>

							<ul class="subindex_row">
<!-- 								<li> -->
<!-- 									<div id="phoneNoRegDiv" class="row_item name "> -->
<%-- 										<span id="phoneNoRegSpan" class="item_text">${dto.memName }</span> --%>
<!-- 									</div> -->
<!-- 								</li> -->
								<li>
									<div id="phoneNoRegDiv" class="row_item name ">
										<input type="text" id="memName" name="memName" title="이름" class="int" value="${dto.memName }"
											maxlength="10" placeholder="2~6자의 한글만 입력" style="width: 550px;">
						                    <button type="submit" class="btn_edit">
						                        <span class="text">실명 수정</span>
						                    </button>
									</div>
								</li>
								<li>
									<div class="row_item lock">
					                    <input type="password" id="memPass" name="memPass" class="int"
											aria-describedby="pswd1Msg" maxlength="20" value="${dto.memPass }"
											placeholder="4~12자의 영문 대소문자와 숫자로만 입력" style="width: 550px;" readonly>
					                    <button type="submit" class="btn_edit">
					                        <span class="text">수정</span>
					                    </button>
					                </div>
								</li>
								<li>
									<div class="row_item mail ">
<%-- 										<span id="myLetterEmailRegSpan" class="item_text">${dto.memEmail }</span> --%>
										<input type="text" id="memEmail" name="memEmail" aria-label="선택입력" value="${dto.memEmail }"
											class="int" maxlength="100" placeholder="ex)...@naver.com" style="width: 550px;">
						                    <button type="submit" class="btn_edit">
						                        <span class="text">수정</span>
						                    </button>
									</div>
								</li>
								<li>
									<div id="phoneNoRegDiv" class="row_item phone ">
<%-- 										<span id="phoneNoRegSpan" class="item_text">${dto.memPhone }</span> --%>
										<input type="text" id="memPhone" name="memPhone" placeholder="전화번호 입력" value="${dto.memPhone }"
											aria-label="전화번호 입력" class="int" style="width: 550px;">
						                    <button type="submit" class="btn_edit">
						                        <span class="text">수정</span>
						                    </button>
									</div>
								</li>
								<li>
									<div id="phoneNoRegDiv" class="row_item other ">
										<input type="text" id="sample6_address" name="memAddress" placeholder="상세주소" class="int" value="${dto.memAddress }" style="width: 400px;">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="d_btn">
										<span></span>
										<input type="text" id="sample6_extraAddress" name="memAddress" class="int" placeholder="상세주소" style="width: 550px;">
					                    <button type="submit" class="btn_edit" >
					                        <span class="text">수정</span>
					                    </button>
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
						<!--     <div class="drop_link"> -->
						<%--         	<a href="${pageContext.request.contextPath }/member/logout" class="btn_link" > --%>
						<!--             <span class="text">로그아웃</span> -->
						<!--         </a> -->
						<!--     </div> -->

					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
