<%@include file ="../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div align="center">

    <h3>회원님의 아이디는 <font color="yellow" style="font-weight: bold">${id}</font> 입니다.</h3>
    <h3>로그인하시면 CONPUB의 서비스를 이용할 수 있습니다.</h3>

    <button onclick="location.href='/member/login'">로그인</button>
    <button onclick="location.href='/member/find/pwd'">비밀번호 찾기</button>

</div>
<%@include file ="../footer.jsp" %>