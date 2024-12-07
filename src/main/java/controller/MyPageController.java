package controller;

import dto.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/mypage")
public class MyPageController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://db.juyong.kr:3306/expense?&useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&serverTimezone=UTC","expense","12345678");
            String sql = "UPDATE users SET name = ?, email = ?, phone = ? WHERE user_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, userId);
            int result = pstmt.executeUpdate();

            conn.close();

            if (result > 0) {
                response.getWriter().println("<script>alert('정보가 성공적으로 수정되었습니다.'); location.href='mypage.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('정보 수정에 실패했습니다.'); location.href='mypage.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('오류가 발생했습니다.'); location.href='mypage.jsp';</script>");
        }
    }
}
