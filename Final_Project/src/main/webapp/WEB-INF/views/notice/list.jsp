<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/notice/notice_list.css"	type="text/css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice/basic.css">
<section class="notice">
	<div class="page-title">
		<div class="container">
			<h3>공지사항</h3>
		</div>
	</div>
	
	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
<!-- 			<div class="search-window"> -->
<!-- 				<form action=""> -->
<!-- 					<div class="search-wrap"> -->
<!-- 						<label for="search" class="blind">공지사항 내용 검색</label> -->
<!-- 						 <input	id="search" type="search" name="" placeholder="검색어를 입력해주세요." value=""> -->
<!-- 						<button type="submit" class="btn btn-dark">검색</button> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
		</div>
	</div>
	<!-- board list area -->
	<div id="board-list">
		<div class="container">
		
			<table class="board-table">
				<thead>
					<tr>
						<th scope="col" class="th-num">글번호</th>
						<th scope="col" class="th-id">작성자</th>
						<th scope="col" class="th-title">글제목</th>
						<th scope="col" class="th-date">등록일</th>
						<th scope="col" class="th-readcount">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${noticeList }">
						<tr>
							<td>${dto.notiNum}</td>
							<td>관리자</td>
							<td><a
								href="${pageContext.request.contextPath }/notice/content?num=${dto.notiNum}">
									${dto.notiTitle}</a></td>
							<fmt:parseDate value="${dto.notiDate}" var="date"
								pattern="yyyy.MM.dd HH:mm" />
							<td><fmt:formatDate value="${date}" pattern="yyyy.MM.dd" /></td>
							<%--     <td>${dto.noti_date}</td> --%>
							<td>${dto.notiReadcount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			
			<c:if test="${sessionScope.memId eq 'admin' }">

				<div id="page_write">
				<a href="${pageContext.request.contextPath }/notice/writeForm"  class="write_btn">글쓰기</a><br>
				</div>
			</c:if>

			<div id="page_control">
			<c:if test="${pageDto.startPage > pageDto.pageBlock }">
				<a
					href="${pageContext.request.contextPath }/notice/list?pageNum=${pageDto.startPage - pageDto.pageBlock}">[10페이지
					이전] </a>
			</c:if>

			<c:forEach var="i" begin="${pageDto.startPage }"
				end="${pageDto.endPage }" step="1">
				<a
					href="${pageContext.request.contextPath }/notice/list?pageNum=${i}">${i}</a>
			</c:forEach>

			<c:if test="${pageDto.endPage < pageDto.pageCount}">
				<a
					href="${pageContext.request.contextPath }/notice/list?pageNum=${pageDto.startPage + pageDto.pageBlock}">[10페이지
					다음] </a>
			</c:if>
			
			</div>
			
		</div>
	</div>
</section>