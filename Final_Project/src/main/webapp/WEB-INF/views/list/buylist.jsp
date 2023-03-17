<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>가지마켓: Buy List</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/resources/css/elegant-icons.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/resources/css/nice-select.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/resources/css/slicknav.min.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/resources/css/style.css"type="text/css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/resources/css/admin.css"type="text/css">
</head>

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 30px;
}

.buy-title {
	text-align: center;
	font-size: 50px;
}
</style>

<body>
	<!-- Header Section Begin -->
	<jsp:include page="../../../resources/fragments/header.jsp"></jsp:include>
	<!-- Header Section End -->
	
	<!-- Hero Section Begin -->
    <section class ="hero hero-normal">
   		<jsp:include page="../../../resources/fragments/hero.jsp"></jsp:include>
   	</section>
    <!-- Hero Section End -->
	
	<%
	System.out.println("jsp 동작!");
	%>
	<div class="buy-title">${sessionScope.memId}님의 구매내역</div>

	<div class="main" style="padding-right: 100px; text-align:right;">
		<input type="hidden" name="buymemName" value="${sessionScope.memId}">
        <button class="primary-btn" onclick="location.href='${pageContext.request.contextPath }//product/insertForm'" style="border: 0px;">판매하기</button>
	</div>

	<table class="rwd-table" style="table-layout: fixed;">
		<tbody>
			<tr class="color_menu">
				<th>구매일</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>금액</th>
				<th></th>
			</tr>
			
			<c:forEach var="dto" items="${buyList}">
			<input type="hidden" name="buyNum" value="${dto.buyNum}">
				<input type="hidden" name="prodSeller" value="${dto.prodSeller}">
			<tr>
				<%
				System.out.println("jsp 동작! 222222");
				%>
				<td>${dto.buyDate}</td>
				<td>
				<c:forTokens items="${dto.prodPic}" delims="|" var="p" end="0">
						<img src="${pageContext.request.contextPath }/resources/upload/${p}"
							width="100" height="100">
					</c:forTokens></td>
					
				<td><a href="${pageContext.request.contextPath }/product/details/prodName?num=${dto.buyNum}">
						${dto.prodTitle}</a></td>
				<td>${dto.prodPrice}원</td>
					<td>
				<c:if test="${dto.revResult eq 'N'}">
					<input type="button" value="거래후기 작성" class="goreview" onclick="openPop('${dto.buyNum}','${dto.prodSeller}')">
					</c:if></td>
					
					 </tr>
			</c:forEach>
		</tbody>
	</table>


	<div style="text-align: center;">
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
			<a
				href="${pageContext.request.contextPath }/list/buylist?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[10페이지
				이전] </a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/list/buylist?pageNum=${i}">[${i}]</a>
		</c:forEach>

		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/list/buylist?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">[10페이지
				다음] </a>
		</c:if>
	</div>




	<!-- Footer Section Begin -->
	<%@include file="/resources/fragments/footer.jsp"%>
	<!-- Footer Section End -->


	<!-- Js Plugins -->
	<script src="<c:url value ="/resources/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value ="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value ="/resources/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value ="/resources/js/jquery-ui.min.js"/>"></script>
	<script src="<c:url value ="/resources/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value ="/resources/js/mixitup.min.js"/>"></script>
	<script src="<c:url value ="/resources/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value ="/resources/js/main.js"/>"></script>
	<script type="text/javascript">
	
	function openPop(buyNum,prodSeller) {
			var goReviewpopup = window.open(
			// buyNum , prodSeller 모델 
			"${pageContext.request.contextPath}/review/review?prodSeller="+prodSeller+"&buyNum="+buyNum, "거래후기",
					"width=500,height=500,top=100,left=100");
		}
	</script>








</body>
</html>



