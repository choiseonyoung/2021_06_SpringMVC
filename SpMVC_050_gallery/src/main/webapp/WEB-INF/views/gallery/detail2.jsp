<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	div#gallery_box {
		width: 90%;
		margin: 10px auto;
		border: 1px solid #aaa;
		display: flex;
	}
	
	div#gallery_box div:first-of-type {
		flex: 1;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 10px;
	}
	
	div#gallery_box div:last-of-type {
		flex: 3;
	}
	
	div#gallery_box img {
		height: 100%;
	}
	
	div#gallery_files {
		width: 90%;
		margin: 10px auto;
		display: flex;
		flex-wrap: wrap;
	}
	
	div#gallery_files div.gallery_file {
		width: 200px;
		height: 200px;
		padding: 5px;
		overflow: hidden;
		position: relative;
	}
	
	div.gallery_file:after {
		content: "";
		position: absolute;
		left: 0;
		top: 0;
		bottom: 0;
		right: 0;
		background-color: transparent;
		color: transparent;
		/* 투명 색깔로 */
		z-index: 10;
		transition: 0.5s;
		line-height: 200px;
		/*
		box 내의 text의 그려지는 높이를 box의 높이와 같게 만들면
		text가 box의 세로 방향 가운데 정렬이 된다
		*/
		text-align: center;
		cursor: pointer;
	}
	
	div.gallery_file:hover:after {
		content: '\f2ed';
		font-size: 30px;
		font-family: "Font Awesome 5 Free";
		background-color: rgba(80, 0, 30, 0.3);
		color: white;
		vertical-align: middle;
	}
	
	div#gallery_files img {
		margin: 2px;
		width: 100px;
	}
	
	div#gallery_button_box {
		width: 90%;
		margin: 5px auto;
		text-align: right;
		border: 0;
	}
	
	div#gallery_button_box button {
		display: inline-block;
		padding: 12px 20px;
		outline: 0;
		border: 0;
		border-radius: 10px;
	}
	
	div#gallery_button_box button:hover {
		box-shadow: 2px 2px 2px #333;
		cursor: pointer;
	}
	
	div#gallery_button_box button:nth-of-type(1) {
		background-color: lightpink;
		color: white;
	}
	
	div#gallery_button_box button:nth-of-type(2) {
		background-color: pink;
		color: white;
	}
	
</style>
<div id="gallery_box">
	<div>
		<c:if test="${empty GALLERY.g_image}">
			<img src="${rootPath}/files/noImage.png" alt="main_image" width="200px">
		</c:if>
		<c:if test="${not empty GALLERY.g_image}">
			<img src="${rootPath}/files/${GALLERY.g_image}" alt="main_image">
		</c:if>
	</div>
	
	<div id="gallery_info">
		<h3>제목 : ${GALLERY.g_subject}</h3>
		<h5>SEQ : ${GALLERY.g_seq}</h5>
		<p>작성일 : ${GALLERY.g_date}</p>
		<p>작성시각 : ${GALLERY.g_time}</p>
		<p>작성자 : ${GALLERY.g_writer}</p>
		<p>내용 : ${GALLERY.g_content}</p>
	</div>
</div>

<div id="gallery_files">
	<c:forEach items="${GALLERY.fileList}" var="FILE">
		<div class="gallery_file" data-fseq="${FILE.file_seq}">
			<c:if test="${empty FILE.file_upname}">
				<img src="${rootPath}/files/noImage.png" height="100px">
			</c:if>
			<c:if test="${not empty FILE.file_upname}">
				<img src="${rootPath}/files/${FILE.file_upname}" data-fseq="${FILE.file_seq}">
			</c:if>
		</div>
		
	</c:forEach>
</div>
<div id="gallery_button_box">
	<button class="gallery update">수정</button>
	<button class="gallery delete">삭제</button>
</div>

<script>
let update_button = document.querySelector("button.gallery.update")
let delete_button = document.querySelector("button.gallery.delete")

