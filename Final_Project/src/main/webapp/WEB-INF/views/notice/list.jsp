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
    <title>가지마켓: Notice</title>

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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/notice/notice_list.css"	type="text/css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/basic.css">
</head>
<body>
<!-- Page Preloder -->
<!--     <div id="preloder"> -->
<!--         <div class="loader"></div> -->
<!--     </div> -->

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
                        <h2>공지사항</h2>
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

			<!-- <section class="notice"> -->
			<!-- 	<div class="page-title"> -->
			<!-- 		<div class="container"> -->
			<!-- 			<h3>공지사항</h3> -->
			<!-- 		</div> -->
			<!-- 	</div> -->

			<!-- board seach area -->
			<!-- 	<div id="board-search"> -->
			<!-- 		<div class="container"> -->
			<!-- 			<div class="search-window"> -->
			<!-- 				<form action=""> -->
			<!-- 					<div class="search-wrap"> -->
			<!-- 						<label for="search" class="blind">공지사항 내용 검색</label> -->
			<!-- 						 <input	id="search" type="search" name="" placeholder="검색어를 입력해주세요." value=""> -->
			<!-- 						<button type="submit" class="btn btn-dark">검색</button> -->
			<!-- 					</div> -->
			<!-- 				</form> -->
			<!-- 			</div> -->
			<!-- 		</div> -->
			<!-- 	</div> -->
			<!-- board list area -->
			<div id="board-list">
				<div class="container">

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
							<c:if test="${empty noticeList}">
								<tr>
									<td></td>
									<td></td>
									<td>등록된 글이 없습니다.</td>
									<td></td>
									<td></td>
								</tr>
							</c:if>
							<c:forEach var="dto" items="${noticeList }">
								<tr>
									<td>${dto.notiNum}</td>
									<td>관리자</td>
									<td><a
										href="${pageContext.request.contextPath }/notice/content?num=${dto.notiNum}">
											${dto.notiTitle}</a></td>
									<fmt:parseDate value="${dto.notiDate}" var="date"
										pattern="yyyy.MM.dd HH:mm" />
									<td><fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /></td>
									<%--     <td>${dto.noti_date}</td> --%>
									<td>${dto.notiReadcount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>


					<c:if test="${sessionScope.memId eq 'admin' }">

						<div id="page_write">
							<a href="${pageContext.request.contextPath }/notice/writeForm"
								class="write_btn">글쓰기</a><br>
						</div>
					</c:if>

					<div id="page_control">
						<c:if test="${pageDto.startPage > pageDto.pageBlock }">
							<a
								href="${pageContext.request.contextPath }/notice/list?pageNum=${pageDto.startPage - pageDto.pageBlock}">[10페이지
								이전] </a>
						</c:if>

						<c:forEach var="i" begin="${pageDto.startPage }"
							end="${pageDto.endPage }" step="1">
							<a
								href="${pageContext.request.contextPath }/notice/list?pageNum=${i}">${i}</a>
						</c:forEach>

						<c:if test="${pageDto.endPage < pageDto.pageCount}">
							<a
								href="${pageContext.request.contextPath }/notice/list?pageNum=${pageDto.startPage + pageDto.pageBlock}">[10페이지
								다음] </a>
						</c:if>

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