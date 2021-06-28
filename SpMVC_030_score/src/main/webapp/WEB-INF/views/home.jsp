<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale:1" />
<title>대한고교 성적처리</title>
</head>
<style>
@font-face {
	font-family: 'twaysky';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Cafe24SsurroundAir';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

h1 {
	font-family: 'twaysky';
	font-size: 40px;
}

body {
	width: 100wv; /* 뷰포트의 width만큼 */
	height: 100vh;
	display: flex;
	flex-direction: column;
	overflow: auto;
}

header {
	background: url("${rootPath}/static/images/header_background.jpg")
		no-repeat;
	background-size: 100% 100%;
	background-position: center;
	background-attachment: fixed;
	text-align: center;
	text-shadow: 2px 2px 2px gray;
	color: lightpink;
	padding: 2rem;
}

nav {
	background-color: lightgray;
	color: black;
	width: 100wvh
}

nav.fixed {
	opsition: fixed;
	top: 0;
	left 0;
	riehgt: 10px;
	border-bottom-right-radius: 20px;
	box-shadow: 3px 3px 3px rgba(0,0,0,0.5);
	
}

nav ul {
	list-style: none;
	display: 
}

nav li {
	padding: 16px 12px;
	border-bottom: 3px solid transparent;
	transition: 1s;

nav li:hover {
	border-bottom: 3px solid yellow;
}

section#main_sec {
	flex: 1;
	width: 100wv;
	display: flex;
	flex-direction: column;
	background: url("${rootPath}/static/images/section_background.jpg")
		no-repeat;
	/* background: linear-gradient(to bottom, purple, pink); */
	background-size: 100% 100%;
	background-attachment: fixed;
	
	/*
	header와 nav를 화면에 고정하고
	data가 보이는 부분만 scroll 하기 위하여
	section#main_sec
	*/
}

h2 {
	font-family: 'Cafe24SsurroundAir';
	width: 90%;
	color: white;
	margin: 10px auto 0 auto;
	padding: 1rem;
	border: 1px solid #aaa;
	text-align: center;
}

table {
	border: 0;
	width: 90%;
	border-collapse: collapse;
	border-spacing: 0;
	margin: 10px auto;
}

tr {
	border-top: 1px solid purple;
}

tr:last-child {
	border-bottom: 1px solid purple;
}

tr:nth-of-type(odd) {
	background-color: #F7E7FB;
}

tr:nth-of-type(even) {
	background-color: #FAF5FC;
}

tr:hover td {
	background-color: lightgray;
	cursor: pointer;
}

td, th {
	border-right: 1px solid purple;
	padding: 8px 12px;
	text-align: center;
}

td.number {
	text-align: right;
}

td:last-child, th:last-child {
	border: none;
}

div.btn_box {
	width: 90%;
	/*
	table의 margin: 10px auto로 설정되어 있기 때문에
	top margin은 0으로 bottom margin은 10px로 좌우는 auto로
	*/
	margin: 0px auto 10px auto;
	padding: 5px;
	text-align: right;
}

div.btn_box button {
	border: 0;
	outline: 0;
	padding: 12px 16px;
	margin-left: 10px;
	border-radius: 5px;
}

button:hover {
	box-shadow: 2px 2px 2px 2px gray;
	cursor: pointer;
}

form {
	width: 90%;
	margin: 0 auto 10px auto;
}

fieldset {
	background-color: #eee;
	border: 1px solid puple;
	border-radius: 10px;
	padding: 0.7rem;
}

form label, form input {
	display: inline-block;
	margin: 5px;
	padding: 8px 16px;
}

form label {
	width: 30%;
	text-align: right;
	color: gray;
	font-weight: bold;
}

form input {
	width: 60%;
	outline: 0;
	border: gray;
	border-radius: 50px;
}

form input:hover {
	background: lightpink;
}

form button.save {
	background-color: lightpink;
	color: black;
}

form button.reset {
	background-color: lightpink;
	color: black;
}

form button.list {
	background-color: lightpink;
	color: black;
}

form button.home {
	background-color: lightpink;
	color: black;
}

button.update {
	background-color: lightpink;
	color: white;
}

button.delete {
	background-color: lightpink;
	color: black;
}

button.student.list {
	background-color: orange;
	color: white;
	text-shadow: 1px 1px 1px black;
}
form {
	width: 90%;
	margin: 0 auto 10px auto;
}
fieldset {
	background-color: #eee;
	border: 1px solid green;
	border-radius: 10px;
	padding: 0.7rem;
}
form label, form input {
	display: inline-block;
	margin: 5px;
	padding: 8px 16px;
}
form label {
	width: 30%;
	text-align: right;
	color: blue;
	font-weight: bold;
}
form input {
	width: 60%;
	outline: 0;
	border: #aaa;
	border-radius: 50px;
}
form input:hover {
	background: #bbb;
}

</style>

<body>
	<header>
		<h1>대한고교 성적처리</h1>
		<p>대한고교 성적처리 시스템 2021</p>
	</header>
	<nav>
		<ul>
			<li>HOME</li>
			<li>로그인</li>
			<li>로그아웃</li>
			<li>관리자</li>
		</ul>
	</nav>
	<section id="main_sec">
		<c:choose>
			<c:when test="${BODY == 'SCORE_VIEW' }">
				<%@ include file="/WEB-INF/views/score/list.jsp"%>
			</c:when>
			<c:when test="${BODY == 'STUDENT_LIST' }">
				<%@ include file="/WEB-INF/views/student/list.jsp"%>
			</c:when>
			<c:when test="${BODY == 'STUDENT_INPUT' }">
				<%@ include file="/WEB-INF/views/student/input.jsp" %>
			</c:when>
			<c:when test="${BODY == 'STUDENT_DETAIL' }">
				<%@ include file="/WEB-INF/views/student/detail.jsp" %>
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/main.jsp"%>
			</c:otherwise>
		</c:choose>
	</section>
</body>
<script>
/*
 * JS 코드에서 event를 등록할 때 현재 화면에 없는 DOM 요소에 addEvent를 설정하면 없는 함수라는 오류가 발생한다.
 * 그 이유는 현재 화면에 없는 DOM 요소를 querySelector하면 그 결과값이 null이기 때문에 발생하는 문제이다
 * 
 * JS 코드를 통합하여 모음으로 관리할 때는
 * addEvent를 하려고 하는 요소가 있는지를 먼저 검사한 후 addEvent를 수행해줘야 한다.
 */
let std_list = document.querySelector("button.student.list");
let std_insert = document.querySelector("button.student.insert");
let home = document.querySelector("button.student.home");

if(std_list) {
	std_list.addEventListener("click",(e)=>{
		location.href = "${rootPath}/student"
	})
}
// std_list가 있을 때만 이거 적용하라 => null로 인한 거 막을 수 있음

if(std_insert) {
	std_insert.addEventListener("click",(e)=>{
		location.href = "${rootPath}/student/insert"
	})
}

if(home) {
	document.querySelector("button.home").addEventListener("click",(e)=>{
		location.href = "${rootPath}/"
	})
}

let table = document.querySelector("table.detail")
if(table) {
	table.addEventListener("click", (e)=>{
		
		let target = e.target
		let tagName = target.tagName
		if(tagName === "TD") {
			let tr = target.closest("TR")
			let stNum = tr.dataset.stnum
			
			location.href = "${rootPath}/student/detail?st_num=" + stNum
		}
		// 현재 클릭된 td의 부모 tr을 가져와서
		})
}

let main_nav = document.querySelector("nav#masin_py")
let main_header = document.querytSelector("haeder")

// header box의 높이가 얼마냐
let main_header_height = main_header.offsetHeight;
document.addEventListener("scroll",()=>{
	// HTML 문서 전체의 크기, 좌표 등을 추출하기
	let doc_bound = document.querySelector("HTML")
				.getBoundingClientRect();
	
	let doc_top = doc_bound.top
	/*
	화면이 아래방향으로 스크롤될때
	화면 문서의 top 좌표를 추출하여
	
	header box의 높이와 비교
	header box의 높이에 -1을 곱하고 그 값보다 작아지면
	==  header box가 화면에서 사라지면
	nav에 fixed 라는 class를 부착하고
	== header box가 화면에서 나타나면
	nav에 fixed class를 제거하여 원래 모습으로 다시 보이기
	*/
	if(doc_top < main_header_height * -1) {
		main_nav.classList.add("fixed")
	} else {
		main_nav.classList.remove("fixed")
	}
})



</script>
</html>