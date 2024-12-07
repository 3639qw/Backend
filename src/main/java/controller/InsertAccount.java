package controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.*;



import dao.AccountDAO;
import dao.UserDao;
import dto.Account;
import dto.User;

/**
 * Servlet implementation class InsertAccount
 */
@SuppressWarnings("serial")
@WebServlet("/registerAccount")
public class InsertAccount extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	String Id = request.getParameter("usrId"); 
    	String name = request.getParameter("bank");
    	String acNum = request.getParameter("accountNumber");
    	
    	Account ac = new Account(Id, name, acNum);
    	AccountDAO acDao = new AccountDAO();
    	
    	if(acDao.InsertAccount(ac)) {
    		response.sendRedirect("./app/jsp/account.jsp");
    	}else {
            request.setAttribute("error", "계좌등록 실패");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
    	}
    }

}
