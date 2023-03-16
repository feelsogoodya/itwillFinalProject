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
    <title>가지마켓: Customer Service</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Cs_list_style.css" type="text/css">
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.boardwrite').click(function() {
		if (!confirm("로그인 후 작성이 가능합니다. 로그인하시겠습니까?")) {
			return false;
		} else {
			 location.href="<c:url value='/member/login' />";
		}
	});
	
});


</script>



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
                        <h2>고객센터</h2>
<!--                         <div class="breadcrumb__option"> -->
<!--                             <a href="./index.html">Home</a> -->
<!--                             <span>고객센터</span> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div >
                <div>
                    <div>
                    			<!--  검색시작  -->
                        <div class="blog__sidebar__search ">
                            <form action="${pageContext.request.contextPath }/customerservice/list">
                                <input class="search_input" type="text" placeholder="검색" name="searchText" maxlength="100" value="${pageDto.searchText}">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                    </div><!--  검색끝  -->
                </div>
               							
               							
                <div>
                    <div class="row">
                    
                    
                    
                    	<c:forEach var="dto" items="${boardList }">
                        <div class="col-lg-3 col-md-6 col-sm-6"	>
                            <div class="blog__item">
                                <div class="blog__item__pic">
<%--                                     <img src="${pageContext.request.contextPath }/resources/img/blog/blog-2.jpg" alt=""> --%>
                                </div>
                                <div class="blog__item__text">
                                    <ul>

                                    	<fmt:parseDate value="${dto.csDate}" var="Udate" pattern="yyyy.MM.dd HH:mm" />
                                        <li><i class="fa fa-calendar-o"></i><fmt:formatDate value="${Udate}" pattern="yyyy-MM-dd" /></li>
                                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
											  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
											  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
											</svg> ${dto.csReadcount}</li>
										<li>${dto.csCategory}</li>
										
										<c:if test="${dto.csProcess == '접수대기'}">
                                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
											  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
											</svg>
											${dto.csProcess}
										</li>
										</c:if>
										<c:if test="${dto.csProcess == '처리중'}">
                                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-exclamation" viewBox="0 0 16 16">
											  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
											  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1.5a.5.5 0 0 1-1 0V11a.5.5 0 0 1 1 0Zm0 3a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Z"/>
											</svg>
											${dto.csProcess}
										</li>
										</c:if>
										<c:if test="${dto.csProcess == '처리완료'}">
                                        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-check" viewBox="0 0 16 16">
												  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
												  <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-1.993-1.679a.5.5 0 0 0-.686.172l-1.17 1.95-.547-.547a.5.5 0 0 0-.708.708l.774.773a.75.75 0 0 0 1.174-.144l1.335-2.226a.5.5 0 0 0-.172-.686Z"/>
											</svg>
											
											
										
											${dto.csProcess}
										</li>
										</c:if>

                                        
                                    </ul>
                                    
                                     <c:choose>
	    								<c:when test="${dto.csSecret ne 'Y' || sessionScope.memId eq dto.memId || sessionScope.memId eq 'admin'}">
                                    		<h5><a class="sub_hide" href="${pageContext.request.contextPath }/customerservice/content?num=${dto.csNum} ">${dto.csSub}</a></h5>
                                    		<p>${dto.csContent}</p>
                                    	</c:when> 
										<c:otherwise>
												<h5><a>비밀글입니다.</a></h5>
												<p>비밀글......</p>
										</c:otherwise> 
									</c:choose>
									<ul>
									<c:choose>
                                    	<c:when test="${sessionScope.memId ne 'admin'}">
										    <li>${fn:substring(dto.memNname,0,1)}OO</li>
								    	</c:when> 
										<c:otherwise>
											<li>${fn:substring(dto.memNname,0,5)}</li>
										</c:otherwise>
									</c:choose> 
									</ul>
									<c:choose>
										<c:when test="${dto.csSecret ne 'Y' || sessionScope.memId eq dto.memId || sessionScope.memId eq 'admin'}">
	                                    	<a href="${pageContext.request.contextPath }/customerservice/content?num=${dto.csNum}" class="blog__btn">더보기 <span class="arrow_right"></span></a>
										</c:when> 
                                		<c:otherwise>
                                			<a class="blog__btn">더보기 <span class="arrow_right"></span></a>
                                		</c:otherwise> 
                                	</c:choose>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                        
                        
                        
                        
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
								<c:if test="${pageDto.searchText eq null}">
									<c:if test="${pageDto.startPage > pageDto.pageBlock }">
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${pageDto.startPage - pageDto.pageBlock}">≤</a>
									</c:if>
									<c:if test="${pageDto.startPage <= pageDto.pageBlock }">
										<a href="#">≤</a>
									</c:if>
								</c:if>
								<c:if test="${pageDto.searchText ne null}">
									<c:if test="${pageDto.startPage > pageDto.pageBlock }">
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${pageDto.startPage - pageDto.pageBlock}&searchText=${pageDto.searchText}">≤</a>
									</c:if>
									<c:if test="${pageDto.startPage <= pageDto.pageBlock }">
										<a href="#">≤</a>
									</c:if>
								</c:if>
								
								
								
								<!-- // 이전 currentPage-1 -->
								<c:if test="${pageDto.searchText eq null}">
									<c:if test="${pageDto.currentPage > 1 }">
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${pageDto.currentPage-1 }">< </a>
									</c:if>
									<c:if test="${pageDto.currentPage <= 1 }">
										<a href="#">< </a>
									</c:if>
								</c:if>
								<c:if test="${pageDto.searchText ne null}">
									<c:if test="${pageDto.currentPage > 1 }">
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${pageDto.currentPage-1 }&searchText=${pageDto.searchText}">< </a>
									</c:if>
									<c:if test="${pageDto.currentPage <= 1 }">
										<a href="#">< </a>
									</c:if>
								</c:if>
								
								
								<c:if test="${pageDto.searchText eq null}">
									<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${i}">${i}</a> 
									</c:forEach>
								</c:if>
								<c:if test="${pageDto.searchText ne null}">
									<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${i}&searchText=${pageDto.searchText}">${i}</a> 
									</c:forEach>
								</c:if>
								
								
								
								
								<!-- // 다음 currentPage+1 -->
								<c:if test="${pageDto.searchText eq null}">
									<c:if test="${pageDto.currentPage < pageDto.pageCount}">	
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${pageDto.currentPage +1 }">></a>
									</c:if>	
									<c:if test="${pageDto.currentPage >= pageDto.pageCount}">	
										<a href="#">></a>
									</c:if>
								</c:if>
								<c:if test="${pageDto.searchText ne null}">
									<c:if test="${pageDto.currentPage < pageDto.pageCount}">	
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${pageDto.currentPage +1 }&searchText=${pageDto.searchText}">></a>
									</c:if>	
									<c:if test="${pageDto.currentPage >= pageDto.pageCount}">	
										<a href="#">></a>
									</c:if>
								</c:if>
								
								
								<!-- //10페이지 다음  -->
								<c:if test="${pageDto.searchText eq null}">
									<c:if test="${pageDto.endPage < pageDto.pageCount}">	
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${pageDto.startPage +  pageDto.pageBlock}">≥ </a>
									</c:if>	
									<c:if test="${pageDto.endPage >= pageDto.pageCount}">	
										<a href="#">≥</a>
									</c:if>	
								</c:if>	
								<c:if test="${pageDto.searchText ne null}">
									<c:if test="${pageDto.endPage < pageDto.pageCount}">	
										<a href="${pageContext.request.contextPath }/customerservice/list?pageNum=${pageDto.startPage +  pageDto.pageBlock}&searchText=${pageDto.searchText}">≥ </a>
									</c:if>	
									<c:if test="${pageDto.endPage >= pageDto.pageCount}">	
										<a href="#">≥</a>
									</c:if>	
								</c:if>	
<!--                                 <a href="#"><i class="fa fa-long-arrow-right"></i></a> -->
                            	 <div class="write">
                            	 <c:choose>
							    	<c:when test="${sessionScope.memId eq null }">
							    		<a class="boardwrite">글쓰기</a>
							    	</c:when>
							    	<c:otherwise>
							    		<a href="${pageContext.request.contextPath }/customerservice/write">글쓰기</a>
							    	</c:otherwise>
							     </c:choose>
                            	 
                            	 </div>
                            </div>
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