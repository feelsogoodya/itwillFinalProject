<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/notice_content.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/basic.css">
 	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
	<title>Notice</title>
</head>
<body data-spy="scroll" data-target="#navbar">
<div id="canvas-overlay"></div>
<div class="boxed-page">
<section id="gtco-menu" class="section-padding">
    <div class="container">
        <div class="section-content">
            <div class="row mb-5">
                <div class="col-md-12">
                    <div class="heading-section text-center">
                      <br>
                    <br>
                    <br>
						<h2>NOTICE</h2>
					</div>
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
</body>
</html>
