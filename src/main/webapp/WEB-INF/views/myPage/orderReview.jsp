<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<body>

<!-- c:url value 수정해야 함-->
<form action='<c:url value='/board/boardInsert'/>' method="post">
    <div class="form-group">
        <label for="exampleFormControlInput1">제목</label>
        <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="리뷰 제목을 작성해주세요.">
    </div>
    <div class="form-group">
        <label for="exampleFormControlInput1">작성자</label>
        <input type="text" class="form-control" id="exampleFormControlInput1" name="crea_id" placeholder="작성자명을 적어주세요.">
    </div>
    <div class="form-group">
        <label for="exampleFormControlTextarea1">내용</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="10"></textarea>
    </div>
    <button type="submit" class="btn btn-warning">등록하기</button>
    <button type="button" class="btn btn-secondary">목록으로</button>
</form>

</body>
</html>