<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list/buylist.jsp</title>
<link href="../resources/css/admin.css" rel="stylesheet" type="text/css">
<style type="text/css">

table {
width: 100%;
border-top: 1px solid #444444;
border-collapse: collapse;
}

th,td{
border-bottom: 1px solid #444444;
padding: 30px;
}

.buy-title{
text-align: center;
font-size: 50px;
}
</style>
</head>


<body>
<div class="buy-title">${sessionScope.memberId}님의 구매내역</div>

<div class="main" style=" padding-left: 100px;">
<input type="hidden" name="buymemId" value="${sessionScope.memberId}">
<a href="${pageContext.request.contextPath }/">메인페이지</a><br>
<a href="${pageContext.request.contextPath }/sell/판매페이지">판매하기</a><br>
<%-- <div>나의 매너온도: ${reviewDTO.revTotalscore}</div> --%>
<!-- 								${sessionScope.revTotalscore} -->
</div>

  <table  class="rwd-table">
         <tbody>
           <tr class="color_menu">
			<tr><td>구매일</td>
			<td>이미지</td>
			<td>상품명</td>
			<td>금액</td>
			<td></td>
           </tr>
    <c:forEach var="dto" items="${buyList}">
 	<td>${dto.buyDate}</td>
	<td>${dto.prodPic}</td>
	<td><a href="${pageContext.request.contextPath }/selllist/prodName?num=${dto.buyNum}">
    ${dto.prodName}</a></td>
	<td>${dto.prodPrice} 원</td>
	<td><input type="button" value="거래후기 작성" class="goreview"onclick="openPop()"> </td>
           </c:forEach>
        </tbody>
    </table>



<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath }/list/buylist?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[10페이지 이전] </a>
</c:if>
 
<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath }/list/buylist?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
<a href="${pageContext.request.contextPath }/list/buylist?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">[10페이지 다음] </a>
</c:if>






</body>
</html>








<script type="text/javascript">

function  openPop() {
	var goReviewpopup = window.open(
		"${pageContext.request.contextPath}/review/review","거래후기","width=500,height=500,top=100,left=100");

}



</script>








</body>
</html>



