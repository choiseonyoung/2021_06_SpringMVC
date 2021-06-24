<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
	button.student.insert {
		background-color: white;
		color: gray;
		border: 2px solid pink;
	}
	
	button.home {
		background-color: white;
		color: gray;
		border: 2px solid purple;
	}
</style>
<h2>학생정보 리스트</h2>
<table>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>전공</th>
		<th>학년</th>
		<th>연락처</th>
		<th>주소</th>
	</tr>
	<c:choose>
		<c:when test="${empty STUDENTS}">
			<tr>
				<td colspan="6">데이터가 없음</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${STUDENTS}" var="ST">
				<tr data-stnum="${STD.st_num}">
					<td>${ST.st_num}</td>
					<td>${ST.st_name}</td>
					<td>${ST.st_dept}</td>
					<td>${ST.st_grade}</td>
					<td>${ST.st_tel}</td>
					<td>${ST.st_addr}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<div class="btn_box">
	<button class="student insert">학생정보등록</button>
	<button class="student home">처음으로</button>
</div>