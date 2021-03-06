<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
	div.msg {
		font-size: 10px;
		color: red;
	}
	
	.join_input_box {
		margin-bottom: 40px;
	}
</style>
<form method="POST" id="join_form">
	<div class="input_box">
		<div class="join_input_box">
			<label>사용자 ID(Email)</label>
			<input name="m_userid" type="email">
			<div class="msg join id">
			</div>
		</div>
		<div class="join_input_box">
			<label>비밀번호</label>
			<input name="m_password" type="password">
		</div>
		<div class="join_input_box">
			<label>비밀번호 확인</label>
			<input name="re_password" type="password">
		</div>
		<div class="join_input_box">
			<label>닉네임</label>
			<input name="m_nick">
		</div>
		<div class="join_input_box">
			<label>전화번호</label>
			<input name="m_tel" type="tel">
		</div>
		<div>
			<button id="btn_input">가입신청</button>
		</div>
	</div>
</form>

<script>

// let user_id = document.querySelector("input#user_id") 아이디 있을 경우에는 이렇게
let user_id = document.querySelector("input[name='m_userid']")
let msg_user_id = document.querySelector("div.join.id")

if(user_id) {
	// lost focus
	// input tag에 입력하는 도중 다른 tag로 focus가 이동되는 경우
	// blur, focusout event 코드에서 alert을 사용하면 lost focus와 alert 사이에서 무한 반복이 일어나는 현상 발생함
	// lost focus가 되었을 때 메시지를 사용자에게 보이고 싶을 때는 alert을 사용하지 않고 다른 방법을 강구해야 한다
	// 비어있는 div box를 하나 만들고 그곳에 메시지를 표시하는 방법을 사용한 것
	user_id.addEventListener("blur",(e)=>{
		let m_userid = e.currentTarget.value
		
		msg_user_id.innerText = ""
		msg_user_id.style.padding = "0"
		// 패딩 주면 간격 늘어나서 빈칸 있는 것처럼 보이니까
		
		// m_userid box에 사용자 ID를 입력한 상태로
		// 		tab키를 누르거나, 다른 값을 입력하기 위하여 focus를 이동하면
		// m_userid box에 입력된 값으로 ID 중복검사 수행하기
		if(m_userid === "") {
			msg_user_id.innerText = "* 사용자 ID는 반드시 입력하세요"
			msg_user_id.style.padding = "5px"
			user_id.focus()
			return false;
		}
		
		// getter방식으로 서버에 요청
		// id_check라는 메서드있고 m_userid
		fetch("${rootPath}/member/id_check?m_userid=" + m_userid)
		// .then( (response)=> {
		//	return response.text();
		// })
		.then(response=>response.text())
		.then(result=>{
			if(result === "USE_ID") {
				msg_user_id.innerText = " * 이미 가입된 ID 입니다"
				userid.focus()
				return false
			} else if(result === "NOT_USE_ID") {
				msg_user_id.innerText = " * 가입 가능한 ID 입니다"
				msg_user_id.style.color = "gray"
				
				document.querySelector("input[name='m_password']").focus()
			} else {
				msg_user_id.innerText = " * 알 수 없는 결과를 수신함"
			}
		})
		// 리스폰스를 매개변수로 받아서 ~ 그 결과를 다시 리턴하라 ?
		
	})
}


</script>