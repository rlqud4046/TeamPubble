

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <title>Insert title here</title>
</head>
<body>
    <div align="center">
        <form action="post" method="/board/writeOk">
        <table cellspacing="0">
            <caption align="left">QNA 게시판</caption>

            <tr>
                <td><input type="text" name="title" placeholder="제목"></td>
            </tr>
            <tr>
                <td><textarea cols="50" rows="30" name="cont" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
                <td><input type="submit" value="문의"></td>
            </tr>
        </table>
    </form>
    </div>

</body>
</html>
