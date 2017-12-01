package com.bizpoll.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bizpoll.dao.Cm160DAO;



public class IdchAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String idch=request.getParameter("id");
		System.out.println("id값 = "+idch);
		
		if(idch != null){
			Cm160DAO cDao = new Cm160DAO();
			int message= cDao.Cm160chid(idch);
			System.out.println("message="+message);
			
			JSONObject jObj = new JSONObject();
			jObj.put("message", message);
			jObj.put("id", idch);
			
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jObj);
			
		}
		
		return null;
		
	}
}
