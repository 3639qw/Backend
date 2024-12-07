package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.User;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        User user = new User(userId, password, name, email, "USER");
        UserDao userDao = new UserDao();

        if (userDao.registerUser(user)) {
            response.sendRedirect("views/login.jsp");
        } else {
            request.setAttribute("error", "회원 가입 실패");
            request.getRequestDispatcher("views/register.jsp").forward(request, response);
        }
    }
}
