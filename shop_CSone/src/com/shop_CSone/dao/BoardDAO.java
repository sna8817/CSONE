package com.shop_CSone.dao;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthScrollBarUI;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shop_CSone.common.Constants;
import com.shop_CSone.dto.BoardDTO;
import com.shop_CSone.dto.CriteriaDTO;
import com.shop_CSone.mybatis.SqlMapConfig;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;

	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// 게시판 목록 조회
	public List<BoardDTO> boardListAll(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = new ArrayList<>();
		
		try {
			list = sqlSession.selectList("boardList", criDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	// 게시판 페이지네이션
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.selectOne("countPaging", criDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
		
	}
	
	// 게시판 찾기(검색)
	public List<BoardDTO> boardSearch(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = new ArrayList<>();
		
		try {
			list = sqlSession.selectList("SearchList", criDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	// 게시판 View(클릭)
	public BoardDTO boardDetailView(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		BoardDTO bDto = null;
		try {
			bDto = sqlSession.selectOne("boardDetailView", bno);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return bDto;
		
	}
	
	
	// 게시판 조회시 조회수 증가
	public void viewCnt(String bno, HttpSession countSession) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			long update_time = 0;
			int result = 0;
			// 조회수를 증가할 때 생기는 read_time_게시글번호가 없으면
			// 현재 처음 조회수를 1증가하는 경우
			if(countSession.getAttribute("read_time_"+bno) != null) {
				update_time = (long)countSession.getAttribute("read_time_"+bno);
			}
			
			// 현재 시간을 담는다
			long current_time = System.currentTimeMillis();
			
			// 현재시간과 조회수 1 증가한 시간을 비교해서 24시간 (1일) 지났으면 조회수 1 증가
			if(current_time - update_time > 24*60*60*1000) {
				result = sqlSession.update("viewCnt", bno);
				sqlSession.commit();
				
				// 조회수 1증가한 시간을 session에 담는다.
				countSession.setAttribute("read_time_"+bno, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
	}
	
	
	// 게시판 insert
	public int boardInsert(BoardDTO bDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.insert("boardInsert",bDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
		
	}
	
	
	// 게시판 수정
	public int boardUpdate(BoardDTO bDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.update("boardUpdate",bDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
		
	}
	
	
	// 게시판 삭제
	public int boardDelete(int bno) {
		String rbno = Integer.toString(bno);
		//BoardDTO bDto = boardDetailView(rbno);
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.delete("boardDelete", rbno);
			/*
			System.out.println("bno삭제"+result);

			// 댓글 삭제
			if(result != 0) {
				ReplyDAO rDao = ReplyDAO.getInstance();
				result = rDao.replyDeleteAll(rbno);
				
				// 파일 삭제
				if(bDto.getFilesize()!=0) {
					File file = new File(Constants.UPLOAD_PATH+bDto.getFilename());
					file.delete();
				}
				
			sqlSession.commit();
			System.out.println("commit 후의 result"+result);
			}
			*/
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		System.out.println("다 끝난 후의"+result);
		return result;
	}
	
	
}
