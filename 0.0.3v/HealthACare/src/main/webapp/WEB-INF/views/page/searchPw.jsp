<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${cp}/resources/searchPw.css">
</head>
<body>

<form action="${cp}/page/searchPw" method="post">
<label for="securityQuestion" class="text3">비밀번호찾기 질문</label>
	<select class="passwordQuestion" id="I_pwFinding" name="I_pwFinding">
		<option value="1">질문을 넣어주세요</option>
		<option value="2">질문을 넣어주세요2</option>
		<option value="3">질문을 넣어주세요3</option>
	</select>
<label for="QuestionAnswer" class="text3">비밀번호찾기답</label>
<input id="I_hint" name="I_hint" type="text">
<input id="signUPBt" type="submit" value="비밀번호 찾기">
</form>

<div>
<form action="${cp}/page/searchPw" method="post" name="PwSearch">
<a>아이디</a>
<input type="text" maxlength="20" name="U_id">
<input id="signUPBt" type="submit" value="비밀번호 찾기">
</form>
</div>
</body>
</html>