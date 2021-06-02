package com.callor.hello.service;

import org.springframework.stereotype.Service;

/*
 * Spring 프로젝트에서 클래스를 선언하고
 * 각 클래스에 stereotype을 부착하기
 * stereotype : Component, Controller, Service, Repository ...
 * 				(Component가 제일 대장. 나머지들 다 포함함 근데 이거 쓰면 낭비임)
 * 
 * 클래스에 stereotype을 부착하는 순간
 * spring에게 이 클래스는 컨테이너에 보관해달라 라고 요청하는 것
 * 이 클래스들을 객체로 생성하여 보관하고 있어달라
 */
@Service
public class HomeService {

	public Integer add(int num1, int num2) {
		return num1 + num2;
	}
	
}
