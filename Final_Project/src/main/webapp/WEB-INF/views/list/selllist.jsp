<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list/selllist.jsp</title>
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

.sell-title{
text-align: center;
font-size: 50px;
}
</style>
</head>


<body>
<div class="sell-title">${sessionScope.memberId}님의 판매내역</div>

<div class="main" style=" padding-left: 100px;">
<input type="hidden" name="sellmemId" value="${sessionScope.memberId}">
<a href="${pageContext.request.contextPath }/">메인페이지</a><br>
<a href="${pageContext.request.contextPath }/sell/판매페이지">판매하기</a><br>
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
           </tr>
         <c:forEach var="dto" items="${sellList}">
                 <tr class="KOTRA-fontsize-90">
                    <td>${dto.sellDate}</td> 
                    <td>${dto.prodPic}</td>
                    <td>${dto.prodName}</td>
                    <td>${dto.prodPrice}</td>
                     <td>${dto.prodStatus}</td>
                    <td>
                       <input type="hidden" name="sellmemId" value="${sessionScope.memberId}">
                    </td>
                 </tr>
           </c:forEach>
        </tbody>
    </table>



<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath }/list/selllist?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">[10페이지 이전] </a>
</c:if>
 
<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath }/list/selllist?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
<a href="${pageContext.request.contextPath }/list/selllist?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">[10페이지 다음] </a>
</c:if>






</body>
</html>



