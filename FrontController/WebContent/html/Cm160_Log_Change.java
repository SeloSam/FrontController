package cm160;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Cm160DAO;
import dto.Cm160DTO;

/**
 * Servlet implementation class Cm160_Log_Change
 */
@WebServlet("/Cm160_Log_Change")
public class Cm160_Log_Change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cm160_Log_Change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("do get Cm160_log_change");
		HttpSession session=request.getSession();
		
		String code=null;
		
		if(session.getAttribute("loginUser")!=null){
			
			RequestDispatcher dis=request.getRequestDispatcher("cm160_log_change.jsp");
			dis.forward(request, response);
			
		} else {
			code="cm160_logpage.jsp";
			request.setAttribute("code", "1");
			
			RequestDispatcher dis=request.getRequestDispatcher(code);
			dis.forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("do post Cm160_log_change");
		HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("id");
		String userpw = request.getParameter("pw1");
		userpw=request.getParameter("pw2");
		String username = request.getParameter("name");
		String userphone = request.getParameter("phone");
		String useremail = request.getParameter("email");
		String useraddress = request.getParameter("address");
		String useraddress2 = request.getParameter("address2");
		
		Cm160DTO cDto = new Cm160DTO(userid, userpw, username, userphone, useremail, useraddress, useraddress2);
		Cm160DAO cDao = new Cm160DAO();
		
		cDao.Cm160Update(cDto);
		session.setAttribute("loginUser", cDto);
		
		response.sendRedirect("Cm160_Log_Change");
	}
}
