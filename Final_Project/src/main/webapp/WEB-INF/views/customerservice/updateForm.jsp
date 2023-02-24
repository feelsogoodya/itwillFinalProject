<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Cs_updateForm_nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Cs_updateForm_style.css" type="text/css">
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
	
	$("#file").on('change',function(e){
		  var formData = new FormData();
// 		  var inputFile = $('#file');
// 		  var files = inputFile[0].files;
			var files = e.target.files;
		  
// 		  console.log(files);
// 		  alert(console.log(files));
		  
		  
		  debugger;
// 		  formData.append('file', '아아아아아아ㅏ아아아아ㅏㅇ되라라라ㅏ');
// 		  formData.set('file', '111');
// 		  formData.append('file', files[1]);
		  
		  var allFiles ="";
		   for(var i = 0; i < files.length; i++){
// 			      formData.set('file', files[i]);
			      allFiles += files[i].name;
//			       formData.key =  files[i];

		   }


		//해당자리에 val값 바꾸기
		  $(".upload-name").val(allFiles);
// 		  alert("데이터가 있고 없음을 판단 "+formData.has(file));
// 		  alert("데이터 value 판단 "+formData.get.(file));
		  
		  
		  
		});

	
// 	$("#file").on('change',function(){
// 		  var fileName = $("#file").val();
// 		  alert(fileName);
// 		  $(".upload-name").val(fileName);
// 		});




	$('#file').on('change',function(){
        var $fileUpload = $("input[type='file']");
        if (parseInt($fileUpload.get(0).files.length)>3){
        alert("첨부파일 갯수를 초과 하셨습니다 (최대 3개)");
        $('.upload-name').val("첨부파일..");
        return false;
        }
    });	





//     $('#button1').click(function(){
//         var $fileUpload = $("input[type='file']");
//         if (parseInt($fileUpload.get(0).files.length)>3){
//         alert("첨부파일 갯수를 초과 하셨습니다 (최대 3개)");
//         return false;
//         }
//     });
    
    
	
		
	$('#button1').click(function() {
		var $fileUpload = $("input[type='file']");
		if (parseInt($fileUpload.get(0).files.length)<=3) {
			if (!confirm("정말로 수정 하시겠습니까?")) {
				return false;
			}
		}
	});
	
	
});
</script>
<script type="text/javascript">

</script>



<script type="text/javascript">
	function selectCategoryField() {
		var value = document.getElementById('categoryField').value;
		document.getElementById('categoryFieldHidden').value = value;
	}



	function check() {
		if (document.getElementById("categoryFieldHidden").value=="") {
			alert("카테고리를 선택해주세요")
			return false;
		}
		if (document.getElementById("cs_sub").value=="") {
			alert("제목을 입력하시오")
			document.getElementById("cs_sub").focus();
			return false;
		}
	}
</script>





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
                            <li><a href="./blog.html">Blog</a></li>
                            <li class="active"><a href="./contact.html">Contact</a></li>
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



    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Contact Us</h2>
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
                        <h2>Leave Message</h2>
                    </div>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/customerservice/UpdatePro" method="post" enctype="multipart/form-data" onsubmit="return check()">
            		<input type="hidden" name="memNname" value="${sessionScope.memNname }">
					<input type="hidden" name="memId" value="${sessionScope.memId }">
					<input type="hidden" id="categoryFieldHidden" name="csCategory" value="${dto.csCategory}">
					<input type="hidden" name="csProcess" value="접수대기">
            		
            		
            		<input type="hidden" name="csNum" value="${dto.csNum}">
                
                
                <div class="row">
                    <div class="col-lg-12 text-center category">
						<p>카테고리</p>
						<select id="categoryField" onchange="selectCategoryField()">
							<option value="">${dto.csCategory}</option>
							<option value="계정관리">계정관리</option>
							<option value="게시글">게시글</option>
							<option value="결제환불">결제환불</option>
						</select>
					</div>	
                   
                   
                    <div class="col-lg-12 text-center">
                        <input type="text" type="text" name="csSub" id="cs_sub" value="${dto.csSub}">
                        <div class="file_box">
	                        <input type="file" multiple="multiple" name="multiFile" class ="uploadfile" id="file" style="display:none;" >
	                        <label for="file">파일첨부</label>

							<c:set var="Vfiles" value="${dto.csFile0 +='高'+= dto.csFile1 +='高'+= dto.csFile2 }"/>
	                        <input type="text" class="upload-name" value="${fn:split(Vfiles, '高')[1] +=''+= fn:split(Vfiles, '高')[3] +=''+= fn:split(Vfiles, '高')[5] }" readonly="readonly" placeholder="첨부파일...">
	                        
                    	</div>
                    </div>
                    <div class="col-lg-12 text-center">
                    	<textarea name="csContent" rows="10" cols="20" placeholder="Your message">${dto.csContent}</textarea>
                    </div>
                    <div class="col-lg-12 text-center">
                     <c:if test="${dto.csSecret == 'N'}">
                     	<input type="checkbox" name="csSecret" value="Y" ><p>비밀글</p>
                     </c:if>
                     <c:if test="${dto.csSecret == 'Y'}">
                     	<input type="checkbox" name="csSecret" value="Y" checked ><p>비밀글</p>
                     </c:if>
                    	
                    </div>
                    <div class="col-lg-12 text-center">
                        <button type="submit" class="site-btn" id = "button1">Change</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->

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