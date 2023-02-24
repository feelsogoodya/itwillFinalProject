<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Cs_content_bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Cs_content_nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Cs_content_style.css" type="text/css">
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Cs_content.css" type="text/css">
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() { 
		
		$('.processChange').on('change',function() {
			
			var processFieldnum = this.value;

			if (processFieldnum == "접수대기") {
				processField = 1;
			};
			if (processFieldnum == "처리중") {
				processField = 2;
			};
			if (processFieldnum == "처리완료") {
				processField = 3;
			};
// 			var processField = this.value;

			alert(this.value+"으로 변경되었습니다.");
			
			$.ajax( {
				url:'${pageContext.request.contextPath}/customerservice/processChange', //가상주소
				data:{'processField': processField, //데이터
							'Cs_num': $('.Cs_num').val()
					 },
				success: function(rdata){ // 성공적으로 출력결과 가져오면 => 화면에 출력  //       function(결과를 받는 변수)
// 					alert(processField);
				}
			});
			
		});
		
		
		$('.Dconfirm').click(function() {
			if (!confirm("삭제 하시겠습니까?")) {
				return false;
			}
		});
		
		
		// 댓글 첨부파일
		$("#file").on('change',function(e){
			  var files = e.target.files;
			  
			  var allFiles ="";
			  for(var i = 0; i < files.length; i++){
				      allFiles += files[i].name;

			   }
			//해당자리에 val값 바꾸기
			  $(".upload-name").val(allFiles);
		});
		
		// 첨부파일 3개 넘었을경우
		$('.uploadfile').on('change',function(){
	        var $fileUpload = $("input[type='file']");
	        if (parseInt($fileUpload.get(0).files.length)>3){
	        alert("첨부파일 갯수를 초과 하셨습니다 (최대 3개)");
	        $('.upload-name').val("첨부파일..");
	        return false;
	        }
	    });		
		
		
//-------------------------------------------------------------
		
		// 대댓글 첨부파일
		$('.reuploadfile').on('change',function(e){
			let refile = this.id.replace("reuploadfile","").toLowerCase();
// 			alert(refile);
			
			
			var files = e.target.files;
			var allFiles ="";
		  	for(var i = 0; i < files.length; i++){
			      allFiles += files[i].name;
		   	}	
	  		$('.'+ refile).val(allFiles);
		  	
		});
		
		// 첨부파일 3개 넘었을경우
		$('.reuploadfile').on('change',function(){
			let refile = this.id.replace("reuploadfile","").toLowerCase();

	        var $fileUpload1 = $('.reuploadfile');
	        if (parseInt($fileUpload1.get(0).files.length)>3){
	        alert("첨부파일 갯수를 초과 하셨습니다 (최대 3개)");
	        
	        
	        $('.'+ refile).val("첨부파일..");
	        return false;
	        }
	    });
		
		
		$('.save').click(function() {
			if (!confirm("로그인 후 작성이 가능합니다. 로그인하시겠습니까?")) {
				return false;
			} else {
				 location.href="<c:url value='/member/login' />";
			}
		});
		

		
		
//         $( '.movesave' ).click( function() {
//             $( '.movewirteplace' ).scrollTop( 50 );
//           } );

		
		
		
	});
</script>
<script type="text/javascript">

	function check() {
		if (document.getElementById("cs_com_content").value=="") {
			alert("글을 작성하지 않으셨습니다.")
			document.getElementById("cs_com_content").focus();
			return false;
		}
	}
	
	function check1(this_) {
// 		let input = $(this_).children()[2];
		let input = $(this_).children('#cs_com_content');
// 		alert(input);

		if(input.val() == ''){
			alert("글을 작성하지 않으셨습니다.")
// 			document.getElementById(input).focus();
			return false;
		}
// 		$('.cs_com_com_content')
// 		let refile = this.id.replace("cs_com_com_contentT","").toLowerCase();
// 		if (document.getElementsByClassName("refile").value=="") {
// 			alert("글을 작성하지 않으셨습니다.")
// 			document.getElementById("cs_com_content").focus();
// 			return false;
// 		}
	}

</script>




<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a><br>


