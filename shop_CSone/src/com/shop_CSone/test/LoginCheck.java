package com.shop_CSone.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.shop_CSone.dao.MemberDAO;

public class LoginCheck {

	@Test
	public void testLoginCheck() {
		String id = "def456";
		String pw = "asd123456";

		MemberDAO mDao = MemberDAO.getInstance();
		mDao.LoginCheck(id, pw);
	}

}
