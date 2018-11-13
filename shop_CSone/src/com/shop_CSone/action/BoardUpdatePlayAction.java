package com.shop_CSone.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop_CSone.common.Constants;
import com.shop_CSone.dao.BoardDAO;
import com.shop_CSone.dto.BoardDTO;

public class BoardUpdatePlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="boardList.bizpoll";
		
		// multipart를 사용하기 위해서는
		// cos.jar라는 라이브러리가 필요함.
		
		// 파일 업로드 처리
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();			
		}
		
		// request를 확장시킨 MultipartRequest 생성
		MultipartRequest multi =  new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "UTF-8", new DefaultFileRenamePolicy());
		
		int bno = Integer.parseInt(multi.getParameter("bno"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		
		String filename = " "; // (공백)
		int filesize = 0;
		
		String nowfile = multi.getParameter("now-file-name");
		String postfile = multi.getParameter("post-file-name");
		
		System.out.println(bno+","+title+", "+content+", "+writer+","+postfile+","+nowfile);
		
		// 파일 삭제하기
		if(!postfile.equals(nowfile)) {
			System.out.println("");
			File file = new File(Constants.UPLOAD_PATH+postfile);
			file.delete();
		}
		
		System.out.println("파일삭제!!!!!"+bno+","+title+", "+content+", "+writer+","+postfile+","+nowfile);
		
		
		
		try {
			Enumeration files = multi.getFileNames();
			
			while(files.hasMoreElements()) {
				String file1 = (String)files.nextElement();
				filename = multi.getFilesystemName(file1);
				File f1 = multi.getFile(file1);
				
				if(f1 != null) {
					filesize = (int)f1.length(); // 파일 사이즈 저장
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(filename == null || filename.trim().equals("")) {
			filename="-";
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(bno, title, content, writer, filename, filesize);
		int result = bDao.boardUpdate(bDto);
		
		System.out.println("바뀐거@@@@@@@@@@@"+bDto.toString());
		System.out.println(bDto.getBno());
		
		if(result > 0) { // 등록 성공
			System.out.println("게시글 수정 성공");
		} else { // 등록 실패
			System.out.println("게시글 수정 실패");
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		
		return forward;
	}

}
