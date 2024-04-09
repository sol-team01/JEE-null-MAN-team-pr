<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="${cp}/resources/writeBoard.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<!-- 			내가 한 거 -->
			<div>
				<h1>게시글 작성</h1>
				
				<form action="${cp}/board/modify" method="post">
					<input type="hidden" id="id" name="B_id" value="${user.i_name}">
					<input type="hidden" id="no" name="B_no" value="${read.b_no}">
					<label for="title">제목: </label>
					<input type="text" width="400px" name="B_title" value="${read.b_title}" required>
					<label for="category">분류: </label>
					<select id="category" name="B_category">
						<option value="공지사항">공지사항</option>
						<option value="일반">일반</option>
						<option value="질문">질문</option>
					</select>
					<br>
					<br>
					<label for="content">내용: </label>
					<textarea rows="5" cols="40" id="content" name="B_text" required>${read.b_text}</textarea>
					<input type="submit" value="수정하기">
				</form>
			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
	</div>
</body>
</html>