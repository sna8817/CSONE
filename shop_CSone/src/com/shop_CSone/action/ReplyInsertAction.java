package com.shop_CSone.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_CSone.dao.BoardDAO;
import com.shop_CSone.dao.ReplyDAO;
import com.shop_CSone.dto.ReplyDTO;

public class ReplyInsertAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String writer = request.getParameter("reply_writer");
		String content = request.getParameter("reply_text");
		int bno = Integer.parseInt(request.getParameter("re_bno"));
		System.out.println(writer+", "+content+", "+bno);
		
		// bno 게시글에 댓글 등록
		ReplyDAO rDao = ReplyDAO.getInstance();
		ReplyDTO rDto = new ReplyDTO(content, writer, bno);
		int result = rDao.replyInsert(rDto);
		
		// bno 게시글 reply_cnt+1증가
		/*BoardDAO bDao = BoardDAO.getInstance();
		bDao.boardReplyCntPlus(bno);*/
		
		if(result > 0) {
			System.out.println("댓글 등록 성공");
		} else {
			System.out.println("댓글 등록 실패");
		}
		
		return null;
	}

}
