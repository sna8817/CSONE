package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PwPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url="pw_update.jsp";
		
		// ActionForward 객체 생성, forward 인스턴스 생성
		ActionForward forward = new ActionForward();
		// ActionForward 클래스의 setPath()함수를 호출하고, url값을 매개변수로 전달
		forward.setPath(url);
		// ActionForward 클래스의 setRedirect()호출하고, true라고 하는 boolean값을 매개변수로 전달
		forward.setRedirect(false);
				
				
		return forward;
	}

}
