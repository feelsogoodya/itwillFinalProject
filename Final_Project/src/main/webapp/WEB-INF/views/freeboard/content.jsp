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
                        <h2>글내용</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Contact Us</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>글내용</h2>
                    </div>
                </div>
            </div>
            <form method="get">
                <div class="row">
                	<div class="col-lg-12 col-md-12">
                        <input type="text" name="subject" value="${freeboardDTO.subject }" readonly>
                    </div>
                	<div class="col-lg-12 col-md-12">
                        <input type="text" value="${freeboardDTO.memberNick }" readonly>
                    </div>
                    <div class="col-lg-12 col-md-12">
                        <input type="text" value="${freeboardDTO.date }" readonly>
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea name="content" readonly>${freeboardDTO.content }</textarea>
                        <c:if test="${sessionScope.memId eq freeboardDTO.memberId}">
	                        <div class="col-lg-12 col-md-12" style="text-align: right;">
	                        	<button type="button" class="site-btn" onclick="location.href='${pageContext.request.contextPath }/free/update?freeboardNum=${freeboardDTO.freeboardNum}'">글수정</button>
	                       		<button type="button" class="site-btn" onclick="location.href='${pageContext.request.contextPath }/free/delete?freeboardNum=${freeboardDTO.freeboardNum}'">글삭제</button>
	                    	</div>
                    	</c:if>
                    	<div class="col-lg-12">
                    		<div class="shoping__checkout" style="text-align: left;">
                        		<h5>댓글</h5>
                        		<ul id="commList">
                        		</ul>
                    		</div>
               			</div>
               			<div class="col-lg-12">
	                    	<input type="text" id="comm" placeholder="댓글을 입력하세요">
	                    	<button type="button" class="site-btn" onclick="writeComm()">댓글쓰기</button>
                    	</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->

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
    <script type="text/javascript">
    
    	function writeComm() {
    		if('${sessionScope.memId}' === '') alert("로그인 후 이용할 수 있습니다.");
    		else if($('#comm').val() === '') alert("댓글내용을 입력해주세요.");
    		else {
	    		$.ajax({
	    			url : "${pageContext.request.contextPath}/free/incomm",
	    			type : "POST",
	    			data : {
	    				freeboardNum : '${freeboardDTO.freeboardNum }',
	    				memberId : '${sessionScope.memId}',
	    				content: $('#comm').val()
	    			},
	    			success : function() {
	    				$('#comm').val('');
	    				getComm();
	    			}
	    		});
			}
    	}
    	function getComm() {
    		$.ajax({
    			url : "${pageContext.request.contextPath}/free/comm",
    			type : "POST",
    			data : {
    				freeboardNum : '${freeboardDTO.freeboardNum }'
    			},
    			success : function(data) {
    				$('#commList').empty();
    				if(data == null) $('#commList').append("<li>" + "댓글이 없습니다." + "</li>");
    				else {
	    				$(data).each(function() {
	    					$('#commList').append("<li>" + this.memberNick + "<br>" + this.content + "</li>");
	    				});
    				}
    			}
    		});
		}
    	$("#comm").keyup(function(e){if(e.keyCode == 13)  writeComm(); });
    	getComm();
    </script>
</html>