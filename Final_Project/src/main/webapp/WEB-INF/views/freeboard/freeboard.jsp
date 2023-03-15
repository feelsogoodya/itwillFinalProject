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
    <title>가지마켓: Free Board</title>

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
                        <h2>자유게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
            	<!-- search -->
            	<div class="row col-lg-12">
                	<div class="col-lg-12">
                        <div class="col-lg-4 blog__sidebar__search float-right">
                            <form action="#">
                                <input type="text" name="search" placeholder="Search...">
                                <button type="submit" onclick="location.href='${pageContext.request.contextPath }'"><span class="icon_search"></span></button>
                            </form>
                        </div>
                	</div>
                </div>
             	<!-- search -->
             	
             	<!-- list -->
             	<table class="board-table">
            		<thead>
               			<tr>
		                  <th scope="col" class="th-num">글번호</th>
		                  <th scope="col" class="th-id">작성자</th>
		                  <th scope="col" class="th-title">글제목</th>
		                  <th scope="col" class="th-date">등록일</th>
		                  <th scope="col" class="th-readcount">조회수</th>
               			</tr>
            		</thead>
            		<tbody>
            			<c:if test="${empty boardList}">
            				<tr>
            					<td></td>
            					<td></td>
            					<td>등록된 글이 없습니다.</td>
            					<td></td>
            					<td></td>
            				</tr>
            			</c:if>
            			<c:if test="${!empty boardList}">
			               <c:forEach var="dto" items="${boardList}">
			                  <tr onclick="location.href='${pageContext.request.contextPath }/free/content?freeboardNum=${dto.freeboardNum}'">
			                     <th scope="col" class="th-num">${dto.freeboardNum}</th>
			                     <th scope="col" class="th-id">${dto.memberNick}</th>
			                     <th scope="col" class="th-title">${dto.subject}</th>
<%-- 			                     <th scope="col" class="th-date"><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd" /></th> --%>
								<th scope="col" class="th-date">${dto.date }</th>
			                     <%--     <td>${dto.noti_date}</td> --%>
			                     <th scope="col" class="th-readcount">${dto.readcount}</th>
			                  </tr>
			               </c:forEach>
		               </c:if>
           	 		</tbody>
         		</table>
             	<!-- list -->
             	
             	<!-- paging -->
                <div class="row col-lg-12">
                    <div class="col-lg-12" style="text-align: center;">
                        <div class="product__pagination blog__pagination">
                        	<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
                        		<a href="${pageContext.request.contextPath }/free/list?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">
                        			<i class="fa fa-long-arrow-right"></i>
                        		</a>
                        	</c:if>
                        	
                        	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
                        		<a href="${pageContext.request.contextPath }/free/list?pageNum=${i}">${i }</a>
                        	</c:forEach>
                        	
                        	<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
                        		<a href="${pageContext.request.contextPath }/free/list?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">
                        			<i class="fa fa-long-arrow-right"></i>
                        		</a>
                        	</c:if>
                        </div>
                        <div style="text-align: right;">
                        	<button type="submit" class="site-btn" onclick="location.href='${pageContext.request.contextPath }/free/wirte'">글쓰기</button>
                        </div>
                    </div>
                </div>
                <!-- paging -->
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

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