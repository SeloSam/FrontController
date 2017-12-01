package com.bizpoll.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		HttpSession session=request.getSession(false);
		//true(defalut)
		//Session을 반환, 만약 세션이 존재하지 않을 경우 새로운 세션 생성
		
		//false
		//Session을 반환, 만약 세션이 존재하지 않을 경우 null 반환
		
		String url="index.bizpoll";
		
		if(session != null){
			session.invalidate();//값 초기화 해라
		}
	
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);//forward 방식으로 보냄
		
		return forward;
	}

}
