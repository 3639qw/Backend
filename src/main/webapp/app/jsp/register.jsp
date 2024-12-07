<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>소비 내역 등록</title>
  <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <div class="header">
    <h1>소비 내역 등록</h1>
  </div>

  <div class="card">
    <form action="register" method="POST">
      <label for="category">카테고리</label>
      <select id="category" name="category" required>
        <option value="식비">식비</option>
        <option value="교통비">교통비</option>
        <option value="생활비">생활비</option>
        <option value="기타">기타</option>
      </select><br>

      <label for="amount">금액</label>
      <input type="number" id="amount" name="amount" required><br>

      <label for="date">날짜</label>
      <input type="date" id="date" name="date" required><br>

      <button type="submit">등록</button>
    </form>
  </div>
</div>
</body>
</html>
