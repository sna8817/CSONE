package com.shop_CSone.mybatis;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
// ibatis --> mybatis로 이름을 바꿈 --> 때문에 import부분은 ibatis로 되어있다!!
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	// static -> 항상 사용 -> 공유의 목적
	// mybatis의 핵심
	// sqlSessionFactory 변수 선언  , 아직 기능 no
	private static SqlSessionFactory sqlSessionFactory; //sqlSessionFactory는 mybatis를 쓰기 위한 객체
	
	static {
		// resuource라는 변수를 선언
		// 변수에 com/shop_CSone/mybatis/Configuration.xml라는 텍스트를 넣음 , 아직 기능 no
		String resource = "com/shop_CSone/mybatis/Configuration.xml";
		
		// DB와 입출력(io)할때는 무조건 try~catch문 써야함 , 여기는 io
		try {
			// JAVA 입출력 객체
			// getResourceAsReader = resource라는 파일을 읽어옴
			// reader에 다 담아져있음 -> Configuration.xml를 담아옴 (Configuration.xml여기에는 CSoneMapper.xml과 db.properties도 담겨져 있음)
			Reader reader = Resources.getResourceAsReader(resource);
			
			// mybatis 사용을 하지 않고 있다면,
			if(sqlSessionFactory == null) {
				// sqlSessionFactory라는 객체안에 = reader라는 값을 가지고, build해서 객체생성 하겠다
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// getSqlSession()를 호출해서 쓰면, 
	// sqlSessionFactory를 반환해서 가지고 온다. 즉, db에 관련된 mybatis 환경설정을 모두 쓸 수 있다.
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
