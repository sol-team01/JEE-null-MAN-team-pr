<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="/resources/myPage.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.2.0/chartjs-plugin-datalabels.min.js"
	integrity="sha512-JPcRR8yFa8mmCsfrw4TNte1ZvF1e3+1SdGMslZvmrzDYxS69J7J49vkFL8u6u8PlPJK+H3voElBtUCzaXj+6ig=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
						<div id="myFood">
							<div id="myFoodText">
								당신의 권장 칼로리
								<div>
								<div class="kaclBox">150,00</div>
									<a class="textKcal"> kcal</a>
								</div> 
							</div>
							<div id="myFoodListBox">
							<div id="myFoodList"><!-- List 전체 묶어주기 -->
								<div class="mainBox"><!-- List 개별 목록 -->
									<div class="dateBox">
										<div class="time">24.04.01</div>
										<div class="time">아침</div>
									</div>	<div class="myEatBox"><div class="myEatLog">
<!-- 먹은 칼로리 목록 넣는 곳  -->
<c:forEach var="i" begin="1" end="20">
			${i }. 곰탕<br>
</c:forEach>
									</div>	<div class="totalBox">Total<div>
									<div class="totalSum">
<!-- 리스트당 칼로리 계산 넣는 곳 -->
15,000
									</div>	<a class="textKcal"> kcal</a>
									</div>	</div>	</div>
								</div> 						   <!-- List 개별 목록 -->
								<div class="mainBox"><!-- List 개별 목록 -->
									<div class="dateBox">
										<div class="time">24.04.01</div>
										<div class="time">아침</div>
									</div>	<div class="myEatBox"><div class="myEatLog">
<!-- 먹은 칼로리 목록 넣는 곳  -->
<c:forEach var="i" begin="1" end="5">
			${i }. 오리고기<br>
</c:forEach>
									</div>	<div class="totalBox">Total<div>
									<div class="totalSum">
<!-- 리스트당 칼로리 계산 넣는 곳 -->
15,000
									</div>	<a class="textKcal"> kcal</a>
									</div>	</div>	</div>
								</div> 						   <!-- List 개별 목록 -->
							</div>
							</div>
							</div>
</body>
</html>