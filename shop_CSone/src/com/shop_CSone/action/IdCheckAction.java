package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.shop_CSone.dao.MemberDAO;
// Ajax 사용!
public class IdCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userid = request.getParameter("id");
		System.out.println("id: "+userid);
		
		if(userid != null) {
			if(userid.trim().equals("") == false) {
				System.out.println("id값 제대로 받아오나요??");
				MemberDAO mDao = MemberDAO.getInstance();
				String msg = mDao.confirmID(userid);
				
				System.out.println("메세지: " +msg);
				
				// Ajax => JSON방식 -> 값을 다시 전달 JSON방식
				// request.setAttribute("idCount",msg); => 이거 안돼!
				
				// json-simple 라이브러리 필요
				JSONObject jObj = new JSONObject();
				
				jObj.put("message", msg);
				jObj.put("id", userid);
				
				// JSON 객체에 담은 데이터를 호출한 페이지로 전송한 기능
				response.setContentType("application/x-json; chareset=UTF-8");
				response.getWriter().print(jObj);
				
			}
		}
		return null;
	}
	
}
