<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소비 내역 관리</title>
    <link href="../css/style.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>소비 내역 관리</h1>
    </div>
    
    <%
    if(session.getAttribute("loggedInUser") != null){
    %>
    
    <%
    // 일반 명함
    if(session.getAttribute("role").equals("USER")){
    %>
    <div class="nameBar">
        <h3><%=session.getAttribute("loggedName")%>님</h3>
    </div>
    <%}%>
    
    <%
    // 관리자 명함
    if(session.getAttribute("role").equals("ADMIN")){
    %>
    <div onclick="location.href='../../views/admin/memberManagement.jsp'" class="tab">
        <h2>관리현황</h3>
    </div>
    <%}%>
    
    <div class="tabs">
        <button class="tab" onclick="location.href='../../views/login.jsp'">로그아웃</button>
    </div>
	<%}%>

	<%
	if(session.getAttribute("loggedInUser") != null && session.getAttribute("role").equals("USER")){
	%>
	
    <!-- 직관적인 그래프: 전체 소비 현황 -->
    <div class="card">
        <canvas id="mainGraph" width="400" height="200"></canvas>
    </div>

    <!-- 카테고리별 그래프: 예시로 식비, 교통비, 생활비 -->
    <div class="card">
        <canvas id="categoryGraph" width="400" height="200"></canvas>
    </div>
    <%}%>


    <%
    if(session.getAttribute("loggedInUser") == null){
    %>
    <div class="tabs">
        <button class="tab" onclick="location.href='../../views/login.jsp'">로그인</button>
    </div>
    <%
    }else{
    %>
    <!-- 하단 버튼들 -->
    <div class="tabs">
        <button class="tab" onclick="location.href='register.jsp'">소비 내역 등록</button>
        <button class="tab" onclick="location.href='account.jsp'">계좌 관리</button>
        <button class="tab" onclick="location.href='settings.jsp'">설정</button>
    </div>
    <%
    }
    %>
</div>

<script>
    // 데이터 (임시 데이터, 실제는 서버에서 데이터 받기)
    var mainGraphData = [30, 20, 40, 10]; // 예시: 식비, 교통비, 생활비, 기타
    var categoryData = [150, 100, 200]; // 예시: 식비, 교통비, 생활비 소비 금액
    var categoryMaximum = [300,120,250]; // 카테고리별 예산

    // 직관적인 그래프 (전체 소비 현황)
    var ctx1 = document.getElementById('mainGraph').getContext('2d');
    var mainGraph = new Chart(ctx1, {
        type: 'doughnut',
        data: {
            labels: ['식비', '교통비', '쇼핑', '기타'],
            datasets: [{
                data: mainGraphData,
                backgroundColor: ['#FF6347', '#4CAF50', '#FFC107', '#00BCD4'],
            }]
        }
    });

    // 카테고리별 그래프
    var ctx2 = document.getElementById('categoryGraph').getContext('2d');
    var categoryGraph = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ['식비', '교통비', '쇼핑'],
            datasets: [{
                label: '소비 금액',
                data: categoryData,
                backgroundColor: '#4caf9b',
            },
            {
                label: '예산',
                data: categoryMaximum,
                backgroundColor: '#FF6347',
            }]
        }
    });
</script>
</body>
</html>
