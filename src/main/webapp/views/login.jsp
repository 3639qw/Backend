<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
<%
if(session.getAttribute("loggedInUser") == null){
%>
<div class="login-container">
	<div class="home-card" onclick="location.href='../app/jsp'">
		<h3>홈</h3>
	</div>
    <div class="login-card">
        <h2>로그인</h2>
        <form action="../login" method="post">
            <div class="input-group">
                <input type="text" id="username" name="userId" placeholder="아이디" required />
            </div>
            <div class="input-group">
                <input type="password" id="password" name="password" placeholder="비밀번호" required />
            </div>
            <button type="submit" class="btn">로그인</button>
        </form>
        <div class="signup-link">
            <a href="register.jsp">회원가입</a>
        </div>
    </div>
</div>
<%
}else{
	session.invalidate();
	response.sendRedirect("./login.jsp");
}
%>
</body>
</html>