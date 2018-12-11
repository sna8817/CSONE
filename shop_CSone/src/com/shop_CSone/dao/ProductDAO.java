package com.shop_CSone.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shop_CSone.dto.ProductDTO;
import com.shop_CSone.mybatis.SqlMapConfig;

public class ProductDAO {
	
	// MyBatis 셋팅값 호출
	// SqlMapConfig.getSqlSession() = static 생성자이기 때문에 new쓰지 않고도 사용가능, class명.호출할 객체();
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	// mapper에 접근하기 위한 SqlSession
	// 변수 선언
	SqlSession sqlSession;
	
	// 싱글톤으로 new 없이 사용하기 때문에 다른곳에서 new로 객체생성 못하게 private로 막음
	private ProductDAO() {}

	// 싱글톤 패턴 - 객체생성 1회 실시 후 공유해서 사용
	// 객체생성 1회 실시
	private static ProductDAO instance = new ProductDAO();
	
	// 공유의 개념으로 
	// 외부에서 getInstance()를 활용하여 1회 실시한 객체를 공유
	public static ProductDAO getInstance() {
		return instance;
	}
	
	
	
	
	// 실제 동작 부분
	// Best 상품목록 출력(Index 페이지)
	public List<ProductDTO> bestView(){
		sqlSession = sqlSessionFactory.openSession();
		List<ProductDTO> bestList = null;
		
		try {
			bestList = sqlSession.selectList("bestView"); // while(rs.next)와 같은 코드를 작성하지 않아도 알아서 담아준다.
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return bestList;
	}
	
	
	// 신상품 목록 출력
	public List<ProductDTO> newView(){
		sqlSession = sqlSessionFactory.openSession();
		List<ProductDTO> newList = null;
		
		try {
			newList = sqlSession.selectList("newView"); // while(rs.next)와 같은 코드를 작성하지 않아도 알아서 담아준다.
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return newList;
	}
	
	
	// 상품 페이지 이동
	public ProductDTO ProductDetailView(int p_code) {
		sqlSession = sqlSessionFactory.openSession();
		ProductDTO pDto = null;
		
		try {
			pDto = sqlSession.selectOne("ProductDetailView",p_code);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return pDto;
	}
	
	
	
	
	
	
	
	
// ============================================================================================
// mybatis 사용하기 전 DBManager와 PrepareStatement 방식으로 구현한 DAO 객체!
//	Connection conn = null;
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
//	ArrayList<ProductDTO> list = new ArrayList<>();
//	int result = 0;
//	
//	public ArrayList<ProductDTO> bestView(){
//		try {
//			conn = DBManager.getConnection();
//			String sql = "SELECT * FROM best_pro_view";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				String p_code = rs.getString("p_code");
//				String p_name = rs.getString("p_name");
//				int p_price = rs.getInt("p_price");
//				String p_img = rs.getString("p_img");
//				Date p_indate = rs.getDate("p_indate");
//				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price, p_img, p_indate);
//				list.add(pDto);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		
//		return list;
//	}
//	
}
