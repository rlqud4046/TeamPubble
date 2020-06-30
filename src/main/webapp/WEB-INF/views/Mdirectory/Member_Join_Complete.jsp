<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>회원 가입 완료</h1>
<h3>CONPUB 가입을 축하드립니다.</h3>

<div align="center">

    <br/>

    <hr width="70%" color="yellow" />

    <br/>
    <br/>

    <h3><font color="yellow">${member.getMemberName()}</font>님, 회원가입이 완료되었습니다.</h3>

    <br/>
    <p>CONPUB에 회원가입하신 것을 환영합니다.
        만족하실 수 있는 서비스를 위해 노력하겠습니다.</p>

    <button class="btn btn-group" onclick="location.href='/login'" style="background-color: #F2CB61">로그인</button>
    <button class="btn btn-group" onclick="location.href='/'">메인으로</button>

</div>






<%@include file ="../include/footer.jsp" %>