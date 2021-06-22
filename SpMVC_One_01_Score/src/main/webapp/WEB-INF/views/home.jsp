<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>

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
			<c:forEach items="${STLIST}" var="ST">
				<tr>
					<td>${ST.st_num}</td>
					<td>${ST.st_name}</td>
					<td>${ST.st_dept}</td>
					<td>${ST.st_grade}</td>
					<td>${ST.st_sub}</td>
					<td>${ST.st_sum}</td>
					<td>${ST.st_avg}</td>
				</tr>
			</c:forEach>
		</table>
		<button id="btn_insert_stu">학생추가</button>
	</section>
</body>
<script>
document.querySelector("#btn_insert_stu").addEventListener("click",()=>{
	location.href = "${rootPath}/insert_stu";
});
document.querySelector("td").addEventListener("click",()=> {
	alert("hi");
	location.href = "${rootPath}/stu_info";
});
</script>
</html>