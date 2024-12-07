<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("loggedInUser") != null){
%>
ID: <%=session.getAttribute("loggedID")%>
성명: <%=session.getAttribute("loggedName")%>
<form action="../mypage" method="post">
    이름: <input type="text" name="name"><br>
    이메일: <input type="email" name="email"><br>
    <input type="submit" value="정보 수정">
</form>
<form action="./logout.jsp" method="get">
        <button type="submit">로그아웃</button>
</form>
<%
}else{
%>
<h2>로그인후 이용하세요</h2>
<%
}
%>