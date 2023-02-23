<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매완료</title>

<style type="text/css">

       
    
</style>
</head>
<body>


<h1>구매완료</h1>
<h2>${memberId}님! 구매가 완료 되었습니다!</h2>

<input type="button" class="goBuylist" id="goBuylist" value="구매 리스트로 이동하기 " 
			onclick="location.href='${pageContext.request.contextPath}/list/buylist'" >







<script type="text/javascript">
var goReviewpopup = window.open(
		"${pageContext.request.contextPath}/review/review","거래후기","width=500,height=500,top=100,left=100"	
	);

</script>




</body>
</html>

