<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div class="btn-group btn-group-lg btn-group-vertical" role="group">

    <button class="btn btn-warning" type="button" onclick="location.href='/shoppingInfo'">
        쇼핑정보
    </button>
    <button class="btn btn-warning" type="button" onclick="location.href='/cart'">
        장바구니
    </button>
    <button class="btn btn-warning" type="button" onclick="location.href='/mileage?id=${sessionScope.member.memberId}'">
        마일리지
    </button>
    <button class="btn btn-warning" type="button" onclick="location.href='/updateInfo'">
        회원정보수정
    </button>
    <button class="btn btn-warning" type="button" onclick="location.href='/unsubscribe'">
        회원탈퇴
    </button>
</div>



<%@include file ="../include/footer.jsp" %>