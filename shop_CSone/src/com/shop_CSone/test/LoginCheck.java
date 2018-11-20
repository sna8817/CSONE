package com.shop_CSone.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.shop_CSone.dao.MemberDAO;
import com.shop_CSone.dto.MemberDTO;

public class LoginCheck {

	@Test
	public void testLoginCheck() {
		String id = "def456";
		String pw = "asd123456";

		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.LoginCheck(id,pw);
		
		if(mDto != null) {
			System.out.println("로그인성공");
		} else {
			System.out.println("로그인 실패");
		}
	}

}