update_button.addEventListener("click",()=>{
	// alert("일련번호 ${GALLERY.g_seq} 인 게시물 수정")
	
	/*
	현재 GALLERY.g_seq 값은 숫자형이다
	만약 GALLERY.g_seq 값이 S0001 등과 같이 문자열형이라면
	이 코드는 JS 문법 오류가 발생할 것이다
	
	현재 작성한 코드는 JSP 코드이다
	이 코드는 Response가 될 때 HTML 코드로 변환이 되고 Script 부분도 변환이 되는데
	
	변환되는 과정에서 ${GALLERY.g_seq} 는 담겨있는 문자열인 S0001만 단독으로 나타난다
	
	아래 코드는 "/root-context/gallery/update?g_seq=" + S0001 처럼 변환이 된다
	
	결국 JS 코드가 실행될 때 + S0001 처럼 변환되어 변수를 찾게 된다
	그리고 S0001 이라는 변수가 정의되지 않아 문법 오류가 발생한다
	
	** EL tag를 사용하여 스크립트 부분에서 직접 값을 부착할 때는 DO("")를 부착하여 문법 오류를 방지하자
	
	*/
	location.href = "${rootPath}/gallery/update?g_seq=${GALLERY.g_seq}"
})

delete_button.addEventListener("click",()=>{
	if(confirm("일련번호 ${GALLERY.g_seq} 인 게시물 삭제 ??")) {
		location.replace("${rootPath}/gallery/delete?g_seq=${GALLERY.g_seq}")
	}
})

/*
 const : JS에서 상수를 선언하기
 다른 언어에서는 상수 선언이 메모리적 문제를 해결하고
 동시성처리(멀티 환경에서 서로 변수가 간섭하는 현상을 핸들링)를 쉽게 하기 위한 방안으로 사용한다
 
 상수를 선언하는 이유
 여기에 설정된 값이 코드 중간에 어떤 이유로 변경되는 것을 방지하는 역할 (자바스크립트에서는 이 기능이 더 중요)
 
 한개의 선언된 변수에 코드 중간에 다른 값이 저장되어(의도하든 그렇지 않든)
 논리적인 오류를 일으킬 수 있다
 그러한 문제를 방지하기 위하여 const 키워드를 상당히 권장한다
 */
const gallery_files = document.querySelector("div#gallery_files")
// const : 변수값이 한번 설정되면 절대 변하지 않는 속성 (상수 설정) 오류를 막기 위한 조치
if(gallery_files) {
	gallery_files.addEventListener("click",(e)=>{
		const tag = e.target
		// tag에 걸려있는 class 이름을 챙겨서 조건을 걸 때
		// tag.className === "gallery_file" 와 같이 사용할 수 있지만
		// 혹시 tag에 다수의 클래스가 설정될 수 있기 때문에 조건문이 false가 될 수 있다
		// className.includes() 함수를 사용하여 조건 검사를 하는 것이 좋다
		if(tag.tagName === "DIV" && tag.className.includes("gallery_file")) {
			const seq = tag.dataset.fseq
			if(confirm(seq + "이미지를 삭제하시겠습니까?")) {
				// 삭제하면 fetch로 ajax 이용해서 서버로 보냄
				// GET method 방식으로 Ajax 요청 (GET은 쉬움. 링크 클릭 or location 사용하는 것과 똑같)
				// 서버에서 리턴받는 값을 추출하기 위해서 .then 사용해서 2번째 항목에서 그 내용 체크하면 됨
				fetch("${rootPath}/gallery/file/delete/" + seq)
				.then(response=>response.text())
				.then(result=>{
					if(result === "OK") {
						alert("삭제성공")
						tag.remove()
						// 현재 클릭된 div tag 요소를 화면에서 제거 (db는 아직 삭제된 거 아님. 그래서 새로고침하면 나타남)
					} else if (result === "FAIL_SEQ") {
						alert("이미지 코드가 잘못되어 삭제할 수 없음")
					} else if (result === "NO") {
						alert("서버가 모른대")
					} else {
						alert("삭제 실패")
					}
				})
				// 이 seq값을 너에게 보내니 니 seq값에 대한 파일을 삭제해라
				// 이게 성공이 되면 뭔가 응답을 해줄텐데 .then이라는 함수로 결과 받음
				// ajax로 요청한 결과를 서버가 보내면 서버가 보낸 것 중에 문자열 값만 알고 싶다
				// 서버가 보낸 문자열을 ~..
			}
		}
	})
}
</script>