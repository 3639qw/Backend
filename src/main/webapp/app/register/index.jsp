<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소비 관리 프로그램</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
    <div class="form-card">
    
        <h2>소비 내역 입력</h2>
        
        
        <form action="../../expanse/saveExpense.jsp" method="post">
            <div class="input-group">
                <input type="text" name="item" placeholder="항목" required>
            </div>
            <div class="input-group">
                <input type="number" name="amount" placeholder="금액" required>
            </div>
            <div class="input-group">
                <input type="date" name="date" required>
            </div>

            <!-- 카테고리 선택 -->
            <div class="input-group">
                <select id="category" name="category" required>
                    <option value="" disabled selected>카테고리 선택</option>
                    <option value="식비">식비</option>
                    <option value="교통비">교통비</option>
                    <option value="생활비">생활비</option>
                    <option value="기타">기타</option>
                </select>
            </div>
            <button type="submit" class="btn">소비 기록하기</button>
        </form>
    </div>
</div>
</body>
</html>
