package com.bizpoll.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.resources.HttpserverMessages;

//커맨드에서 모든 action 작업을 처리할때 ACtion 메서드를 재정의해서 사용해야댐

public interface Action {
	//excute 추상메서드 선언
	//return 타입 ActionForward(forward 또는 sendRedirect)
	
	public abstract ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	
}
