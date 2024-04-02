<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보</title>
</head>
<body>
<a>리스트에 없는 것이 궁금하다면 검색해 주세요</a>
 <form action="${cp}/food/information">
 <input type="text" name=desc_kor autocomplete="off" placeholder="검색어를 입력하세요">
 </form>
 
 <table>
	<tr>
		<td> 식품이름 </td>
		<td> 1회제공량 </td>
		<td> 열량 </td>
		<td> 탄수화물 </td>
		<td> 단백질 </td>
		<td> 지방 </td>
		<td> 당류 </td>
		<td> 나트륨 </td>
		<td> 콜레스테롤 </td>
		<td> 포화지방산 </td>
		<td> 트랜스지방산 </td>
	</tr>
	
	<hr>
        테스트입니다// ${food.body.items.get(0).DESC_KOR } </td>
        테스트입니다// ${foodTEST.body.items.get(0).DESC_KOR } </td>
        <hr>
테스트입니다: ${food.body.items[0].DESC_KOR}
<hr>
	<hr>
        
	<c:forEach var="i" begin="0" end="9" varStatus="loop">
    <tr>
        <td> ${food.body.items.get(i).DESC_KOR } </td>
        <td> ${food.body.items.get(i).SERVING_WT } g </td>
        <td> ${food.body.items.get(i).NUTR_CONT1 } kcal </td>
        <td> ${food.body.items.get(i).NUTR_CONT2 } g </td>
        <td> ${food.body.items.get(i).NUTR_CONT3 } g </td>
        <td> ${food.body.items.get(i).NUTR_CONT4 } g </td>
        <td> ${food.body.items.get(i).NUTR_CONT5 } g </td>
        <td> ${food.body.items.get(i).NUTR_CONT6 } mg </td>
        <td> ${food.body.items.get(i).NUTR_CONT7 } mg </td>
        <td> ${food.body.items.get(i).NUTR_CONT8 } g </td>
        <td> ${food.body.items.get(i).NUTR_CONT9 } g </td>
    </tr>
	</c:forEach>
</table>

<a href="#" onclick="goBack()">뒤로가기</a>

<script>
function goBack() {
  window.history.back();
}
</script>
 
</body>
</html>