<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="${pageContext.request.contextPath }/resources/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="${pageContext.request.contextPath }/resources/img/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.html">Home</a></li>
                            <li><a href="./shop-grid.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li class="active"><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Blog Details Hero Begin -->
    <section class="blog-details-hero set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/blog/details/details-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>${dto.csSub}</h2>
                        <ul>
                            <li>${dto.memNname }</li>
                            <fmt:parseDate value="${dto.csDate}" var="Udate" pattern="yyyy.MM.dd HH:mm" />
                            <li><fmt:formatDate value="${Udate}" pattern="yyyy-MM-dd HH:mm" /></li>
                            <li>${dto.csReadcount} readcount</li>  <!-- 조회수 -->
                            <li>${pageDto.count} Comments</li> <!-- 댓글수  -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                <li><a href="#">All</a></li>
                                <li><a href="#">Beauty (20)</a></li>
                                <li><a href="#">Food (5)</a></li>
                                <li><a href="#">Life Style (9)</a></li>
                                <li><a href="#">Travel (10)</a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Recent News</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath }/resources/img/blog/sidebar/sr-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath }/resources/img/blog/sidebar/sr-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath }/resources/img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Search By</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="#">Apple</a>
                                <a href="#">Beauty</a>
                                <a href="#">Vegetables</a>
                                <a href="#">Fruit</a>
                                <a href="#">Healthy Food</a>
                                <a href="#">Lifestyle</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
	                    <input type="hidden" id="processFieldHidden"  value="${dto.csProcess }">
						<input type="hidden" class="Cs_num"  value="${dto.csNum }">
                        <img src="${pageContext.request.contextPath }/resources/customerservice/upload/${dto.csFile0}" alt="">
                        <img src="${pageContext.request.contextPath }/resources/customerservice/upload/${dto.csFile1}" alt="">
                        <img src="${pageContext.request.contextPath }/resources/customerservice/upload/${dto.csFile2}" alt="">
                        <p>${dto.csContent}</p>
<!--                         <h3>The corner window forms a place within a place that is a resting point within the large -->
<!--                             space.</h3> -->
<!--                         <p>The study area is located at the back with a view of the vast nature. Together with the other -->
<!--                             buildings, a congruent story has been managed in which the whole has a reinforcing effect on -->
<!--                             the components. The use of materials seeks connection to the main house, the adjacent -->
<!--                             stables</p> -->
                    </div>
                    
                   	<div class="button">
						<c:if test="${sessionScope.memId eq dto.memId || sessionScope.memId eq 'admin' }">
							<a href="${pageContext.request.contextPath }/customerservice/update?num=${dto.csNum}">글수정</a>
							<a class="Dconfirm" href="${pageContext.request.contextPath }/customerservice/delete?num=${dto.csNum}">글삭제</a>
<!-- 								<input type="button" value="글수정"  -->
<%-- 								onclick="location.href='${pageContext.request.contextPath }/customerservice/update?num=${dto.cs_num}'"> --%>
<!-- 								<input type="button" value="글삭제" class="deleteconform" -->
<%-- 								onclick="location.href='${pageContext.request.contextPath }/customerservice/delete?num=${dto.cs_num}'"> --%>
						</c:if>
							<a href="${pageContext.request.contextPath }/customerservice/list">글목록</a>
<!-- 								<input type="button" value="글목록"  -->
<%-- 								onclick="location.href='${pageContext.request.contextPath }/customerservice/list'"> --%>
					</div>
                    
                    
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__pic">
                                        <img src="${pageContext.request.contextPath }/resources/img/blog/details/details-author.jpg" alt="">
                                    </div>
                                    <div class="blog__details__author__text">
                                        <h6>${dto.memNname}</h6>
                                        <span>사용자</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="blog__details__widget">
                                    <ul>
                                        <li><span>유형</span> ${dto.csCategory}</li>
                                        <li><span>처리상태</span>
	                                         <c:choose>
													<c:when test="${sessionScope.memId eq 'admin'}">
															<select id="processField" class="processChange"  onchange="processField()">
																<option value="현재" >${dto.csProcess}</option>
																<option value="접수대기" >접수대기</option>
																<option value="처리중">처리중</option>
																<option value="처리완료">처리완료</option>
															</select>
													</c:when>
													<c:otherwise>
														${dto.csProcess}
													</c:otherwise>
											</c:choose>
                                        </li>
<!--                                         <li><span>Tags:</span> All, Trending, Cooking, Healthy Food, Life Style</li> -->
                                        
                                    </ul>
                                    <div class="blog__details__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                        <a href="#"><i class="fa fa-linkedin"></i></a>
                                        <a href="#"><i class="fa fa-envelope"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->



	
	
	
	
<%-- 	댓글${pageDto.count}개 --%>
<!-- 	<section class="blog spad"> -->
        <div class="container">
            <div class="row2">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
