<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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
                            <a class="dropdown-item" href="/member/list">회원 목록</a> <a class="dropdown-item" href="#">블랙리스트</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/member/sms">문자 발송</a> <a class="dropdown-item" href="#">문자
                            발송 이력</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/member/mail">메일 발송</a> <a class="dropdown-item" href="/member/mail_history">메일
                            발송 이력</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="mgrDropdownMenuLink2"
                           data-toggle="dropdown">상품 관리</a>
                        <div class="dropdown-menu" aria-labelledby="mgrDropdownMenuLink2">
                            <a class="dropdown-item" href="/item/list">상품 목록</a> <a class="dropdown-item" href="#">상품 수정</a>
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