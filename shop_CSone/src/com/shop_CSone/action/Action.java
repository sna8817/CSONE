package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 인터페이스
public interface Action {
	// Action: 인터페이스
	
	// 추상메서드 => 강제성!
	// forward, sendRedirect 결정 -> ActionForward
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	
}
