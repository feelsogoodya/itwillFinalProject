<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>가지마켓: Sell List</title>
    
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css" type="text/css">

</head>

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

.sell-title{
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
    
<div class="sell-title">${sessionScope.memId}님의 판매내역</div>

<div class="main" style="padding-right: 100px; text-align:right;">
<input type="hidden" name="sellmemId" value="${sessionScope.memId}">
<input type="hidden" name="productNum" value="${sessionScope.productNum}">
 <button class="primary-btn" onclick="location.href='${pageContext.request.contextPath }//product/insertForm'" style="border: 0px;">판매하기</button>
<%-- <div>나의 매너온도: ${reviewDTO.revTotalscore}</div> --%>
<!-- 								${sessionScope.revTotalscore} -->
</div>

  <table  class="rwd-table">
         <tbody>
           <tr class="color_menu">
              <th>등록일</th>
               <th>이미지</th>
               <th>상품명</th>
               <th>금액</th>
               <th>상태</th>
               <th></th>
               <th></th>
           </tr>
         <c:forEach var="dto" items="${sellList}">
                <tr class="KOTRA-fontsize-90">
                   <td>${dto.productDate}</td> 
                   <td>
                   <c:forTokens items="${dto.productPic}" delims="|" var="p" end="0">
					<img src="${pageContext.request.contextPath }/resources/upload/${p}" width="100" height="100">
                   </c:forTokens>
                   </td>
                   <td>${dto.productTitle}</td>
                   <td>${dto.productPrice} 원</td>
                   <c:if test="${dto.productStatus eq '판매중'}">
                   <td style="color: red;">${dto.productStatus}</td>
                   </c:if>
                   <c:if test="${dto.productStatus eq '판매완료'}">
                    <td style="color: gray;">${dto.productStatus}</td>
                    </c:if>
                    <td style="text-align: center;">
                    <input class="site-btn" type="button" value="글수정"
					onclick="location.href='${pageContext.request.contextPath }/product/update?productNum=${dto.productNum}'"
					style="background-color:#8A2BE2;"></td>
                
                  <td style="text-align: center;">
                  <input class="site-btn" type="button" value="글삭제"
					onclick="location.href='${pageContext.request.contextPath }/product/delete?productNum=${dto.productNum}'"
					style="background-color:#8A2BE2;">
					</td> 
                </tr>
           </c:forEach>
        </tbody>
    </table>


<div style="text-align: center;"> 
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath }/list/selllist?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[10페이지 이전] </a>
</c:if>
 
<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath }/list/selllist?pageNum=${i}">[${i}]</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
<a href="${pageContext.request.contextPath }/list/selllist?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">[10페이지 다음] </a>
</c:if>
</div>

    <!-- Footer Section Begin -->
    <%@include file = "/resources/fragments/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="<c:url value ="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value ="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value ="/resources/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value ="/resources/js/jquery-ui.min.js"/>"></script>
    <script src="<c:url value ="/resources/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value ="/resources/js/mixitup.min.js"/>"></script>
    <script src="<c:url value ="/resources/js/owl.carousel.min.js"/>"></script>


<script type="text/javascript">

function  openPop() {
	var showReviewpopup = window.open(
		"${pageContext.request.contextPath}/review/showreview","거래후기","width=500,height=500,top=100,left=100");

}

</script>


</body>
</html>



