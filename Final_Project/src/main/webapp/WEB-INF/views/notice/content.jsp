<%@page import="com.itwillbs.domain.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/notice_writeForm.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/basic.css">
 	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<title>Notice</title>
</head>
	<%
	String memId=(String)session.getAttribute("memId");
	%>
<body data-spy="scroll" data-target="#navbar">
<div id="canvas-overlay"></div>
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

					<table class="table">
						<thead>
							<tr><th>글번호</th><td>${dto.notiNum}</td></tr>
							<tr><th>등록일</th><td>${dto.notiDate}</td></tr>
							<tr><th>조회수</th><td>${dto.notiReadcount}</td></tr>
							<tr><th>제목</th><td>${dto.notiTitle}</td></tr>
							<tr><th>글내용</th><td style="white-space:pre;">${dto.notiContent}</td></tr>
							<tr><th>첨부파일</th>
							<td>
							<c:if test="${! empty dto.notiImage }">
							<img src="${pageContext.request.contextPath }/resources/upload/${dto.notiImage}">
							</c:if>
							<c:if test="${! empty dto.notiImage1 }">
							<img src="${pageContext.request.contextPath }/resources/upload/${dto.notiImage1}">
							</c:if>
							<c:if test="${! empty dto.notiImage2 }">
							<img src="${pageContext.request.contextPath }/resources/upload/${dto.notiImage2}">
							</c:if>
							
							</td></tr>
						</thead>
					</table>
					
					
					<div class="text-right">
				
						<input type="button" value="글목록" class="write_btn"
						onclick="location.href='${pageContext.request.contextPath }/notice/list'">
						
						<c:if test="${sessionScope.memId == 'admin' }">
						<input type="button" value="글수정" class="write_btn"
						onclick="location.href='${pageContext.request.contextPath }/notice/update?notiNum=${dto.notiNum}'">
						<input type="button" value="글삭제" class="write_btn"
						onclick="location.href='${pageContext.request.contextPath }/notice/delete?notiNum=${dto.notiNum}'">
						</c:if>
						
					
					</div>
					</div>
      			</div>
            </div>
        </div>
    </div>
</body>
</html>