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
    <title>가지마켓: Free Board</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
    <style type="text/css">
    	tr{
   		    border-bottom: 1px solid #d8d8d8;
    		border-top: 1px solid #d8d8d8;
    	}
    	#comm {
    		width: 100%;
		    height: 46px;
		    font-size: 16px;
		    color: #6f6f6f;
		    padding-left: 15px;
		    border: 1px solid #e1e1e1;
		    border-radius: 20px;
		    margin-top: 10px;
		    margin-left: 10px;
    	}
    	
    </style>
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Form Begin -->
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
				                	<td colspan="6">${freeboardDTO.subject}</td>
				              	</tr>
				              	<tr class="article-info">
					                <th>글번호</th>
					                <td class="col-lg-3">${freeboardDTO.freeboardNum}</td>
					                <th>날짜</th>
					                <td class="col-lg-3">${freeboardDTO.date}</td>
					                <th>조회수</th>
					                <td class="col-lg-3">${freeboardDTO.readcount}</td>
				              	</tr>
				              	<tr class="article-body">
				              	<th>글내용</th>
				                 	<td colspan="6" style="white-space:pre; height: 300px">${freeboardDTO.content}</td>
				              	</tr>
			          		</tbody>
						</table>
						<c:if test="${sessionScope.memId eq freeboardDTO.memberId}">
		                    <div class="col-lg-12 col-md-12" style="text-align: right;">
		                     	<button type="button" class="site-btn" onclick="location.href='${pageContext.request.contextPath }/free/update?freeboardNum=${freeboardDTO.freeboardNum}'">글수정</button>
		              			<button type="button" class="site-btn" id="delete">글삭제</button>
		                 	</div>
			            </c:if>
			           	<div class="col-lg-12">
			           		<div class="shoping__checkout" style="text-align: left;">
			               		<h5>댓글</h5>
			               		<ul id="commList">
			               		</ul>
			           		</div>
			      		</div>
				             	<input type="text" id="comm" class="col-lg-10" placeholder="댓글을 입력하세요">
				             	<button type="button" class="site-btn" style="margin-left: 10px;" onclick="writeComm()">댓글쓰기</button>
             		</div>
            	</div>
        	</div>
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
    				if(data.length == 0) $('#commList').append("<li>" + "댓글이 없습니다." + "</li>");
    				else {
	    				$(data).each(function() {
	    					$('#commList').append("<li>" + this.memberNick + "<div class='far fa-trash-alt' value='" + this.commNum + "' id='deleteComm' style='font-size:24px; margin-left:5px;'></div><br>" + this.content + "</li>");
	    					if('${sessionScope.memNname}' !== this.memberNick){
	    						$('div[value=' + this.commNum + ']').hide();
	    					}
	    					$("[id=deleteComm]").off('click').on('click', function () {
	    						if(confirm('헤당 댓글을 삭제하시겠습니까?')){
		    						$.ajax({
		    							url : "${pageContext.request.contextPath}/free/deleteComm",
		    							type : "POST",
		    							data : {
		    								commNum : $(this).attr('value')
		    							},
		    							success : function () {
		    								alert("삭제했습니다.");
		    								getComm();
										}
		    						});
								
								}
							});
	    				});
    				}
    			}
    		});
		}
    	$("#delete").on('click', function(){
    		if(confirm("해당 글을 삭제하시겠습니까?")){
    			alert("삭제되었습니다.");
    			location.href="${pageContext.request.contextPath }/free/delete?freeboardNum=" + ${freeboardDTO.freeboardNum};
    		}
    	});
    	$("#comm").keyup(function(e){if(e.keyCode == 13)  writeComm(); });
    	getComm();
    </script>
</html>