<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale:1" />
<title>대한 고교 성적처리</title>
<style>
@font-face {
	font-family: 'twaysky';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twaysky.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

header {
	display: flex;
	width: 100%;
	height: 130px;
	margin: auto;
	background-color: #9DCAFB;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

header h1 {
	font-family: "twaysky";
	font-size: 40px;
}

#main_nav {
	width: 100%;
	margin: auto;
	height: 35px;
	background-color: rgb(252, 224, 222);
	position: relative;
	align-items: center;
}

#main_nav ul {
	display: flex;
	justify-content: center;
	list-style: none;
	align-items: center;
}

#main_nav ul li {
	font-weight: bold;
	cursor: pointer;
	margin: 5px 30px;
}

#main_nav #login {
	position: absolute;
	left: 90%;
}

</style>
</head>

<body>
	<header>
		<h1>대한 고교 성적처리 2021 v1</h1>
	</header>
	<section id="main_sec">
		<c:choose>
			<c:when test="${BODY == 'VIEW_LIST'}">
				<%@ include file="/WEB-INF/views/score/list.jsp"%>
			</c:when>
				
			<c:when test="${BODY == 'STUDENT_INSERT' }">
				<%@ include file="/WEB-INF/views/student/insert.jsp"%>
			</c:when>
				
			<c:when test="${BODY == 'STUDENT_UPDATE' }">
				<%@ include file="/WEB-INF/views/student/update.jsp"%>
			</c:when>
			
			<c:when test="${BODY == 'SCORE_UPDATE' }">
				<%@ include file="/WEB-INF/views/score/update.jsp"%>
			</c:when>
			
			<c:otherwise>
				<%@ include file="/WEB-INF/views/viewlist/list.jsp"%>
			</c:otherwise>
			
		</c:choose>
	</section>
</body>
</html>