<!-- 글작성 -->
	<div class="blog__sidebar__search movewirteplace">
		<form action="${pageContext.request.contextPath }/customerservice/cs_comwritepro" method="POST" enctype="multipart/form-data" onsubmit="return check()">
		<input type="hidden" name="num" value="${dto.csNum}">
		<input type="hidden" name="csComNum1" value="${csComNum1}">
		
		<input type="text" name="csComContent" id="cs_com_content" placeholder="댓글입력...">
		
			<input type="file" multiple="multiple" name="multiFile" class ="uploadfile" id="file" style="display:none;" >
		    <div class="file_sec">
			    <label for="file">파일첨부</label>
				<c:set var="Vfiles" value=""/>
			    <input type="text" class="upload-name upload_input" value="첨부파일.." readonly="readonly">
	    	</div>
	    <c:choose>
	    	<c:when test="${sessionScope.memId eq null }">
	    		<button type="button" class="save"  ><span>저장</span></button>
	    	</c:when>
	    	<c:otherwise>
	    		<button type="submit" class="movesave"><span>저장</span></button> 
	    	</c:otherwise>
	    </c:choose>
		
		</form>
	</div>
<!-- 글작성 끝 -->



<!-- 댓글 시작 -->
<c:set var="count" value="1" />
<c:forEach var="dto" items="${cs_comList}">
<c:if test="${dto.csComNum2 == 0 }">
<div id="commentWrap">
	<div class="profile">
		<div class="my-img">
			<img src="${pageContext.request.contextPath}/resources/customerservice/img/Cs_PFP.png" width="70px">
		</div>
	</div>
	<div class="comment-cont">
		<div class="cmt-info">
			<span>${dto.memId}</span>
			<span class="cmt-time">${dto.csComDate}</span>
		</div>
		<div class="cmt-cont">
			${dto.csComContent}
		</div>
		<div>
			<c:set var="Vfiles" value="${dto.csComFile0 +='高'+= dto.csComFile1 +='高'+= dto.csComFile2 }"/>
			    <a href="${pageContext.request.contextPath }/customerservice/fileDown?filename=${dto.csComFile0}">
			        ${fn:split(Vfiles, '高')[1]}
			    </a><br>
			    <a href="${pageContext.request.contextPath }/customerservice/fileDown?filename=${dto.csComFile1}">
			        ${fn:split(Vfiles, '高')[3]}
			    </a><br>
			    <a href="${pageContext.request.contextPath }/customerservice/fileDown?filename=${dto.csComFile2}">
			        ${fn:split(Vfiles, '高')[5]}
			    </a>
		</div>
		<div class="cmt-btn">
			<input type="checkbox" id="reCmtBtn${count}" style="display: none;">
			<label for="reCmtBtn${count}">답글달기</label>
<!-- 				<button>댓글달기</button> -->
			<c:if test="${sessionScope.memId eq dto.memId || sessionScope.memId eq 'admin'}">
					<input type="button" value="삭제"
					onclick="location.href='${pageContext.request.contextPath }/customerservice/cs_comdelete?csComNum1=${dto.csComNum1}&num=${dto.csNum}'" >
			</c:if>
			<div class="re-cmt">
			<div class="blog__sidebar__search">
				<form action="${pageContext.request.contextPath }/customerservice/CsComComwritepro" method="POST" id="test" enctype="multipart/form-data" onsubmit="return check1(this)">
					<input type="hidden" name=num value="${dto.csNum}">
					<input type="hidden" name=csComNum1  value="${dto.csComNum1}">
					<input type="text" class="cs_com_com_content cs_com_com_contentTcs_com_com_content${count} cs_com_com_content${count} " name="csComContent" id="cs_com_content" placeholder="댓글입력...">
					    <div class="file_sec">
						<input type="file" multiple="multiple" name="multiFile" class ="reuploadfile uploadfile1" id="reuploadfilefile${count}" style="display:none;" >
					    <label for="reuploadfilefile${count}">파일첨부</label>
						<c:set var="Vfiles" value=""/>
						<input type="text" class="file${count}" value="첨부파일.." readonly="readonly">
						</div>

					    <c:choose>
					    	<c:when test="${sessionScope.memId eq null}">
					    		<input type="button" class="save submit_btn" value="등록">
					    	</c:when>
					    	<c:otherwise>
					    		<input type="submit" class="submit_btn" value="등록">
				    		</c:otherwise>
				    	</c:choose>
<!-- 					<input type="submit" value="등록"> -->
				</form>
			</div>
			</div>
		</div>
		<c:if test="${dto.csYn eq 'Y'}">
		<div class="cmt-re">
			<details><!-- 답글영역 시작 -->
				<summary><span>답글보기</span></summary>
