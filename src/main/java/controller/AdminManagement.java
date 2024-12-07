package controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminManagement
 */
@WebServlet("/manage.do")
public class AdminManagement extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userid");
        String edit = request.getParameter("editField");
		
        
        String newValue = request.getParameter("newValue");
        Connection conn = null;
        
        try {
        	if (edit == null || edit.trim().isEmpty()) {
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		
        		conn = DriverManager.getConnection("jdbc:mysql://db.juyong.kr:3306/expense?&useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&serverTimezone=UTC","expense","12345678");
	            
        		String sql = "DELETE FROM Users WHERE userId = ?";
        		PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            
	            int result = pstmt.executeUpdate();
	            
	            if (result > 0) {
	                response.getWriter().println("<script>alert('정보가 성공적으로 삭제되었습니다.'); location.href='mypage.jsp';</script>");
	            } else {
	                response.getWriter().println("<script>alert('정보 삭제에 실패했습니다.'); location.href='mypage.jsp';</script>");
	            }
	            
	            conn.close();
        	}
        	
        	else {
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	            
	            conn = DriverManager.getConnection("jdbc:mysql://db.juyong.kr:3306/expense?&useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&serverTimezone=UTC","expense","12345678");
	            
	            String sql = "UPDATE Users SET " + edit + " = ? WHERE userId = ?";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, newValue);
	            pstmt.setString(2, userId);
	
	            int result = pstmt.executeUpdate();
	            
	            if (result > 0) {
	                response.getWriter().println("<script>alert('정보가 성공적으로 수정되었습니다.'); location.href='mypage.jsp';</script>");
	            } else {
	                response.getWriter().println("<script>alert('정보 수정에 실패했습니다.'); location.href='mypage.jsp';</script>");
	            }
	            
	            conn.close();
        	}
        	
	            
            response.sendRedirect("./views/admin/memberManagement.jsp");
        }catch(Exception e) {
        	e.printStackTrace();
        }
	}

}
