<%@page import="dto.*"%>
<%@page import="dao.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계좌 관리</title>
    <link href="../css/account.css" rel="stylesheet">
</head>
<body>
<jsp:useBean class="dao.AccountDAO" id="acListM1" scope="session"/>

<div class="container">
    <div class="header">
        <h1>계좌 관리</h1>
    </div>

    <!-- 계좌 목록 -->
    <div class="card">
        <h3>등록된 계좌</h3>
        
        <ul class="account-list">
	        <%
	        if(session.getAttribute("loggedInUser") != null){
				ArrayList<Account> vList = acListM1.selectAccountList();
				out.println();
				int count = 1;
				for(int i = 0; i < vList.size(); i++){
					Account ac = vList.get(i);
				
					if(ac.getId().equals(session.getAttribute("loggedID"))){
			%>
			<li><%=count%>. <%=ac.getBankName()%> <%=ac.getAccountNumber()%></li>
			
			<%
				count++;
					}
				}
	        }else{
			%>
			<li> 등록된 계좌가 없습니다. </li>
			<%}%>
        </ul>
    </div>

    <!-- 계좌 추가 폼 -->
    <div class="card">
        <form action="../../registerAccount" method="POST">
            <label for="bank">은행</label>
            <input type="text" id="id" name="usrId" value="<%out.print(session.getAttribute("loggedID"));%>" hidden="true"><br>
            <input type="text" id="bank" name="bank" placeholder="은행 이름" required><br>

            <label for="accountNumber">계좌 번호</label>
            <input type="number" id="accountNumber" name="accountNumber" placeholder="계좌 번호" required><br>

            <button type="submit">계좌 추가</button>
        </form>
    </div>

    <!-- 돌아가기 버튼 -->
    <div class="tabs">
        <button class="tab" onclick="location.href='index.jsp'">돌아가기</button>
    </div>
</div>
</body>
</html>
