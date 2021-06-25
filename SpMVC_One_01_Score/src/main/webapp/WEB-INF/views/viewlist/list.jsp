<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<table>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>전공</th>
		<th>학년</th>
		<th>응시과목</th>
		<th>총점</th>
		<th>평균</th>
	</tr>
	<c:choose>
		<c:when test="${empty VLLIST}">
			<tr>
				<td colspan="7">데이터가 없음</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${VLLIST}" var="VL">
				<tr>
					<td>${VL.st_num}</td>
					<td>${VL.st_name}</td>
					<td>${VL.st_dept}</td>
					<td>${VL.st_grade}</td>
					<td>${VL.sb_count}</td>
					<td>${VL.sb_sum}</td>
					<td>${VL.sb_avg}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>