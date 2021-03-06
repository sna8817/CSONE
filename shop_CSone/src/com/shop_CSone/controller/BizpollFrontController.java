package com.shop_CSone.controller;
// Servlet (DO SERVICE)
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_CSone.action.ActionForward;
import com.shop_CSone.action.BoardDeleteAction;
import com.shop_CSone.action.BoardDetailAction;
import com.shop_CSone.action.BoardDownloadAction;
import com.shop_CSone.action.BoardInsertAction;
import com.shop_CSone.action.BoardInsertPlayAction;
import com.shop_CSone.action.BoardListAction;
import com.shop_CSone.action.BoardSearchAction;
import com.shop_CSone.action.BoardUpdateAction;
import com.shop_CSone.action.BoardUpdatePlayAction;
import com.shop_CSone.action.BoardViewcntAction;
import com.shop_CSone.action.CommentListAction;
import com.shop_CSone.action.ConstractAction;
import com.shop_CSone.action.IdCheckAction;
import com.shop_CSone.action.IndexAction;
import com.shop_CSone.action.LoginAction;
import com.shop_CSone.action.LoginOutPlayAction;
import com.shop_CSone.action.LoginPlayAction;
import com.shop_CSone.action.MemberAction;
import com.shop_CSone.action.MemberDeletePlayAction;
import com.shop_CSone.action.MemberDrawAction;
import com.shop_CSone.action.MemberUpdateAction;
import com.shop_CSone.action.MemberUpdatePlayAction;
import com.shop_CSone.action.MemberplayAction;
import com.shop_CSone.action.PwCheckAction;
import com.shop_CSone.action.MemberpwPlayAction;
import com.shop_CSone.action.PwPlayAction;
import com.shop_CSone.action.ReplyDeleteAction;
import com.shop_CSone.action.ReplyInsertAction;
import com.shop_CSone.action.productDetailAction;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

import com.shop_CSone.action.Action;

/**
 * Servlet implementation class BizpollFrontController
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BizpollFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET, POST 둘다 받음
		
		// 한글깨짐 방지(POST방식): 가장 위에 적어주세요.
		request.setCharacterEncoding("UTF-8");
		
		Action action = null;              // 실제 동작하는 부분
		ActionForward forward = null;      // forward, sendRedirect 설정
		
		// uri = /fcryan/index.bizpoll
		// ctx = /fcryan
		// command = /index.bizpoll
		// uri - ctx = 내가 원하는 Action 경로
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		
		System.out.println("uri: "+uri);
		System.out.println("ctx: "+ctx);
		System.out.println("페이지이동==============> "+command);
		
		// Action단 이동
		if(command.equals("/index.bizpoll")) { // 메인페이지 이동
			action = new IndexAction(); // 객체 생성
			forward = action.excute(request, response); // 객체(인스턴스) 사용
			// Web에서는 무조건 request, response를 매개변수로 받아야함.
		} else if(command.equals("/constract.bizpoll")) { // 이용약관 이동
			action = new ConstractAction();
			forward = action.excute(request, response);
		} else if(command.equals("/member.bizpoll")) { // 회원가입 페이지 이동
			action =  new MemberAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberplay.bizpoll")) { // 회원가입 -> 실행
			action = new MemberplayAction(); // 객체 생성
			forward = action.excute(request, response); // 함수 실행!
		} else if(command.equals("/login.bizpoll")) { // 로그인 페이지 이동
			action = new LoginAction();
			forward = action.excute(request, response);
		} else if(command.equals("/LoginPlay.bizpoll")) { //로그인 기능
			action = new LoginPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/loginOut.bizpoll")) { // 로그아웃 기능
			action = new LoginOutPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberUpdate.bizpoll")) { // 회원수정 페이지 이동
			action = new MemberUpdateAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberupdateplay.bizpoll")) { // 회원 수정 ->실행
			action = new MemberUpdatePlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/idCheck.bizpoll")){ // 아이디 확인
			action = new IdCheckAction();
			forward = action.excute(request, response);
		} else if(command.equals("/pwCheck.bizpoll")) { // 비밀번호 확인
			action = new PwCheckAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberpwplay.bizpoll")) { // 비밀번호 변경->실행
			action = new MemberpwPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/pwUpdate.bizpoll")) { // 비밀번호 변경 페이지 이동
			action = new PwPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberdraw.bizpoll")) { // 회원 탈퇴 이동
			action = new MemberDrawAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberdeleteplay.bizpoll")) { // 회원 탈퇴 -> 실행
			action = new MemberDeletePlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardList.bizpoll")) { // 게시판의 게시글 목록 조회 + 검색기능 + 페이지네이션
			action = new BoardListAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardSearch.bizpoll")) { // 게시글 검색기능 << boardList에 합쳤다(필요없음)
			action = new BoardSearchAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardDetail.bizpoll")) { // 상세 게시글
			action = new BoardDetailAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardViewcnt.bizpoll")) { // 조회수
			action = new BoardViewcntAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardinsert.bizpoll")) { // 게시글 등록 페이지 이동
			action = new BoardInsertAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardInsertPlay.bizpoll")) { // 게시글 등록 ->실행
			action = new BoardInsertPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/download.bizpoll")) { // 파일 다운로드 기능
			action = new BoardDownloadAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardupdate.bizpoll")) { // 게시글 수정 페이지 이동
			action = new BoardUpdateAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boarddelete.bizpoll")) { // 게시글 삭제 
			action = new BoardDeleteAction();
			forward = action.excute(request, response);
		} else if(command.equals("/boardUpdatePlay.bizpoll")) { // 게시글 수정 DB연동->실행
			action = new BoardUpdatePlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/commentlist.bizpoll")) { // 댓글 목록 조회
			action = new CommentListAction();
			forward = action.excute(request, response);
		} else if(command.equals("/replyDelete.bizpoll")) { // 댓글 삭제
			action = new ReplyDeleteAction();
			forward = action.excute(request, response);
		} else if(command.equals("/replyinsert.bizpoll")) { // 댓글 입력
			action = new ReplyInsertAction();
			forward = action.excute(request, response);
		} else if(command.equals("/productBiewcnt.bizpoll")) { // 상품 페이지
			action = new productDetailAction();
			forward = action.excute(request, response);
		}
 


		
		// 공통 분기작업(페이지 이동)
		if(forward != null) {
			if(forward.isRedirect()) { // true: sendRedirect 방식
				response.sendRedirect(forward.getPath());
			} else { // false: forward 방식
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath()); // 목적지: "index.jsp"
				// 짐: bestlist
				// 이동수단: forward
				rd.forward(request, response);
			}
		}
		
		
	}

}
