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
import com.sun.corba.se.impl.orbutil.closure.Constant;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_COLOR_BURNPeer;

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
		// MultipartRequest는 파일등록 후 수정으로 파일을 덮어쓰운다.
		MultipartRequest multi =  new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, "UTF-8", new DefaultFileRenamePolicy());
		
		String sBno = multi.getParameter("bno");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		
		String filename = " "; // (공백)
		int filesize = 0;
		
		String nowFileName = multi.getParameter("now-file-name");
		String nFileSize = multi.getParameter("now-file-size");
		
		System.out.println(sBno+","+title+", "+content+", "+writer+","+nowFileName+","+nFileSize);
		
		// nowFileSize 숫자로 변환
		// 값이 없으면 0부여, 값이 있으면 숫자로 변환
		int nowFileSize = 0;
		if(!nFileSize.equals("")) {
			nowFileSize = Integer.parseInt(nFileSize);
		}
		
		// 과거 filename과 filsize 불러오기
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.boardDetailView(sBno);
		String pfilename = bDto.getFilename();
		//String pfilesize = String.valueOf(bDto.getFilesize());
		int pfilesize = bDto.getFilesize();
		System.out.println("과거 첨부파일: "+pfilename+", "+pfilesize);
		System.out.println("현재 첨부파일: "+nowFileName+", "+nowFileSize);
		
		
		int flag = 0;
		if(nowFileName.equals(pfilename) && nowFileSize == 0) {
			// 파일이름이 같으면서 사이즈가 같거나  또는 사이즈가 0이면, 파일 지우지 않음, filename과 filesize도 수정하면 안됨.
			flag = 1;
		} else {
			// 아니면 삭제!
			File file = new File(Constants.UPLOAD_PATH+pfilename);
			file.delete();
		}
		
		
		try {
			// multi에서 첨부파일을 하나쓰지만 나중에는 다중으로 쓸 수 있기 때문에 files는 배열로 차곡차곡 넣을 수 있음!
			Enumeration files = multi.getFileNames();
			
			// 배열들을 하나씩 반복해서 꺼내기
			while(files.hasMoreElements()) { // 한칸 공간에 값이 있으면 true, 아니면 false
				// 파일 이름 바꾸기
				String file1 = (String)files.nextElement();
				System.out.println("file1: "+file1);
				          // multi.getOriginalFilName(file1) 이면 그냥 오리지날 파일 네임
				filename = multi.getFilesystemName(file1); // 첨부파일의 파일이름 <- 파일 네임을 가지고 오나, 중복이면 중복정책이 부여된 값을 가져옴
				System.out.println("저장된 첨부파일: "+filename);
				
				// 이름은 같지만 사이즈는 0이 아닐 경우
				if(nowFileSize != 0) {
					//       (중복정책이 부여된 현재 파일이름 AAA1  -  기존의 파일이름AAA)
					String result = filename.substring(nowFileName.length());
					System.out.println("TEST: "+nowFileName+", "+filename+", "+result);
					
					// 파일명을 현재 파일명으로 수정!
					if(result.length() > 0) {
						File file = new File(Constants.UPLOAD_PATH + filename); // AAA1
						File fileNew = new File(Constants.UPLOAD_PATH + nowFileName); //AAA
						file.renameTo(fileNew); // AAA1 -> AAA로 이름 변경
						
						// DB에 넣을 정보 (DB에 수정된 값을 넣어준다)
						filename = nowFileName;
						filesize = nowFileSize; 
					}
				}
				
				File f1 = multi.getFile(file1); // 첨부파일의 파일
				if(f1 != null) { // f1은 AAA1으로 가져오기 때문에 AAA로 수정하였으니, AAA의 파일사이즈 수정
					filesize = nowFileSize; // 파일 사이즈 저장
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(filename == null || filename.trim().equals("")) {
			filename="-";
		}
		
		if(flag == 1) { // 업데이트 되지 않게 설정
			filename ="no";
		}
		
		int bno = Integer.parseInt(sBno);
		bDto = new BoardDTO(bno, title, content, writer, filename, filesize);
		int result = bDao.boardUpdate(bDto);
		
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
