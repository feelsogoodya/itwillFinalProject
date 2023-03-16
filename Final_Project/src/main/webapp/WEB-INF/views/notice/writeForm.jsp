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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/notice_content.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/basic.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
	<title>Notice</title>
</head>

<body data-spy="scroll" data-target="#navbar">

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
                        <h2>글쓰기</h2>
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
<!--                         <h2>글작성</h2> -->
<!--                       <br> -->
<!--                     <br> -->
<!--                     <br> -->
<!-- 						<h2>NOTICE</h2> -->
<!-- 					</div> -->
					<div class="row mt-5">
					<%
					String memId=(String)session.getAttribute("memId");
					
					%>

					<form action="${pageContext.request.contextPath }/notice/writePro" method="post" enctype="multipart/form-data">
						<table class="table">
							<tr><th>작성자</th>
							<td><input type="text" name="memId" value="${sessionScope.memId }" readonly></td></tr>
							<tr><th>글제목</th>
							<td><input type="text" name="notiTitle"></td></tr>
							<tr><th>글내용</th>
							<td><textarea name="notiContent" rows="10" cols="100"></textarea></td></tr>
							<tr><td>첨부파일</td>
   							<td><input type="file" name="file">
   							<input type="file" name="file1">
   							<input type="file" name="file2"></td></tr>   
						</table>
						<div class="text-right">
							<input type="submit" value="글쓰기" class="write_btn">
							<!-- class="btn btn-success btn-shadow btn-le" -->
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
</body>
</html>
