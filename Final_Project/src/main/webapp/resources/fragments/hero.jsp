<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Hero Section Begin -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <!-- 카테고리 section -->
                        <ul>
                            <c:forEach var="item" items="${sessionScope.categories}">
	                            <li><a href="${pageContext.request.contextPath }/product/list?productCate=${item}">${item}</a></li>
	                        </c:forEach>
                        </ul>
                    </div>
                </div> 
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="${pageContext.request.contextPath}/product/list">
                                <input type="text" name="searchText" placeholder="어떤 상품을 찾으시나요?">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>051-803-0909</h5>
                                <span>평일 10-18시 상담가능</span>
                            </div>
                        </div>
                    </div>
                    <c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
                    <c:set var="truePath" value="/main/main" />
                    <c:if test="${path eq truePath}">
	                    <div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/hero/banner.png">
	                        <div class="hero__text">
	                            <!-- <span>가지마</span>
	                            <h2>가지마켓 <br />가지가지</h2>
	                            <p>중고마켓 어쩌구</p> -->
	                            <a href="${pageContext.request.contextPath }/product/details" class="primary-btn" style="position: relative; left: 200px; top: 150px;">바로가기</a>
	                        </div>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    <!-- Hero Section End -->
</body>
</html>