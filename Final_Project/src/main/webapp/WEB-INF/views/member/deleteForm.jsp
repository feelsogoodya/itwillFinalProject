<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>member/deleteForm.jsp</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">
<title>회원탈퇴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/delete.css" type="text/css">
<script type="text/javascript"></script>
<script>
	function validateForm() {
		var checkbox = document.getElementById("checkbox");
		if (!checkbox.checked) {
			alert("회원 탈퇴에 대한 안내의 동의해 주세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<form action="${pageContext.request.contextPath }/member/deletePro"
	method="POST" onsubmit="return validateForm()">
	<br>
	<div style="text-align: center;">
		<img src="/sample/resources/img/marketLogo.png" alt=""
			style="width: 200px;">
	</div>
	<br>
	<div id="wrap">
		<div id="header"></div>
		<div id="container">
			<div id="content">
				<div class="c_header">
					<h2>탈퇴 안내</h2>
					<p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
				</div>

				<div class="section_delete">
					<h3 class="h_dropout">
						사용하고 계신 아이디(<em>${dto.memId }</em>)는 탈퇴할 경우 복구가 불가능합니다.
					</h3>
					<p class="dropout_dsc">
						<em>탈퇴한 아이디는 본인과 타인 모두 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.
					</p>
					<h3 class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
					<p class="dropout_dsc">
						회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>삭제되는
						내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
					</p>
				</div>
				<h3 class="h_dropout">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h3>
				<p class="dropout_dsc">
					올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. <br> 삭제를 원하는 게시글이
					있다면 <em>반드시 탈퇴 전 삭제하시기 바랍니다.</em> <br> 탈퇴 후에는 회원정보가 삭제되어 본인
					여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.

				</p>
				<input type="hidden" name="token_help" value="kkMybPiw3B2SxhH0" />
				<input type="hidden" name="lang" value="ko_KR" />
				<div class="dropout_agree_area">
					<p class="contxt">
						<strong> 탈퇴 후에는 아이디 <em>${sessionScope.memId }</em> 로 다시
							가입할 수 있으며 아이디와 데이터는 복구할 수 없습니다. <br> 게시판형 서비스에 남아 있는 게시글은 탈퇴
							후 삭제할 수 없습니다. 
					</p>
					<input type="checkbox" id="checkbox" name="dropoutAgree">
					<label for="dropoutAgree"><strong>안내 사항을 모두
							확인하였으며, 이에 동의합니다.</strong></label>
				</div>

				<input type="hidden" name="memId" value="${sessionScope.memId }"
					readonly><br>

				<div class="btn_area_w">
					<p class="btn_area">
						<button type="submit" id="btnNext" class="btn_model">
							<b class="btn3">확인</b>
						</button>
					</p>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
