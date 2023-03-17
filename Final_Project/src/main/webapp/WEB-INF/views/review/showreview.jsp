<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지마켓:show review</title>
</head>
<body bgcolor="#C8C8FF">

	<div class="modal-title">${sessionScope.reviewee}님이거래후기를 남겨주셨어요!</div>
	<br>

	<fieldset style="display: flex; justify-content: center; border-color: white;">
		<c:if test ="${revCate}=='별로예요'">
		<div class="img_style">
			<img
				src="${pageContext.request.contextPath }/resources/img/review/bad.png"
				id="bad" class="review_img_bad review"><br> 별로예요</div>
		</c:if>
		<c:if test ="${revCate}=='좋아요'">
		<div class="img_style">
			<img
				src="${pageContext.request.contextPath }/resources/img/review/soso.png"
				id="soso" class="review_img_soso review"><br> 좋아요
		</div>
		</c:if>
		<c:if test ="${revCate}=='최고예요'">
		<div class="img_style">
			<img
				src="${pageContext.request.contextPath }/resources/img/review/good.png"
				id="good" class="review_img_good review"><br> 최고예요
		</div>
		</c:if>
	</fieldset>
	
	<div>${revCate }</div>
	<c:forEach var="dto" items="${reviewList}">
	<div>${dto.rev_content}</div><br>
	</c:forEach>



<script type="text/javascript">
var showReviewpopup = window.open(
		"${pageContext.request.contextPath}/review/showreview","거래후기","width=500,height=500,top=100,left=100"	
	);

</script>


</body>
</html>