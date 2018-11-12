package com.shop_CSone.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_CSone.dao.ProductDAO;
import com.shop_CSone.dto.ProductDTO;

// Class
public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String url = "index.jsp";
		
// =======================================================================================
// 기존의 동작 소스들 
		
		// 동작하는 부분
		// : Best 상품을 출력 => Best 상품을 DB에서 조회
		// Model단 이동(DAO)
		
		// productDAO클래스 객체 선언
		//ProductDAO pDao = new ProductDAO();
		// productDTO 타입의 ArrayList객체 생성
		//ArrayList<ProductDTO> bestlist = new ArrayList<>();
		// ProductDAO 클래스의 bestView() 메서드를 호출
		// 메서드 실행 후 return 값을 bestlist 변수에 담는다.
		//bestlist = pDao.bestView(); // best 상품 목록 
		
		// View단으로 전송할 데이터를 담는다.
		//                  ("이름표", 실제값)
		// request.setAttribute("bestlist", bestlist);
		// 적재만 한 상태(담아두기만 한 상태)
		
/*		for (ProductDTO productDTO : bestlist) {
			System.out.print(productDTO.getP_code()+"\t");
			System.out.print(productDTO.getP_name()+"\t");
			System.out.print(productDTO.getP_price()+"\t");
			System.out.print(productDTO.getP_img()+"\t");
			System.out.print(productDTO.getP_indate()+"\t");
			System.out.println();
		}*/
		
		/*pDao.bestView();*/
		
// =============================================================================================		
// MyBatis
		
		
		// 싱글톤 패턴
		ProductDAO pDao = ProductDAO.getInstance();
		List<ProductDTO> bestList = pDao.bestView();
		List<ProductDTO> newList = pDao.newView();
		request.setAttribute("bestlist", bestList);
		request.setAttribute("newlist", newList);
		
		
		// ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		// ActionForward 클래스에 setpath() 메서드를 호출
		// 매개변수로 url값("index.jsp")을 전송
		forward.setPath(url);       // index.jsp로 이동
		// ActionForward 클래스에 SetRedirect 메서드를 호출
		// 매개변수로 boolean 타입의 false값을 전송
		forward.setRedirect(false); // forward방식을 사용한다
		
		// forward 객체를 가지고 bizpllFrontController의 if문의 forward로 되돌아감
		return forward;
	}
	
}
