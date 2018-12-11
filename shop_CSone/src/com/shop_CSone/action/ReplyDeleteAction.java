package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_CSone.dao.BoardDAO;
import com.shop_CSone.dao.ReplyDAO;

public class ReplyDeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String rno = request.getParameter("rno");
		System.out.println(rno);
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyDelete(rno);
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		if(result >0 ) {
			System.out.println(rno+"댓글 삭제 성공");
			// bno 게시글 reply_cnt+1증가
			BoardDAO bDao = BoardDAO.getInstance();
			bDao.boardReplyCntMinus(bno);
		} else{
			System.out.println(rno+"댓글 삭제 실패");
		}
		
		return null;
	}

}
