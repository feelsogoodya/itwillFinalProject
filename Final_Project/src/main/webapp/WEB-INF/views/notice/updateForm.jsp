<%@page import="com.itwillbs.domain.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/notice_updateForm.css">
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
						<h2>NOTICE Update</h2>
					</div>
					<div class="row mt-5">
					<%
//세션값 가져오기
String id=(String)session.getAttribute("memId");
if(id==null){
// 	response.sendRedirect("./BoardList.bo");
}
%>
<%-- 					<% --%>
<!-- // 					NoticeDTO dto=(NoticeDTO)request.getAttribute("dto"); -->
<%-- 					%> --%>
					<form action="${pageContext.request.contextPath }/notice/updatePro" method="post" enctype="multipart/form-data">
						<input type="hidden" name="notiNum" value="${dto.notiNum}">
						<table class="table">
							<tr><th>글쓴이</th>
							<td><input type="text" name="memId" value="관리자" readonly></td></tr>
							<tr><th>글제목</th>
							<td><input type="text" name="notiTitle" value="${dto.notiTitle}"></td></tr>
							<tr><th>글내용</th>
							<td><textarea name="notiContent" rows="10" cols="100">${dto.notiContent}</textarea></td></tr>
							<tr><td>첨부파일</td>
   							<td><input type="file" name="file">${dto.notiImage}<br>
   							<input type="hidden" name="oldfile" value="${dto.notiImage}">
   							<input type="hidden" name="oldfile1" value="${dto.notiImage1}">
   							<input type="hidden" name="oldfile2" value="${dto.notiImage2}">
   							<input type="file" name="file1" >${dto.notiImage1}<br>
   							<input type="file" name="file2">${dto.notiImage2}<br></td></tr>   
						</table>
						<div class="text-right">
							<input type="submit" value="글수정" class="write_btn">
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




