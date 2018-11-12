package com.shop_CSone.action;
// Class
public class ActionForward {
	
	// View Page(결과값을 어디로 전송할지)
	private String path; // "index.jsp"
	
	// 페이지 이동하는 방법 (sendRedirect, Forward)
	// true -> sendRedirect, false -> forward
	private boolean isRedirect;

	public String getPath() {
		return path;
	}

	public void setPath(String path) { // path = "index.jsp"
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
