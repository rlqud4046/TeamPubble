<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="./header.jsp" %>

<style>
    .h3 {
        height: 3px;
    }

    .h30 {
        height: 30px;
    }

    .h100 {
        height: 100px;
    }

    #viewbox {
        margin-left: 4%;
        margin-right: 4%;
        border: 1px #1d1e1f solid;
    }

    #menu_side {
        border-right: 1px #1d1e1f solid;
    }

    @media screen and (min-width: 992px) {
        #mgr_menu {
            padding-left: 20%;

        }

        #mgr-navbar ul li {
            margin-left: 20px;
        }
    }

    @media screen and (min-width: 1153px) {
        #mgr-navbar ul li {
            margin-left: 60px;
        }

    }


    #menu_body {
        margin-left: 5%;
        min-height: 500px;
    }

    /*@media screen and(max-width: 480px) {
        #menu_side{
            display: none;
            background-color: #bd2130;
        }

    }*/


</style>
<div class="container-fluid">
    <div class="h3"></div>
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light static-top" id="mgr_menu">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mgr-navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#">관리자 메뉴</a>
                <div class="collapse navbar-collapse" id="mgr-navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" href="" id="mgrDropdownMenuLink1"
                               data-toggle="dropdown">회원 관리</a>
                            <div class="dropdown-menu" aria-labelledby="mgrDropdownMenuLink1">
                                <a class="dropdown-item" href="member_list">회원 목록</a> <a class="dropdown-item" href="#">블랙리스트</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">문자 발송</a> <a class="dropdown-item" href="#">문자
                                전송이력</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">메일 발송</a> <a class="dropdown-item" href="#">메일
                                전송이력</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" href="#" id="mgrDropdownMenuLink2"
                               data-toggle="dropdown">상품 관리</a>
                            <div class="dropdown-menu" aria-labelledby="mgrDropdownMenuLink2">
                                <a class="dropdown-item" href="#">상품 목록</a> <a class="dropdown-item" href="#">상품 수정</a>
                                <a class="dropdown-item" href="#">상품 추가</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">옵션 수정</a>
                            </div>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">디자인 관리 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">리뷰 관리 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" href="#" id="mgrDropdownMenuLink3"
                               data-toggle="dropdown">고객 센터</a>
                            <div class="dropdown-menu" aria-labelledby="mgrDropdownMenuLink3">
                                <a class="dropdown-item" href="#">공지사항</a> <a class="dropdown-item" href="#">견적 문의</a>
                                <a class="dropdown-item" href="#">QNA</a> <a class="dropdown-item" href="#">FAQ</a>
                            </div>
                        </li>
                    </ul>

                </div>
            </nav>

        </div>
    </div>
    <div class="h30"></div>
    <div class="row" id="viewbox">
        <c:set var="list" value="${List}"/>
        <div class="col-md-10" id="menu_body">
            <div class="h30"></div>
            <table class="table table-hover table-sm">
                <thead>
                <tr>
                    <th width="10%">
                        회원번호
                    </th>
                    <th width="30%">
                        이름(아이디)
                    </th>
                    <th width="10%">
                        생년월일
                    </th>
                    <th width="10%">
                        연락처
                    </th>
                    <th width="15%">
                        이메일
                    </th>
                    <th width="5%">
                        메모
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${!empty list}">

                    <c:forEach items="${list}" var="dto">
                        <tr onclick="window.open('/member_info?id=1','','width=1080,height=720,resizable=no ')">
                            <td>
                                    ${dto.getId()}
                            </td>
                            <td>
                                    ${dto.getMemberName()}(${dto.getMemberId()})
                            </td>
                            <td>
                                    ${dto.getMemberBirth()}
                            </td>
                            <td>
                                    ${dto.getMemberPhone()}
                            </td>
                            <td>
                                    ${dto.getMemberEmail()}
                            </td>
                            <c:if test="${!empty dto.getMemberMemo()}">
                                <td>
                                    O
                                </td>
                            </c:if>
                            <c:if test="${empty dto.getMemberMemo()}">
                                <td></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div style="position: absolute; bottom: 0px;">
                <form class="form-inline my-2 my-lg-0">
                    <ul class="pagination mr-3 my-2 my-sm-0">
                        <li class="page-item">
                            <a class="page-link" href="#">Previous</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">6</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">7</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">8</a>
                        </li>
                        <li class="page-item ml">
                            <a class="page-link" href="#">9</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>

                    <input class="form-control mr-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-secondary mr-2 my-2 my-sm-4" type="submit">Search</button>

                </form>


            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>
<%@include file="./footer.jsp" %>
>