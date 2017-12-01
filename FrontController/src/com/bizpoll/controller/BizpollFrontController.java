package com.bizpoll.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bizpoll.action.Action;
import com.bizpoll.action.ActionForward;
import com.bizpoll.action.DetailAction1;
import com.bizpoll.action.DetailAction2;
import com.bizpoll.action.IdchAction;
import com.bizpoll.action.IndexAction;
import com.bizpoll.action.JoinAction;
import com.bizpoll.action.JoinPlayAction;
import com.bizpoll.action.LogOutAction;
import com.bizpoll.action.LoginAction;
import com.bizpoll.action.UpdateAction;
import com.bizpoll.action.UpdatePlayAction;



/**
 * Servlet implementation class BizpollFrontController
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BizpollFrontController() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    //doget() dopost() 모두 service()로 통해서 작동.
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글깨짐방지(post방식):가장 위에 적어줘야댐.
		request.setCharacterEncoding("UTF-8");
		
		Action action=null;
		ActionForward forward=null;
		//URI애서 CTX를 빼면 내가 원하는 소스만 뽑을수 있음
		String uri=request.getRequestURI();
		String ctx=request.getContextPath();
		String command=uri.substring(ctx.length());
		
		System.out.println("uri========>"+uri);
		System.out.println("ctx========>"+ctx);
		System.out.println("command====>"+command);
	
		//액션 매핑
		//실제로 동작하는곳, 하나의 서블릿에서 URL을 읽어와서 해당 기능을 구현
	
		if(command.equals("/index.bizpoll")){
			action=new IndexAction();
			forward=action.excute(request, response);
		} else if(command.equals("/join.bizpoll")){
			action=new JoinAction();
			forward=action.excute(request, response);
		} else if(command.equals("/joinplay.bizpoll")){
			action=new JoinPlayAction();
			forward=action.excute(request, response);
		} else if(command.equals("/idch.bizpoll")){
			action=new IdchAction();
			forward=action.excute(request, response);
		} else if(command.equals("/login.bizpoll")){
			action=new LoginAction();
			forward=action.excute(request, response);
		} else if(command.equals("/logout.bizpoll")){
			action=new LogOutAction();
			forward=action.excute(request, response);
		} else if(command.equals("/detail1.bizpoll")){
			action=new DetailAction1();
			forward=action.excute(request, response);
		} else if(command.equals("/detail2.bizpoll")){
			action=new DetailAction2();
			forward=action.excute(request, response);
		} else if(command.equals("/update.bizpoll")){
			action=new UpdateAction();
			forward=action.excute(request, response);
		} else if(command.equals("/updateplay.bizpoll")){
			action=new UpdatePlayAction();
			forward=action.excute(request, response);
		}
		
		
		//공통 분기 작업
		if(forward != null){
			if(forward.isRedirect()){//true
				response.sendRedirect(forward.getPath());
			}else{//false
				RequestDispatcher rd=request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
			
		}
	
	}
}
