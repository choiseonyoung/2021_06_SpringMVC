<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" /><!DOCTYPE html>

<form id="input_form" method=POST enctype="multipart/form-data">

	<section id="input_left">
		<div class="input_box">
			<label>작성자</label>
			<input name="g_writer" value="${CMD.g_writer}">
		</div>
		<div class="input_box">
			<label>작성일자</label>
			<input name="g_date" value="${CMD.g_date}">
		</div>
		<div class="input_box">
			<label>작성시각</label>
			<input name="g_time" value="${CMD.g_time}">
		</div>
		<div class="input_box">
			<label>제목</label>
			<input name="g_subject">
		</div>
		<div class="input_box">
			<label>내용</label>
			<textarea name="g_content"></textarea>
		</div>
	</section>
	
	<section id="input_right">
		<div class="input_img_box">
			<label>대표이미지</label>
			<input type="file" name="one_file"/>
		</div>
		<div class="input_img_box">
			<label>갤러리</label>
			<input type="file" multiple="multiple" name="m_file"/>
		</div>
		<button id="btn_send">전 송</button>
	</section>
	
</form>