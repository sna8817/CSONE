package com.shop_CSone.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shop_CSone.dto.MemberDTO;
import com.shop_CSone.mybatis.SqlMapConfig;

public class MemberDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	SqlSession sqlSession;
	
	private MemberDAO() {}

	private static MemberDAO instance = new MemberDAO();

	// 외부에서 getinstance()를 활용하여 1회 실시한 객체를 공유
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	// 회원가입 =  회원등록
	public int inputMember(MemberDTO mDto) {
		int result = 0;
		sqlSession =  sqlSessionFactory.openSession();
		try {
			result = sqlSession.insert("inputMember", mDto);
			// insert, update, delete 는 반드시 커밋!
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();   
		}
		return result;
	}
	
	
	// 회원가입 페이지 ID 중복 체크(Ajax)
	public String confirmID(String userid) {
		String result = "";
		sqlSession =  sqlSessionFactory.openSession();
		try {
			result = sqlSession.selectOne("confirmID", userid);
			
			if(result != null) {
				result = "-1";
			}else {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	
	
	// 비밀번호 수정페이지 현재비밀번호와 일치하는지 확인
	public String confirmPW(String id, String pw) {
		String result = "";
		sqlSession =  sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setPw(pw);
		try {
			// 두개를 넣고 싶지만 selectOne이기 때문에 DTO에 담아서 보내준다.
			// result = sqlSession.selectOne("confirmPW", id,pw);
			result = sqlSession.selectOne("confirmPW", mDto);
			
			if(result != null) {
				result = "-1";
			}else {
				result = "1";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	// 로그인 기능
	public MemberDTO LoginCheck(String userid, String userpw) {
		sqlSession =  sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(userid);
		mDto.setPw(userpw);
		try {
			mDto = sqlSession.selectOne("LoginCheck", mDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mDto;
	}
	
	
	
	// 회원정보수정(비밀번호 제외)
	public int updateMember(MemberDTO mDto) {
		int result=0;
		sqlSession =  sqlSessionFactory.openSession();
		try {
			result = sqlSession.update("updateMember", mDto);
			// insert, update, delete 는 반드시 커밋!
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	
	// 회원정보수정( 비밀번호 )
	public int updatePw(String id, String pw) {
		int result=0;
		sqlSession =  sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setPw(pw);
		try {
			result = sqlSession.update("updatePw", mDto);
			// insert, update, delete 는 반드시 커밋!
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	
	// 회원 탈퇴
	public int deleteMember(String userid) {
		int flag=0;
		sqlSession = sqlSessionFactory.openSession();
		try {
			// 값을 숫자로 받아옴
			flag = sqlSession.delete("deleteMember", userid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return flag;
	}
	
	
// =================================================================================================================
//	Connection conn = null;
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
//	/*ArrayList<ProductDTO> list = new ArrayList<>();*/
//	ArrayList<MemberDTO> list = new ArrayList<>();
//	MemberDTO mDto;
//	int result = 0;
//	
//	
//	// input- insertMember
//	public int inputMember(MemberDTO mDto) {
//		try {
//			conn= DBManager.getConnection();
//			String sql = "INSERT INTO member (id, pw, name, phone, email, zipcode, addr1, addr2) "
//					   + "VALUES(?,?,?,?,?,?,?,?) ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mDto.getId());
//			pstmt.setString(2, mDto.getPw());
//			pstmt.setString(3, mDto.getName());
//			pstmt.setString(4, mDto.getPhone());
//			pstmt.setString(5, mDto.getEmail());
//			pstmt.setString(6, mDto.getZipcode());
//			pstmt.setString(7, mDto.getAddr1());
//			pstmt.setString(8, mDto.getAddr2());
//			
//			result = pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt);
//		}
//		// = return 메서드 종료라는 뜻이다.
//		// : return을 만나면 메서드를 종료시키고 return값(=result)를 가지고 호출한 곳으로 돌아간다.
//		return result;
//	}
//	
//	
//	// login시 회원여부 체크	// id, pw - Select Where절 조건 검색후 Action단으로 이동
//	public MemberDTO LoginCheck(String uid, String upw){
//		try {
//			conn = DBManager.getConnection();
//			String sql = "SELECT * FROM member "
//					   + "WHERE id=? AND pw=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, uid);
//			pstmt.setString(2, upw);
//			
//			rs = pstmt.executeQuery();
//			System.out.println(uid+", "+upw+"!!"+rs);
//			
//			while(rs.next()){
//				System.out.println("DB탔음!!");
//				String id = rs.getString("id");
//				String pw = rs.getString("pw");
//				String name = rs.getString("name");
//				String phone = rs.getString("phone");
//				String email = rs.getString("email");
//				String zipcode = rs.getString("zipcode");
//				String addr1 = rs.getString("addr1");
//				String addr2 = rs.getString("addr2");
//				mDto = new MemberDTO(id, pw, name, phone, email, zipcode, addr1, addr2);
//				mDto.toString();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		return mDto;
//	}
//	
//	
//	
//	
//	// 회원정보 수정
//	public int updateMember(MemberDTO mDto) {
//		try {
//			conn = DBManager.getConnection();
//			String sql = "UPDATE member SET "
//					   + "pw = ?, name=?, phone=?, email=?, zipcode=?, addr1=?, addr2=? "
//					   + "WHERE id=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mDto.getPw());
//			pstmt.setString(2, mDto.getName());
//			pstmt.setString(3, mDto.getPhone());
//			pstmt.setString(4, mDto.getEmail());
//			pstmt.setString(5, mDto.getZipcode());
//			pstmt.setString(6, mDto.getAddr1());
//			pstmt.setString(7, mDto.getAddr2());
//			pstmt.setString(8, mDto.getId());
//			
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt);
//		}
//		
//		return result;
//	}
//	
//	
//	// Ajax사용
//	public String confirmID(String userid) {
//		String msg = "";
//		try {
//			conn = DBManager.getConnection();
//			String sql = "SELECT id FROM member "
//					   + "WHERE id=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, userid);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				// 중복된 아이디
//				msg = "-1";
//			} else {
//				msg = "1";
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		return msg;
//	}
//	
//	
//	// ajax --> 현재 비밀번호 맞는지 확인
//	public int confirmPW(String userid, String userpw) {
//		try {
//			conn = DBManager.getConnection();
//			String sql = "SELECT id, pw FROM member "
//					   + "WHERE id=? AND pw=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, userid);
//			pstmt.setString(2, userpw);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				result= -1;
//			}else {
//				result= 1;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		
//		return result;
//	}
//	
//	
//	
//	
//	
//	// pw 수정
//	public int updatePw(String userid, String userpw) {
//		try {
//			conn = DBManager.getConnection();
//			String sql = "UPDATE member SET "
//					   + "pw = ? "
//					   + "WHERE id=? ";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, userpw);
//			pstmt.setString(2, userid);
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt);
//		}
//		
//		return result;
//	}
	
	
	
	
	
}
