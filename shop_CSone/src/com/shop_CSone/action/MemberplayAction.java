package com.shop_CSone.action;
	
import java.io.IOException;
	
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	
import com.shop_CSone.dao.MemberDAO;
import com.shop_CSone.dto.MemberDTO;
	
public class MemberplayAction implements Action{
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="welcome_join.jsp"; // url이라는 변수안에 값만 담아놓을 뿐, 페이지 이동 기능 X
		
		// View단에서 전송한 데이터를 받아오세요.
		String id = request.getParameter("inputid");
		String pw = request.getParameter("inputpw");
		String name = request.getParameter("inputname");
		String phone = request.getParameter("inputphone");
		String email_id = request.getParameter("email_id");
		String email_url = request.getParameter("email_url");
		String email = email_id +"@"+ email_url;
		String zipcode = request.getParameter("sample6_postcode");
		String addr1 = request.getParameter("sample6_address");
		String addr2 = request.getParameter("sample6_address2");
		
		
		MemberDTO mDto = new MemberDTO(id, pw, name, phone, email, zipcode, addr1, addr2);
		System.out.println(mDto.toString());
		
		// mybatis
		MemberDAO mDao = MemberDAO.getInstance(); //= MemberDAO클래스의 insertMember() 메서드를 호출하고, View단에서 전달한 데이터를 mDto에 담아 보낸다.
		
		// 싱글톤 패턴 사용 ⇒  메모리효율
		// 객체생성은 한번만 이루어지고
		// 나머지는 생성도니 객체를 빌려 쓰는 형태로 작성됨
		int result = mDao.inputMember(mDto);
		
		response.setContentType("text/html; charset=UTF-8"); // 한글깨짐 방식
		
		if(result > 0) {
			System.out.println("성공");
			/*response.sendRedirect("index.jsp");*/
		} else {
			System.out.println("실패");
			/*response.sendRedirect("member_join.jsp");*/
		}
		
		// ActionForward 객체 생성, forward 인스턴스 생성
		ActionForward forward = new ActionForward();
		// ActionForward 클래스의 setPath()함수를 호출하고, url값을 매개변수로 전달
		forward.setPath(url);
		// ActionForward 클래스의 setRedirect()호출하고, true라고 하는 boolean값을 매개변수로 전달
		forward.setRedirect(true);
		
		return forward;
	}
	
}	
