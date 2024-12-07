package controller;

import dao.UserDao;
import dto.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/viewAllUsers")
public class ViewAllUsersController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	UserDao userDAO = new UserDao();

        // 모든 사용자 가져오기
        List<User> users = userDAO.getAllUsers();

        // 결과를 request 객체에 저장
        request.setAttribute("users", users);

        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/viewAllUsers.jsp").forward(request, response);
    }
}
