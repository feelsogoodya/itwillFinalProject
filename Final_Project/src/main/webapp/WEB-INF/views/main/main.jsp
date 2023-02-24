<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>가지마켓?</title>

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
   	<jsp:include page="../../../resources/fragments/hero.jsp">
   		<jsp:param name="categories" value="${categories}" />
   	</jsp:include>
    <!-- Hero Section End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>조회순</h4>
                        <!-- 조회순 -->
                        <div class="latest-product__slider owl-carousel">
                            <c:forEach var="ProductDTO" items="${orderViews }" varStatus="status">
	                        	<c:if test="${status.index % 3 eq 0 }">
	                        		<div class="latest-prdouct__slider__item">
	                        	</c:if>
                        			<a href="#" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-1.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>${status.count}. ${ProductDTO.productTitle }</h6>
	                                        <span>${ProductDTO.productPrice }</span>
	                                    </div>
	                                </a>
		                         <c:if test="${status.index % 3 eq 2 }"></div></c:if>
		                   	</c:forEach>
		                   </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>관심순</h4>
                        <!-- 관심순 -->
                        <div class="latest-product__slider owl-carousel">
	                            <c:forEach var="ProductDTO" items="${wishList }" varStatus="status">
		                        	<c:if test="${status.index % 3 eq 0 }">
		                        		<div class="latest-prdouct__slider__item">
		                        	</c:if>
	                        			<a href="#" class="latest-product__item">
		                                    <div class="latest-product__item__pic">
		                                        <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-1.jpg" alt="">
		                                    </div>
		                                    <div class="latest-product__item__text">
		                                        <h6>${status.count}. ${ProductDTO.productTitle }</h6>
		                                        <span>${ProductDTO.productPrice }</span>
		                                    </div>
		                                </a>
			                         <c:if test="${status.index % 3 eq 2 }"></div></c:if>
			                   </c:forEach>
                          </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>최신순</h4>
                        <!-- 최근 등록된 상품 -->
                        <div class="latest-product__slider owl-carousel">
                        
	                        <c:forEach var="ProductDTO" items="${latestPrdList }" varStatus="status">
	                        	<c:if test="${status.index % 3 eq 0 }">
	                        		<div class="latest-prdouct__slider__item">
	                        	</c:if>
                        			<a href="#" class="latest-product__item">
	                                    <div class="latest-product__item__pic">
	                                        <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-1.jpg" alt="">
	                                    </div>
	                                    <div class="latest-product__item__text">
	                                        <h6>${status.count}. ${ProductDTO.productTitle }</h6>
	                                        <span>${ProductDTO.productPrice }</span>
	                                    </div>
	                                </a>
		                         <c:if test="${status.index % 3 eq 2 }"></div></c:if>
		                   </c:forEach>
	                  </div>
                  </div>
              </div>
          </div>
       </div>
    </section>
    <!-- Latest Product Section End -->
    
    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="${pageContext.request.contextPath }/resources/img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="${pageContext.request.contextPath }/resources/img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>From The Blog</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${pageContext.request.contextPath }/resources/img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${pageContext.request.contextPath }/resources/img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${pageContext.request.contextPath }/resources/img/blog/blog-3.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Visit the clean farm in the US</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

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
    <script src="<c:url value ="/resources/js/main.js"/>"></script>



</body>

</html>