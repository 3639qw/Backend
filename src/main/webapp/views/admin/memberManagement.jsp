<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserDao" %>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://db.juyong.kr:3306/expense?&useSSL=false&allowPublicKeyRetrieval=true&useUnicode=true&serverTimezone=UTC","expense","12345678");
		
		stmt = con.prepareStatement("select * from Users");
		
		rs = stmt.executeQuery();
		
		
		
	} catch (Exception e){
		e.printStackTrace();
	}
	
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 목록</title>
    <style>
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>회원 목록</h1>
		</div>
		
		<div class="card">
			<table>
		        <thead>
		            <tr>
		                <th>회원 ID</th>
		                <th>비밀번호</th>
		                <th>이름</th>
		                <th>이메일</th>
		            </tr>
		        </thead>
		        <tbody>
		            <%
			            while(rs.next()){%>
							<tr>
								<td><%= rs.getString(1) %></td>
								<td><%= rs.getString(2) %></td>
								<td><%= rs.getString(3) %></td>
								<td><%= rs.getString(4) %></td>
							</tr>
						<% }
		            %>
		        </tbody>
    	</table>
		</div>
		
		<div class="card">
			<%@include file="footer.jsp" %>	
		</div>
	
	</div>
</body>
</html>
