package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

@SuppressWarnings("serial")
@WebServlet("/admin/members")
public class AdminController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	UserDao userDao = new UserDao();
        request.setAttribute("users", userDao.getAllUsers());
        request.getRequestDispatcher("/views/admin/memberManagement.jsp").forward(request, response);
    }
}
