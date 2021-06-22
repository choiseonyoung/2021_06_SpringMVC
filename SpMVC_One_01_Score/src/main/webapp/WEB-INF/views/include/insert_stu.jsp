<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>

	<form method="POST">
		<div>
			<label>이름</label> <input name="st_name" id="st_name">
		</div>
		<div>
			<label>전공</label> <input name="st_dept" id="st_dept">
		</div>
		<div>
			<label>학년</label> <input name="st_grade" id="st_grade">
		</div>
		<div>
			<label>연락처</label> <input name="st_tel" id="st_tel">
		</div>
		<div>
			<label>주소</label> <input name="st_addr" id="st_addr">
		</div>
		<div>
			<button>등록</button>
		</div>

	</form>

</body>
</html>