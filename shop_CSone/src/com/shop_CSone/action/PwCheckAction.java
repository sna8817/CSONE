package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.shop_CSone.dao.MemberDAO;

public class PwCheckAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ajax는 페이지 이동을 하지 않기 때문에 url 삭제
		
		// ajax의 pw값 받아오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("id: "+id);
		System.out.println("pw: "+pw);
		
		// DB에서 pw값 가지고 와서 비교
		// SELECT pw FROM member
		// WHERE id = ?;
		// id값은 session에 저장되어있음
		
		// id값을 구하는 방법 2가지(session)
		// 1. Controller단에서 Session객체 호출해서 ID값 빼오는 방법
		// 2. View단에서 Session에 담겨있는 id값을 pw값과 함께 보내는 방법
		
		MemberDAO mDao = MemberDAO.getInstance();
		String result = mDao.confirmPW(id, pw);
		
		JSONObject jObj = new JSONObject();
		jObj.put("message", result);
		
		// JSON 객체에 담은 데이터를 호출한 페이지로 전송한 기능
		response.setContentType("application/x-json; chareset=UTF-8");
		response.getWriter().print(jObj);
		
		
		// 나를 호출한 곳으로 돌아가기 때문에 null값을 넣어주면 bizpollFrontController의 forward에 null값이 들어가기 때문에 공통분기작업(페이지이동)이 실행되지 않는다!
		return null;		
	}

}
