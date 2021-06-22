<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>

	<table id="info">
		<tr>
			<th>학번</th>
			<td>${st_num}</td>
			<th>전공</th>
			<td>${st_dept}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${st_name}</td>
			<th>학년></th>
			<td>${st_grade}</td>
		</tr>
	</table>

	<table id="score">
		<tr>
			<th>No.</th>
			<th>과목명</th>
			<th>점수</th>
		</tr>
		<c:forEach items="" var="">
		
		</c:forEach>
	</table>
</body>
</html>