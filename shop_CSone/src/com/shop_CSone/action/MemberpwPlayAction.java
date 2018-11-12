package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_CSone.dao.MemberDAO;

public class MemberpwPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="";
		
		// 비밀번호 변경
		String pw = request.getParameter("input_rpw");
		// 새비밀번호
		System.out.println("변경할 PW=" + pw);
		
		// id값은 session에 저장되어있음
		
		// id값을 구하는 방법 form 태그로 싸여있기 때문에-> 쿼리스트링이 아니기에 가져올수 없다
		// id값도 form의 input 태그로 싸여서 보내준다.
		String id = request.getParameter("updateId");
		System.out.println("변경할 ID= "+id);
		
		// 값을 못받아온다
		// 1. getParameter(""); 매개변수가 name값으로 설정돼있는지 확인한다.
		// 2. 현재 Action단으로 이동한느지 체크
		// - console창에 *.bizpoll이 출력되는지 확인한다
		// 가) 안탐
		// : 화면단으로 가서 form태그에 action 속상값, submit() 등을 확인
		// 나) 탐
		// : 
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.updatePw(id, pw);
		
		if(result>0) {
			System.out.println("pw 수정 성공");
			url = "index.bizpoll";
		} else {
			System.out.println("pw 수정 실패");
			url = "memberPw.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
