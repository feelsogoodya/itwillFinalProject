<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="${pageContext.request.contextPath }/main/main"><img src="${pageContext.request.contextPath }/resources/img/marketLogo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
<!--             <div class="header__cart__price">item: <span>$150.00</span></div> -->
        </div>
        <div class="humberger__menu__widget">
<!--             <div class="header__top__right__language"> -->
<%--                 <img src="${pageContext.request.contextPath }/resources/img/language.png" alt=""> --%>
<!--                 <div>English</div> -->
<!--                 <span class="arrow_carrot-down"></span> -->
<!--                 <ul> -->
<!--                     <li><a href="#">Spanis</a></li> -->
<!--                     <li><a href="#">English</a></li> -->
<!--                 </ul> -->
<!--             </div> -->
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="${pageContext.request.contextPath }/main/main">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath }/free/list">Free</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
<!--         <div class="header__top__right__social"> -->
<!--             <a href="#"><i class="fa fa-facebook"></i></a> -->
<!--             <a href="#"><i class="fa fa-twitter"></i></a> -->
<!--             <a href="#"><i class="fa fa-linkedin"></i></a> -->
<!--             <a href="#"><i class="fa fa-pinterest-p"></i></a> -->
<!--         </div> -->
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>	
            </ul>
        </div>
    </div>
    <!-- Humberger End -->
   

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    
  <!-- Header Begin -->
  <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> gajimarket@secondhand.com</li>
                                <li>중고거래 편하고 쉽게 집에서 즐겨보세요</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                        
                        <!-- SNS 연결 로고 => 앱 버전 다운로드 링크 연결 예정 -->
<!--                             <div class="header__top__right__social"> -->
<!--                                 <a href="#"><i class="fa fa-facebook"></i></a> -->
<!--                                 <a href="#"><i class="fa fa-twitter"></i></a> -->
<!--                                 <a href="#"><i class="fa fa-linkedin"></i></a> -->
<!--                                 <a href="#"><i class="fa fa-pinterest-p"></i></a> -->
<!--                             </div> -->
                            
						<!-- 세션값이 없을 때, 로그인 / 있을 때, 닉네임 & 로그아웃 -->
						<c:if test="${empty sessionScope.memId}">
                            <div class="header__top__right__auth">
                                <a href="${pageContext.request.contextPath }/member/login"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </c:if>
                        <c:if test="${! empty sessionScope.memId}">
                        	<div class="header__top__right__auth">
                        		<a href="${pageContext.request.contextPath }/member/mypage">
                                <i class="fa fa-user"></i>${sessionScope.memId }님 로그인하셨습니다.</a>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="${pageContext.request.contextPath }/member/logout"><i class="fa fa-user"></i> Logout</a>
                            </div>
                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 메뉴 아래 연결 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="${pageContext.request.contextPath }/main/main">
                        <img src="${pageContext.request.contextPath }/resources/img/marketLogo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="${pageContext.request.contextPath }/main/main">Home</a></li>
                            
                            <li><a href="${pageContext.request.contextPath}/product/list">전체상품</a></li>
                            
                            <li><a href="${pageContext.request.contextPath }/free/list">자유게시판</a></li>
                            
                            <li><a href="${pageContext.request.contextPath }/notice/list">고객센터</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="${pageContext.request.contextPath }/notice/list">공지사항</a></li>
                                    <li><a href="${pageContext.request.contextPath }/customerservice/list">Q & A</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/member/mypage">마이페이지</a>
                            	<ul class="header__menu__dropdown">
                                    <li><a href="${pageContext.request.contextPath }/member/mypage">마이프로필</a></li>
                                    <li><a href="${pageContext.request.contextPath }/mypage/wish">관심상품</a></li>
                                    <li><a href="javascript:chatList();">채팅목록</a></li>
                                    <li><a href="./shoping-cart.html">판매내역</a></li>
                                    <li><a href="./checkout.html">구매내역</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-2">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <!-- 가격 -->
                        <!-- <div class="header__cart__price">item: <span>$150.00</span></div> -->
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
</head>
<body>
<script type="text/javascript">
	function chatList() {
		if('${sessionScope.memId}' === '') alert('로그인 후 사용할 수 있습니다.');
		else window.open('${pageContext.request.contextPath }/chat/list', 'chat', 'height=600, width=500, menubar=no, resizable=no, scrollbars=no, status=no, titlebar=no, toolbar=no');
	}
</script>
</body>
</html>