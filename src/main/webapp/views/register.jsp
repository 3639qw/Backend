<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
<%
if(session.getAttribute("loggedInUser") == null){
%>
<div class="login-container">
    <div class="login-card">
        <h2>회원가입</h2>
        <form action="../register" method="post">
            <div class="input-group">
                <input type="text" id="username" name="userId" placeholder="아이디" required />
            </div>
            <div class="input-group">
                <input type="password" id="password" name="password" placeholder="비밀번호" required />
            </div>
            <div class="input-group">
                <input type="text" id="uname" name="name" placeholder="성명" required />
            </div>
            <div class="input-group">
                <input type="text" id="umail" name="email" placeholder="email" required />
            </div>
            <div class="input-group">
                <input type="text" id="apikey" name="apikey" placeholder="api키" required />
            </div>
            <button type="submit" class="btn">회원가입</button>
        </form>
    </div>
</div>
<%
}
%>
</body>
</html>

