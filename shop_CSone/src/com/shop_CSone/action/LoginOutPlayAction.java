package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOutPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="index.bizpoll";
		// .jps는 화면단만 출력 <- Model단의 데이터X; .bizpoll은 데이터를 담고 있음! 
		
		// session을 가져옴
		HttpSession session = request.getSession();
		
		// session값을 못 가져올 경우를 대비하여 ⇒ if문으로 session값 초기화를 넣어준다
		if(session != null ) {
			// session을 초기화 => 로그인 정보 삭제
			session.invalidate();
		}
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		
		return forward;
	}

}
