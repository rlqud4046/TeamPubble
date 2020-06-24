<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div align="center">

    <h3><font color="yellow" style="font-weight: bold">${email}</font> 로 임시비밀번호가 발송되었습니다.</h3>
    <h3>로그인하신 후 비밀번호를 변경해주세요.</h3>

    <button onclick="location.href='/member/login'">로그인</button>
    <button onclick="location.href='/'">메인으로</button>

</div>
<%@include file ="../include/footer.jsp" %>