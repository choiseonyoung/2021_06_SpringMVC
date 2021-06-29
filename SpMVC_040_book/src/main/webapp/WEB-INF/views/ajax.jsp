<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
</head>
<body>
<h1>내 도서관</h1>
<input name="search">
<input name="st_name">
<button>전송</button>
<script>
document.querySelector("button").addEventListener("click",()=>{
	
	let search = document.querySelector("input[name='search']").value
	// name값이 search인 input박스의 value값
	let st_name = document.querySelector("input[name='st_name']").value
	
	// 서버로 fetch(ajax)로 전송하기
	// 1. JSON 데이터로 만들기
	let json = { search : search, st_name }
	// 생성한 임의의 변수 이름, 위에 선언한 변수 이름 가져오는거
	
	// 2. JSON type의 데이터를 ajax로 전송하기 위한 문자열화
	// Serialize 라고 한다
	let jsonString = JSON.stringify(json)
	
	alert(jsonString)
	
	// 3. fet method를 이용하여 서버로 POST 방식으로 전송하기
	// POST로 보낼 데이터에 대한 옵션들 작성 (상당히 중요)
	fetch("${rootPath}/api", {
		method : "POST", // method를 POST로 보내겠다 (POST로 보낼 땐 BODY에 실려서 감)
		body : jsonString, // 그냥 json하면 스프링에서 못 보냄. 이걸 문자열화 해야됨
		headers : {
			"content-Type" : "application/json"
		}
		// json으로 보낼거니 잘 받아라 라는 걸 알려주기 위해 headers
	})
	
	
	alert(search)
	
})

</script>
</body>
</html>