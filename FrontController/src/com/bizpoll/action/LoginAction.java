package com.bizpoll.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.bizpoll.dao.Cm160DAO;
import com.bizpoll.dto.Cm160DTO;

public class LoginAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session=request.getSession(true);		
		String id=request.getParameter("id").trim();
		String pw=request.getParameter("pw").trim();
		Cm160DAO cDao = new Cm160DAO();
		Cm160DTO cDto = cDao.ckLogin(id, pw);

		System.out.print("id =" + id +"\t");
		System.out.println("pw =" + pw);

		
		if(cDto == null){
			System.out.println("gg");
		}else{
			System.out.println("success!!");
			session.setAttribute("loginUser",cDto);
			JSONObject jObj=new JSONObject();
			int message=1;
			jObj.put("message", message);
			
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jObj);
			
		}
		return null;		
	
	}

}
