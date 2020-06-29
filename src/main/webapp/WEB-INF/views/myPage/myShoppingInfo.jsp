
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file ="../include/header.jsp" %>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

<%--<style type="text/css">
    .container {
        overflow: hidden;
    }
    .nav {
        float: left;
        width: 150px;
        background: #333;
        color: #fff;
        margin-right: 50px;
    }
    .nav-list {
        list-style: none;
        margin: 0;
        padding: 10px 0;
    }
    .nav-item {
        margin: 4px 0;
    }
    .nav-link {
        display: block;
        text-decoration: none;
        padding: 4px 10px;
        color: #fff;
    }
    .nav-link:hover {
        background: #5457de;
    }
    .content {
        float: left;
        width: 600px;
    }
</style>--%>


<div class="container">
    <div class="nav">
        <ul class="nav-list">
            <li class="nav-item"><a href="/myPage/main" class="nav-link">쇼핑정보</a></li>
            <li class="nav-item"><a href="/myPage/mileage" class="nav-link">마일리지</a></li>
            <li class="nav-item"><a href="" class="nav-link">회원정보</a></li>
            <li class="nav-item"><a href="" class="nav-link">회원탈퇴</a></li>
        </ul>
    </div>
    <!-- //nav -->
    <div class="content">
        쇼핑리스트
    </div>
</div>



<%@include file ="../include/footer.jsp" %>