package com.shop_CSone.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_CSone.dao.BoardDAO;
import com.shop_CSone.dto.BoardDTO;

public class BoardDeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "boardList.bizpoll";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("====>bno"+bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(bno);
		
		// 게시글 삭제
		int result = bDao.boardDelete(bno);
	
		System.out.println("바뀐거@@@@@@@@@@@"+bDto.toString());
		System.out.println(bDto.getBno());
		
		if(result > 0) { // 삭제 성공
			System.out.println("게시글 삭제 성공");
		} else { // 삭제 실패
			System.out.println("게시글 삭제 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		
		return forward;
	}
	
}
