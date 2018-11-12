package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop_CSone.dao.BoardDAO;

public class BoardViewcntAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String bno = request.getParameter("bno");
		String url="boardDetail.bizpoll?bno="+bno;
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		// 조회수 1증가
		// Session을 활용한 조회수 증가방지
		HttpSession session = request.getSession();
		bDao.viewCnt(bno, session);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
