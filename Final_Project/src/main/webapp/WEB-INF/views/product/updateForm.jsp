<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
   <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>가지마켓: Product</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/list.css" type="text/css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/product/product_insert.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/product/basic.css">
<title>상품등록</title>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- daum API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<!-- insert JavaScript -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/product/product_update.js"></script>
<script type="text/javascript">

function checkNum(e) {
    var keyVal = event.keyCode;

    if(((keyVal >= 48) && (keyVal <= 57))){
        return true;
    }
    else{
        alert("숫자만 입력가능합니다");
        return false;
    }
}

$(document).ready(function() {

	$('#submitButn').click(function() {
		
		if($("#productTitle").val()==''){
			alert('제목입력해주세요');
			$("#productTitle").focus();
			return;
		}
		
		if($("#productPrice").val()==''){
			alert('가격이 비어있습니다. (숫자만 입력가능)');
			$("#productPrice").focus();
			return;
		}
		
		if($("#sumimage").val()==''){
			// debugger;
			alert('사진을 넣어주세요.');
			$("#imgup").focus();
			return;
		}
		
		if($("#productCate").val()=='0'){
			alert('카테고리를 선택하세요. ');
			$("#productCate").focus();
			return;
		}
		
// 		if($("#productLoca").val()==''){
// 			alert('거래지역을 선택해주세요. ');
// 			$("#productLoca").focus();
// 			return;
// 		}
		
		if($("#productContent").val()==''){
			alert('상품설명을 적어주세요. ');
			$("#productContent").focus();
			return;
		}
		
// 		/* 가격 콤마 제거 */
	var productPrice = $('#productPrice').val().replace(/,/gi, ''); 
		$('#productPrice').val(productPrice)
		
		$("#join").submit();

	});

});
 </script>
 
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <jsp:include page="../../../resources/fragments/header.jsp"></jsp:include>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
    	<jsp:include page="../../../resources/fragments/hero.jsp"></jsp:include>
    </section>
    <!-- Hero Section End -->
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>상품등록</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

<form action="${pageContext.request.contextPath }/product/updatePro" method="post" id="join" enctype="multipart/form-data" name="fr">
<input type="hidden" name="num" value="${dto.productNum}">
<!-- 	<div id="root"> -->

		<div id="insert_box">
<!-- 			<span id="title">상품등록</span> -->

			<table style="margin-top: 30px;">
				<!-- 기본정보 -->
				<tr>
					<td colspan="2" align="left"><span class="pro_info">기본정보</span>
						&nbsp;&nbsp;&nbsp; <span style="font-size: 14px; color: red">*필수항목</span></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
<!-- ------------------- -->

		<input type="file" id="sumimage"   style="display: none;" accept=".jpg, .jpeg, .png" name="file">
		<input type="file" id="imageFile1" style="display: none;" accept=".jpg, .jpeg, .png" name="file1">
		<input type="file" id="imageFile2" style="display: none;" accept=".jpg, .jpeg, .png" name="file2">
		<input type="file" id="imageFile3" style="display: none;" accept=".jpg, .jpeg, .png" name="file3">
		<input type="file" id="imageFile4" style="display: none;" accept=".jpg, .jpeg, .png" name="file4">
		<input type="file" id="imageFile5" style="display: none;" accept=".jpg, .jpeg, .png" name="file5">


	

<!-- ------------------- -->
	
				
				<!-- 제목  -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">제목<span style="color: red">*</span></span></td>
						
					<td class="td2" align="left">
						<div style="display: inline-block; min-width: 70px; ">
							<span class="pro_info" id="name_length">0/40</span>
						</div>
						
						<input maxlength="40"
						oninput="numberMaxLength(this);" type="text" id="productTitle"
						name="productTitle" class="input-tag" placeholder="제목을 입력하세요." value="${dto.productTitle}">
					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
					<!-- 가격  -->
				<tr>	
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">가격<span style="color: red">*</span></span></td>
					<td class="td2" align="left"><input type="text" id="productPrice" maxlength="9" value="${dto.productPrice}" onKeyPress="return checkNum(event)"
						name="productPrice" class="input-tag" placeholder="가격"
						oninput="this.value = this.value.replaceAll(/\D/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')"
						oninput="numberMaxLength(this);" style="width: 30%;"> &nbsp; <span class="pro_info">원</span>
						<br>
						<span class="pro_info" id="price_under"></span>
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				<!-- 카테고리 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">카테고리<span style="color: red">*</span></span></td>
					<td class="td2" align="left"><select class="input-tag"
						id="productCate" name="productCate" style="width: 30%; height: 35px;">
							<option value="0">카테고리 선택</option>
							<c:forEach var="cate" items="${categories }">
								<option>${cate }</option>
							</c:forEach>
					</select></td>
				</tr>


				<tr>
					<td colspan="2"><hr></td>
				</tr>
		
				<!-- 거래지역 -->
