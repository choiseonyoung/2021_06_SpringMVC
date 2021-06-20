<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

#main {
	width: 60%;
	margin: auto;
	margin-top: 50px;
	text-align: center;
}

#list {
	width: 100%;
	border-collapse: collapse;
	border-top: 2px solid gray;
	line-height: 40px;
}

#list tr {
	border-bottom: 1px solid lightgray;
}

#list th {
	background-color: rgb(245, 243, 243);
	border-bottom: 2px solid lightgray;
}
</style>
<script>
document.addEventListener("DOMContentLoaded", () => {
	  document.querySelector("nav#main_nav").addEventListener("click", (e) => {
	      let menuText = e.target.textContent;
	      let urlPath = `${rootPath}`;
		
	      if (menuText === "Home") {
	        urlPath += "/";
	      } else if (menuText === "학생정보") {
	        urlPath += "/student";
	      } else if (menuText === "성적일람표") {
	        urlPath += "/score";
	      } else if (menuText === "로그인") {
	        urlPath += "/member/login";
	      }
	      
	      location.href = urlPath;
	    }
	  });
	});
</script>
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
					<td>${ST.st_num}</td>
					<td>${ST.st_sum}</td>
					<td>${ST.st_avg}</td>
				</tr>
			</c:forEach>
		</table>
		<button>학생추가</button>
	</section>
</body>
</html>