<%-- 				<c:if test="${dto.cs_yn eq 'N'}"> --%>
<!-- 				<p>답글이 없습니다.</p> -->
<%-- 				</c:if> --%>
				
				
					<c:forEach var="inner" items="${cs_comList}">
					<c:if test="${inner.csComNum2 != 0 && dto.csComNum1 == inner.csComNum1 }">
					<div>
						<div id="commentWrap">
							<div class="profile">
								<div class="my-img">
									<img src="${pageContext.request.contextPath}/resources/customerservice/img/Cs_PFP.png" width="70px">
								</div>
							</div>
							<div class="comment-cont">
								<div class="cmt-info">
									<span>${inner.memId}</span>
									<span class="cmt-time">${inner.csComDate}</span>
								</div>
								<div class="cmt-cont">
									<p>${inner.csComContent}</p>
								</div>
								<div>
									<c:set var="Vfiles" value="${inner.csComFile0 +='高'+= inner.csComFile1 +='高'+= inner.csComFile2 }"/>
									    <a href="${pageContext.request.contextPath }/customerservice/fileDown?filename=${inner.csComFile0}">
									        ${fn:split(Vfiles, '高')[1]}
									    </a><br>
									    <a href="${pageContext.request.contextPath }/customerservice/fileDown?filename=${inner.csComFile1}">
									        ${fn:split(Vfiles, '高')[3]}
									    </a><br>
									    <a href="${pageContext.request.contextPath }/customerservice/fileDown?filename=${inner.csComFile2}">
									        ${fn:split(Vfiles, '高')[5]}
									    </a>
								</div>
								<div class="cmt-btn">
									<input type="button" value="삭제"
									onclick="location.href='${pageContext.request.contextPath }/customerservice/CsComCommdelete?csComNum2=${inner.csComNum2}&csComNum1=${inner.csComNum1}&num=${dto.csNum}'" >
								</div>
							</div>
						</div>
					</div>
					</c:if>
					</c:forEach>
				
			</details><!-- 답글 영역 끝 -->
		</div>
		</c:if>
	</div>
</div>
</c:if>
<c:set var="count" value="${count + 1}"/>
</c:forEach>	
<!-- 댓글 끝 -->




<!-- 댓글페이지 이동  -->
<div class="col-lg-12">
    <div class="product__pagination blog__pagination">
		<c:if test="${pageDto.startPage > pageDto.pageBlock }">
			<a href="${pageContext.request.contextPath }/customerservice/content?pageNum=${pageDto.startPage - pageDto.pageBlock}&num=${dto.csNum}">≤</a>
		</c:if>
		<c:if test="${pageDto.startPage <= pageDto.pageBlock }">
			<a href="#">≤</a>
		</c:if>
	
	
	
	
	<!-- // 이전 currentPage-1 -->
		<c:if test="${pageDto.currentPage > 1 }">
			<a href="${pageContext.request.contextPath }/customerservice/content?pageNum=${pageDto.currentPage-1 }&num=${dto.csNum}">< </a>
		</c:if>
		<c:if test="${pageDto.currentPage <= 1 }">
			<a href="#">< </a>
		</c:if>
	
	
	
		<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
			<a href="${pageContext.request.contextPath }/customerservice/content?pageNum=${i}&num=${dto.csNum}">${i}</a> 
		</c:forEach>
	
	
	
	
	
	
	<!-- // 다음 currentPage+1 -->
		<c:if test="${pageDto.currentPage < pageDto.pageCount}">	
			<a href="${pageContext.request.contextPath }/customerservice/content?pageNum=${pageDto.currentPage +1 }&num=${dto.csNum}">></a>
		</c:if>	
		<c:if test="${pageDto.currentPage >= pageDto.pageCount}">	
			<a href="#">></a>
		</c:if>
	
	
	
	<!-- //10페이지 다음  -->
		<c:if test="${pageDto.endPage < pageDto.pageCount}">	
			<a href="${pageContext.request.contextPath }/customerservice/content?pageNum=${pageDto.startPage +  pageDto.pageBlock}&num=${dto.csNum}">≥ </a>
		</c:if>	
		<c:if test="${pageDto.endPage >= pageDto.pageCount}">	
			<a href="#">≥</a>
		</c:if>	


		</div>
		
		</div>
		</div>
		
		</div>
		
		
	</div>
</div>
	
	 </section>
	


   

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="${pageContext.request.contextPath }/resources/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
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