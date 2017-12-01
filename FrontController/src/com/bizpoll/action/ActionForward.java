package com.bizpoll.action;

public class ActionForward {
	//view page 결과값을 어디로 넘길지 정함.
	private String path;
	//페이지 넘길때 2가지 방법(sendRedirect, Forward)
	//true=>sendRedirect , false=>forward
	private boolean isRedirect;

	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
