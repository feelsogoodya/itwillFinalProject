<%@page import="com.itwillbs.domain.NoticeDTO"%>
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
    <title>Ogani | Template</title>

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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/notice_content.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/basic.css">

 	<!-- Required meta tags -->
<!--     <meta charset="utf-8"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<title>Notice</title>
</head>
	<%
	String memId=(String)session.getAttribute("memId");
	%>
<body>

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
                        <h2>공지 내용</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    

<!-- <div id="canvas-overlay"></div> -->
    <div class="container">
        <div class="section-content">
            <div class="row mb-5">
                <div class="col-md-12">
					<div class="row mt-5">

					<table class="table">
						<colgroup>
                <col width="100px">
            </colgroup>
            <tbody>
                <tr class="article-title">
                    <th>제목</th>
                    <td colspan="3">${dto.notiTitle}</td>
                </tr>
                <tr class="article-info">
                    <th>글번호</th>
                    <td>${dto.notiNum}</td>
                    <th>날짜</th>
                    <td>${dto.notiDate}</td>
                    <th>조회수</th>
                    <td>${dto.notiReadcount}</td>
                </tr>
                <tr class="article-body">
                <th>글내용</th></tr><tr>
                   <td colspan="6" style="white-space:pre;">${dto.notiContent}</td>
                </tr>
                <tr><th>첨부파일</th>
                <td  colspan="6">
							<c:if test="${! empty dto.notiImage }">
							<img src="${pageContext.request.contextPath }/resources/upload/${dto.notiImage}">
							</c:if>
							<c:if test="${! empty dto.notiImage1 }">
							<img src="${pageContext.request.contextPath }/resources/upload/${dto.notiImage1}">
							</c:if>
							<c:if test="${! empty dto.notiImage2 }">
							<img src="${pageContext.request.contextPath }/resources/upload/${dto.notiImage2}">
							</c:if>
							
							</td></tr>
            </tbody>
					</table>
					

					<div class="text-right">
				
						<input type="button" value="글목록" class="write_btn"
						onclick="location.href='${pageContext.request.contextPath }/notice/list'">
						
						<c:if test="${sessionScope.memId == 'admin' }">
						<input type="button" value="글수정" class="write_btn"
						onclick="location.href='${pageContext.request.contextPath }/notice/update?notiNum=${dto.notiNum}'">
						<input type="button" value="글삭제" class="write_btn"
						onclick="location.href='${pageContext.request.contextPath }/notice/delete?notiNum=${dto.notiNum}'">
						</c:if>
						
			</div>		
					</div>
      			</div>
            </div>
        </div>
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