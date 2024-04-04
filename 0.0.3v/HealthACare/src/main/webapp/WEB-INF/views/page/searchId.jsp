<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<form id=findUserIdForm action="${cp}/page/searchId" method="post">
			<input class="ebox" id="email" name="email" type="text" /> 
			<a class="text4"><span id="middle">@</span></a> 
			<input class="ebox" id="domain-txt" type="text" /> 
			<select class="ebox" id="domain-list">
				<option value="naver.com">naver.com</option>
				<option value="google.com">google.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="kakao.com">kakao.com</option>
			</select>
			<!-- 타입 히든으로 넣고 앞에 인풋으로 들어간 입력들을 제이커리에서 합치는 기능 -->
			<input type="hidden" id="totalemail" name="I_email" value="">
			<input id="SearchBt" type="submit" name="searchId" value="찾기">
		</form>
	</div>
	<label id="jotest">찾은 아이디: <span id="userIdResult"></span></label>
	<script>
	 // 도메인 직접 입력 or domain option 선택 
	const domainListEl = document.querySelector('#domain-list');
	const domainInputEl = document.querySelector('#domain-txt');
	// select 옵션 변경 시
	 domainListEl.addEventListener('change', (event) => {
	// option에 있는 도메인 선택 시
	if(event.target.value !== "type") {
	 // 선택한 도메인을 input에 입력하고 disabled 
	domainInputEl.value = event.target.value;
	domainInputEl.disabled = true;
	} else { // 직접 입력 시
	 // input 내용 초기화 & 입력 가능하도록 변경 
	 domainInputEl.value = ""; 
	 domainInputEl.disabled = false;
	 } 
	});	
	
	 $(document).ready(function() {
		    $("#email").blur(function(){
		        updateEmail();    
		    });

		    $("#domain-txt").change(function(){
		        updateEmail();    
		    });

		    $("#domain-list").change(function(){
		        updateEmail();    
		    });

		    function updateEmail() {
		        const email = $("#email").val();
		        const middle = $("#middle").text();
		        const address = $("#domain-txt").val();
		        if(email != "" && address != "") {
		            $("#totalemail").val(email + middle + address);
		        }
		    }
		    
		    
		});
	 
	 $(document).ready(function() {
		    $("#findUserIdForm").submit(function(event) {
		        event.preventDefault(); // 기본 제출 동작을 막음

		        var formData = $(this).serialize(); // 폼 데이터를 시리얼라이즈하여 가져옴

		        $.ajax({
		            type: 'POST',
		            url: $(this).attr('action'),
		            data: formData,
		            success: function(data) {
		                if (data) {
		                    $("#userIdResult").text(data); // 찾은 아이디를 결과 영역에 표시
		                } else {
		                    alert('아이디를 찾을 수 없습니다.');
		                }
		            },
		            error: function() {
		                alert("서버 에러");
		            }
		        });
		    });
		});
	 
	 </script>
	 
</body>
</html>