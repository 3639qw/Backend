<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
	    <script type="text/javascript">
	        // 수정 버튼이 클릭되었을 때 해당 입력 폼을 보여줌
	        function showEditForm() {
	            var action = document.querySelector('input[name="do"]:checked').value;
	            if (action === 'select') {
	                document.getElementById('editForm').style.display = 'block';
	            } else {
	                document.getElementById('editForm').style.display = 'none';
	            }
	        }
	    </script>
	</head>
<body>
    <form action="../../manage.do" method="post">
        ID : <input type="text" name="userid"><br>
        
        <label><input type="radio" name="do" value="select" onclick="showEditForm()"> 수정</label>
        <label><input type="radio" name="do" value="delete" onclick="showEditForm()"> 삭제</label>
        <br>
        <div id="editForm" style="display:none;">
            <h3>수정할 항목을 선택하세요:</h3>
            <label><input type="radio" name="editField" value="userId"> 회원 ID</label>
            <label><input type="radio" name="editField" value="name"> 이름</label>
            <label><input type="radio" name="editField" value="email"> 이메일</label>
            <br>
            <div id="editInputs">
                <br><label>새로운 값:</label>
                <input type="text" name="newValue"><br>
            </div>
        </div>
        <input type="submit" value="제출">
    </form>
</body>
</html>