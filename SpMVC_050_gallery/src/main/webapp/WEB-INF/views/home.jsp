<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
<style>
@font-face {
    font-family: 'ghanachoco';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ghanachoco.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
     font-family: 'S-CoreDream-4Regular';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

@-webkit-keyframes AnimationName { 0%{background-position:0% 50%} 50%{background-position:100% 50%} 100%{background-position:0% 50%} }

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	text-decoration: none;
	outline: none;
}

body {
	height: 120%;
	text-align: center;
	background: linear-gradient(-45deg, #faaca8, #ddd6f3, #f3e7e9, #feada6); 
    background-size: 800% 800%; 
    animation: AnimationName 15s ease infinite;
}

#navi {
	margin: 50px auto;
	margin-bottom: 40px;
}

h1 {
	color: #d9afd9;
	font-family: 'ghanachoco';
	font-size: 80px;
	text-shadow: black 3px 3px;
	letter-spacing: 10px;
}

#click {
	margin: 20px auto;
}

#click a {
	font-family: 'S-CoreDream-4Regular';
	color: gray;
	font-size: 25px;	
	font-weight: bold;
}

#home_img {
	width: 500px;
	margin: 50px;
}

/* gallery/input -------------------------------------------------------- */

#input_left {
	margin: auto 50px;
}

#input_right {
	margin: auto 50px;
}

/* input -------------------------------------------------------- */

#input_form, #login_form, #join_form {
	display: flex;
	margin: auto;
	width: 100%;
	justify-content: center;
}

.input_box {
	font-family: 'S-CoreDream-4Regular';
	color: #515150;
	width: 300px;
	height: 50px;
	margin: 70px auto;
	border: 0;
}

.input_box label {
	display: block;
	margin-bottom: 10px;
	font-size: 20px;
}

.input_box input, .input_box textarea {
	font-family: 'S-CoreDream-4Regular';
	width: 200px;
	height: 40px;
	border: 1px solid lightgray;
	border-radius: 10px;
	text-align: center;
	padding: 15px;
	transition: 0.5s;
}

.input_box textarea {
	height: 60px;
}

.input_box input:focus, .input_box textarea:focus {
	border-color: gray;
	width: 250px;
}

.input_img_box {
	font-family: 'S-CoreDream-4Regular';
	color: #515150;
	margin: 70px auto;
}

.input_img_box label {
	display: block;
	margin-bottom: 10px;
	font-size: 20px;
}

.input_img_box input {
	border-radius: 10px;
	text-align: center;
	padding: 15px;
	transition: 0.5s;
}

/* -------------------------------------------------------- */

#btn_send, #btn_input {
	font-family: 'S-CoreDream-4Regular';
	border: 0;
	background-color: #E4C7EC;
	border: 2px solid lightgray;
	border-radius: 20px;
	color: gray;
	font-weight: bold;
	cursor: pointer;
}

#btn_send {
	margin-top: 100px;
	font-size: 20px;
	width: 150px;
	height: 70px;
}

#btn_input {
	width: 100px;
	height: 50px;
	font-size: 12px;
}

</style>
</head>
<body>
<div id="navi">
	<h1>MY 갤러리</h1>
</div>
<%@ include file="/WEB-INF/views/include/include_nav.jspf" %>
<c:choose>
	<c:when test="${BODY == 'GA-INPUT'}">
		<%@ include file="/WEB-INF/views/gallery/input.jsp" %>
	</c:when>
	<c:when test="${BODY eq 'GA-LIST'}">
		<%@ include file="/WEB-INF/views/gallery/list.jsp" %>
		<a href="${rootPath}/gallery/input">이미지 등록</a>
	</c:when>
	<c:when test="${BODY eq 'GA-DETAIL'}">
		<%@ include file="/WEB-INF/views/gallery/detail.jsp" %>
	</c:when>
	<c:when test="${BODY eq 'GA-DETAIL-V2'}">
		<%@ include file="/WEB-INF/views/gallery/detail2.jsp" %>
	</c:when>
	<c:when test="${BODY eq 'JOIN'}">
		<%@ include file="/WEB-INF/views/member/join.jsp" %>
	</c:when>
	<c:when test="${BODY eq 'LOGIN'}">
		<%@ include file="/WEB-INF/views/member/login.jsp" %>
	</c:when>
	<c:otherwise>
	<div id="click">
		<a href="${rootPath}/gallery/input">이미지 등록</a>
	</div>
	</c:otherwise>
</c:choose>


<c:forEach items="${FILES}" var="FILE">
	<a href="${rootPath}/files/${FILE}" target="_NEW">
	<img src="${rootPath}/files/${FILE}" width="100px" height="100px"/>
	</a>
</c:forEach>

</body>

<script>
let main_nav = document.querySelector("nav#main_nav")

if(main_nav) {
	main_nav.addEventListener("click",(e)=>{
		let menu = e.target
		if(menu.tagName === "LI") {
			if (menu.id === "join") {
				location.href = "${rootPath}/member/join"
			} else if (menu.id === "login") {
				location.href = "${rootPath}/member/login/nav"
			} else if (menu.id === "logout") {
				location.href = "${rootPath}/member/logout"
			} else if (menu.id === "image_create") {
				location.href = "${rootPath}/gallery/login"
			} else if (menu.id === "home") {
				location.href = "${rootPath}/"
			}
		}
	})
}
</script>


</html>