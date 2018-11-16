package com.shop_CSone.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.shop_CSone.dao.MemberDAO;

public class IdCheckTest {

	String userid = "def456";
	@Test
	public void testConfirmID() {
		MemberDAO mDao = MemberDAO.getInstance();
		
		mDao.confirmID(userid);
	}

}
