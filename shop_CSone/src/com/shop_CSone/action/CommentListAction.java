package com.shop_CSone.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_CSone.dao.ReplyDAO;
import com.shop_CSone.dto.ReplyDTO;

public class CommentListAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="board/commentlist.jsp";
		
		String bno = request.getParameter("bno");
		
		

		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> replyList = rDao.replyListALL(bno);
		request.setAttribute("replyList", replyList);
		
		// 현재날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
