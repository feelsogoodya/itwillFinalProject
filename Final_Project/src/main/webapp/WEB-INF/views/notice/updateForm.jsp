<%@page import="com.itwillbs.domain.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/notice_updateForm.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/basic.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
<!-- 	<title>Notice</title> -->
</head>
<body data-spy="scroll" data-target="#navbar">
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
                        <h2>글수정</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
<div id="canvas-overlay"></div>
<div class="boxed-page">
<section id="gtco-menu" class="section-padding">
    <div class="container">
        <div class="section-content">
            <div class="row mb-5">
                <div class="col-md-12">
<!--                     <div class="heading-section text-center"> -->
<!-- 						<h2>NOTICE Update</h2> -->
<!-- 					</div> -->
					<div class="row mt-5">
					<%
//세션값 가져오기
String id=(String)session.getAttribute("memId");
if(id==null){
// 	response.sendRedirect("./BoardList.bo");
}
%>
<%-- 					<% --%>
<!-- // 					NoticeDTO dto=(NoticeDTO)request.getAttribute("dto"); -->
<%-- 					%> --%>
					<form action="${pageContext.request.contextPath }/notice/updatePro" method="post" enctype="multipart/form-data">
						<input type="hidden" name="notiNum" value="${dto.notiNum}">
						<table class="table">
							<tr><th>글쓴이</th>
							<td><input type="text" name="memId" value="관리자" readonly></td></tr>
							<tr><th>글제목</th>
							<td><input type="text" name="notiTitle" value="${dto.notiTitle}"></td></tr>
							<tr><th>글내용</th>
							<td><textarea name="notiContent" rows="10" cols="100">${dto.notiContent}</textarea></td></tr>
							<tr><td>첨부파일</td>
   							<td><input type="file" name="file"><br>
   							<input type="hidden" name="oldfile" value="${dto.notiImage}">
   							<input type="hidden" name="oldfile1" value="${dto.notiImage1}">
   							<input type="hidden" name="oldfile2" value="${dto.notiImage2}">
   							<input type="file" name="file1" ><br>
   							<input type="file" name="file2"><br></td></tr>   
						</table>
						<div class="text-right">
							<input type="submit" value="글수정" class="write_btn">
						</div>
					</form>
					</div>
      			</div>
            </div>
        </div>
    </div>
</section>
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




