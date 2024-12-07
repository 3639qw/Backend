<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설정</title>
    <link href="../css/settings.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="header">
        <h1>설정</h1>
    </div>

    <!-- 알림 설정 -->
    <div class="card">
        <h3>알림 설정</h3>
        <label for="notifications">알림 받기</label>
        <input type="checkbox" id="notifications" name="notifications" checked><br>
    </div>

    <!-- 계정 정보 -->
    <div class="card">
        <h3>계정 정보</h3>
        <p>성명: <%=session.getAttribute("loggedName")%></p>
        <p>이메일: <%=session.getAttribute("loggedMail")%></p>
    </div>

    <!-- 비밀번호 변경 -->
    <div class="card">
        <h3>비밀번호 변경</h3>
        <form action="changePassword" method="POST">
            <label for="oldPassword">현재 비밀번호</label>
            <input type="password" id="oldPassword" name="oldPassword" required><br>

            <label for="newPassword">새 비밀번호</label>
            <input type="password" id="newPassword" name="newPassword" required><br>

            <button type="submit">비밀번호 변경</button>
        </form>
    </div>

    <div class="tabs">
        <button class="tab" onclick="location.href='index.jsp'">돌아가기</button>
    </div>
</div>
</body>
</html>