<!-- 				<tr> -->
<!-- 					<td class="td1" align="left" style="vertical-align: top;"><span -->
<!-- 						class="pro_info">거래지역<span style="color: red">*</span></span></td> -->
					
<!-- 					<td align="left"> -->
<!-- 						<input type="button" id="myaddr" value="내주소" > -->
<!-- 						<input type="button" id="addrfind" value="주소찾기" onclick="addrFind();"> -->
<!-- 						<br> -->
<!-- 						<input type="text" id="productLoca" name="productLoca" class="input-tag" style="margin-top: 5px;"> -->
<!-- 					</td> -->


<!-- 				</tr> -->

<!-- 				<tr> -->
<!-- 					<td colspan="2"><hr></td> -->
<!-- 				</tr> -->
				
				<!-- 상품상태 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">상품상태<span style="color: red">*</span></span></td>
					<td class="td2" align="left">
						<input type="radio"	name="productGrade" id="productGrade" value="상" checked="checked">
						<span class="pro_info">상</span>
						<input type="radio"	name="productGrade" id="productGrade" value="중">
						<span class="pro_info">중</span>
						<input type="radio"	name="productGrade" id="productGrade" value="하">
						<span class="pro_info">하</span>
					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
		
				
				<!-- 상품설명 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">상품설명<span style="color: red">*</span></span></td>
					<td align="left">
					
						<br>
						<div>
						<textarea  class="input-tag prod-info"  maxlength="1000"
							id="productContent" name="productContent" 
							oninput="numberMaxLength(this);"
							placeholder="상품의 필요한 정보를 넣어주세요. &#13;구매자의 문의를 줄일 수 있습니다.">${dto.productContent}</textarea>
						</div>
						<div align="right"><span style="font-size: 18px;"id="exp_length">0/1000</span></div>
					</td>
				</tr>

			</form>	
			<tr>
					<td colspan="2"><hr></td>
				</tr>
<!-- 상품이미지 -->
				<tr>
					<td class="td1" align="left" ><span
						class="pro_info">상품이미지</span> 
						<span class="pro_info" id="img_number">(0/6)</span>
						<span style="color: red">*</span>
						<img id="imgup" onclick="img_preview();"
								src="${ pageContext.request.contextPath }/resources/img/product/image_upload.png" width="150px" height="150px">
						</td>
					<td class="td2" align="left">
					
						이미지 등록 영역
						<div id="img_zone">
							<div id="img_preview0" >
								<input type="image" id="imgup_sum" onclick="send_0();"
									src="" width="150px" height="150px">
								<span id="sum_style" >대표 이미지</span>
								
								<span id="del_sum" class="chk_style"  onclick="del_sum();">x</span>
							</div>
							
							<div id="img_preview1" >
								<input type="image" id="imgup_1" onclick="send_1();"
									src="" width="150px" height="150px">
								
								<span id="del_img1" class="chk_style" onclick="del_img1();">x</span>
							</div>
							
							<div id="img_preview2">
								<input type="image" id="imgup_2" onclick="send_2();"
									src="" width="150px" height="150px">
								<span id="del_img2" class="chk_style" onclick="del_img2();">x</span>
							</div>

							<div id="img_preview3">
								<input type="image" id="imgup_3" onclick="send_3();"
									src="" width="150px" height="150px">
								<span id="del_img3" class="chk_style" onclick="del_img3();">x</span>
							</div>

							<div id="img_preview4">
								<input type="image" id="imgup_4" onclick="send_4();"
									src="" width="150px" height="150px">
								<span id="del_img4" class="chk_style" onclick="del_img4();">x</span>
							</div>

							<div id="img_preview5">
								<input type="image" id="imgup_5" onclick="send_5();"
									src="" width="150px" height="150px">
								<span id="del_img5" class="chk_style" onclick="del_img5();">x</span>
							</div>
							
							
							
						</div>
						<div id="img_intro">
								
								* <b>대표 이미지</b>는 반드시 <font color="red"><b>등록</b></font>해야 합니다.<br>
								- 이미지를 <b>클릭할</b> 경우 이미지를 <b>수정</b>하실 수 있습니다.<br>
								- 이미지 등록은 좌측 <b>이미지 등록</b>을 눌러 등록할 수 있습니다.<br>
								- 이미지 확장자는 <b>.jpg, .jpeg, .png</b> 만 등록 가능합니다.
							</div>

					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>



<!-- 				등록 버튼 -->
				<tr>
					<td colspan="2">
						<th colspan="2"><input type="button" id="submitButn" value="등록하기"></th>
						
				</tr>

			</table>

		</div>
    <!-- Footer Section Begin -->
    <%@include file = "/resources/fragments/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>


</body>
</html>