package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.User;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        User user = userDao.validateUser(userId, password);
        String uid = user.getUserId();
        String uname = user.getName();
        String umail = user.getEmail();
        String role = user.getRole();

        if (user != null) {
            request.getSession().setAttribute("loggedInUser", user);
            request.getSession().setAttribute("loggedID", uid);
            request.getSession().setAttribute("loggedName", uname);
            request.getSession().setAttribute("loggedMail", umail);
            request.getSession().setAttribute("role", role);
            response.sendRedirect("app/jsp/");
        } else {
            request.setAttribute("error", "로그인 실패");
            request.getRequestDispatcher("app/jsp/").forward(request, response);
        }
    }
}
