<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf" %>
<body>
<%@ include file="/WEB-INF/views/include/include_header.jspf" %>
	<header>
		<h1>대한 고교 성적처리 2021</h1>
	</header>
	<nav>
		<section id="menubar">
			<p>Home</p>
			<p>학생정보</p>
			<p>성적일람표</p>
		</section>
		<p class="hi">로그인</p>
	</nav>

	<section id="main">
		<table id="list">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>전공</th>
				<th>학년</th>
				<th>응시과목</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			<tr>
				<td>ㅎㅇ</td>
			</tr>
		</table>
	</section>
</body>
</html>