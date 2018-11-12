package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.shop_CSone.dao.MemberDAO;
import com.shop_CSone.dto.MemberDTO;

public class LoginPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Session 생성
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id+", "+pw);
		
		// DAO 클래스에 LoginCheck()메서드를 활용하여
		// id와 pw값으로 Select절에 Where 조건으로 검색후,
		// (ArrayList)결과값을 가지고 현재 지금 이곳 Action단으로 돌아오는 코드를 작성
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.LoginCheck(id,pw);
		
		String message = null;
		
		if(mDto != null) {
			System.out.println("로그인성공");
			// session 값에 login된 회원정보를 담아야함
			session.removeAttribute("id"); // 혹시 모를 기존에 남아있는 값을 제거
			session.setAttribute("loginUser", mDto);
			message="1";
		} else {
			System.out.println("로그인 실패");
			message = "-1";
		}
		JSONObject jObj = new JSONObject();
		jObj.put("message", message);
		response.setContentType("application/x-json; charest=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
	}

}
