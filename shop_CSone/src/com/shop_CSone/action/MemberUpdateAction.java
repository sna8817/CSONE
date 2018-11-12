package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="member_update.jsp";
		
		// 회원정보 수정을 하려면 반드시 조건이 있다!
		// 선행조건: 가입된 회원 = login이 되어있어야 한다!
		// : session이 null 이 아니면 = login!
		
		HttpSession session = request.getSession(); // sesssion 값 취득
		if(session.getAttribute("loginUser") == null ) { // 로그인 안 된 경우
			url = "index.bizpoll";
		} else { // 로그인 된 경우
			url="member_update.jsp";
			// DB타서 select하면 되지만 현재 session값에 저장되어있기 때문에, session값 이용
			
		}
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		
		return forward;
	}

}
