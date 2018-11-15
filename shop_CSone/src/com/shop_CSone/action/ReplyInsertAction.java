package com.shop_CSone.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_CSone.dao.BoardDAO;

public class ReplyInsertAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="";
		
		String writer = request.getParameter("reply_writer");
		String content = request.getParameter("reply_text");
		System.out.println(writer+", "+content);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		
		return forward;
	}

}
