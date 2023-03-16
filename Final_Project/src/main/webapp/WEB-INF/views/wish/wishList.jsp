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
    <title>가지마켓: Wish List</title>

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
                        <h2>관심 목록</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">마이페이지</a>
                            <span>관심 목록</span>
                        </div>
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
             	
             	<div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>상태</th>
                                    <th>관심수</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <c:if test="${empty wishMapList }">
                            	<tr>
                            		<td>
                                		<h5>관심있는 상품이 없습니다.</h5>
                                	</td>
                            	</tr>
                            </c:if>
                                
                            <c:forEach var="map" items="${wishMapList }">
                                <tr>
                                
                                    <td class="shoping__cart__item">
                                        <img src="${pageContext.request.contextPath }/resources/upload/${fn:split(map.productPic,'|')[0]}" alt="">
                                        <h5>${map.productTitle }</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${map.productPrice }
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <h5>${map.productGrade }</h5>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <h5>${map.wishCount }</h5>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </c:forEach>    
                            </tbody>
                        </table>
                    </div>
                </div>
             	
             	<!-- paging -->
                <div class="row col-lg-12">
                    <div class="col-lg-12" style="text-align: center;">
                        <div class="product__pagination blog__pagination">
                        	<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
                        		<a href="${pageContext.request.contextPath }/mypage/wish?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">
                        			<i class="fa fa-long-arrow-right"></i>
                        		</a>
                        	</c:if>
                        	
                        	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
                        		<a href="${pageContext.request.contextPath }/mypage/wish?pageNum=${i}">${i}</a>
                        	</c:forEach>
                        	
                        	<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
                        		<a href="${pageContext.request.contextPath }/mypage/wish?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">
                        			<i class="fa fa-long-arrow-right"></i>
                        		</a>
                        	</c:if>
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