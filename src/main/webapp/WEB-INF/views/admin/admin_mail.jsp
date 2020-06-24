<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Conpub</title>

    <meta name="description" content="안녕하세요. 당신을 위한 콘펍입니다">
    <meta name="author" content="Pubble">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <script>
        function sendEmail(frm) {
            var title = frm.email_title.value;
            var content = frm.email_cont.value;

            if (title.trim() == '') {
                alert("제목을 입력해주세요");
                return false;
            }
            if (content.trim() == '') {
                alert("내용을 입력해주세요");
                return false;
            }
            frm.submit();
        }
    </script>

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">

            <!-- 여기부터 header -->
            <header>
                <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">로그인</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">회원가입</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">장바구니</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">마이페이지</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">고객센터</a>
                        </li>
                    </ul>
                </nav>

                <nav class="navbar navbar-expand-lg navbar-light bg-light static-top">

                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a class="navbar-brand" href="#">Conpub</a>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com"
                                   id="navbarDropdownMenuLink" data-toggle="dropdown">도서</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">포트폴리오</a> <a class="dropdown-item"
                                                                                   href="#">독립출판</a> <a
                                        class="dropdown-item" href="#">앨범</a>
                                </div>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="#">학위논문 <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com"
                                   id="navbarDropdownMenuLink" data-toggle="dropdown">홍보물</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">팜플렛</a> <a class="dropdown-item" href="#">카탈로그</a>
                                    <div class="dropdown-divider">
                                    </div>
                                    <a class="dropdown-item" href="#">포스터</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">포토북</a>
                            </li>
                        </ul>
                        <form class="form-inline">
                            <input class="form-control mr-sm-2" type="text">
                            <button class="btn btn-primary my-2 my-sm-0" type="submit">
                                검색
                            </button>
                        </form>

                    </div>
                </nav>

            </header>


            <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css">
            <script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
            <script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>


            <script>
                $(document).ready(function () {
                    //여기 아래 부분
                    $('#summernote').summernote({
                        height: 400,                 // 에디터 높이
                        minHeight: null,             // 최소 높이
                        maxHeight: null,             // 최대 높이
                        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                        lang: "ko-KR",					    // 한글 설정
                        placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정

                    });
                });
            </script>

            <div class="container-fluid">
                <%@include file="../include/admin_header.jsp" %>


                <div class="row" id="viewbox">

                    <div class="col-lg-6">
                        <div class="h30"></div>
                        <form method="post" action="/member/mail_send">

                            <table class="table table-bordered">
                                <tr>
                                    <th>수신자</th>
                                    <td>
                                        <select name="email_category">
                                            <option value="emailAll">전체 회원</option>
                                            <option value="emailMonth">현재 월 생</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="email_title"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <textarea id="summernote" name="email_cont"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <input type="button" class="btn btn-secondary mr-2 my-2 my-sm-2" id="subBtn" value="전송"
                                   style="float: right"
                                   onclick="sendEmail(this.form)"/>

                        </form>
                        <div class="h30"></div>
                    </div>

                    <div class="col-lg-6">
                        <div class="h30"></div>
                        <table class="table table-bordered rwd-table" style="width: 100%; margin-top: 0px">
                            <tr>
                                <th>날짜</th>
                                <th>아이디</th>
                                <th>이름</th>
                            </tr>

                            <tr>
                                <td data-th="날짜">{DATE}</td>
                                <td data-th="아이디">{MEM_ID}</td>
                                <td data-th="이름">{MEM_NAME}</td>
                            </tr>
                            <tr>
                                <th>사이트 주소</th>
                                <th>배송지 이름</th>
                                <th>적립금</th>
                            </tr>
                            <tr>
                                <td data-th="사이트 주소">{SITE_URL}</td>
                                <td data-th="배송지 이름">{DELIVERY_NAME}</td>
                                <td data-th="적립금">{MILEAGE}</td>
                            </tr>
                        </table>
                        <div>
                            예약어 기능. &emsp; 메세지 안에 해당 키워드를 작성하면 해당하는 정보를 넣어줍니다.
                        </div>
                    </div>


                </div>

            </div>
        </div>

        <footer style="text-align:center">
            <br/>
            <address>
                <strong>Conpub, Inc.</strong><br><span>본 사이트의 컨텐츠는 저작권법의 보호를 받으므로 복사, 배포 등을 금합니다. CONTACT US</span> <em>conpub.contact@gmail.com</em>
                <span>COPYRIGHT © 2020 CONPUB ALL RIGHTS RESERVED.</span>
            </address>

        </footer>

    </div>
</div>
</div>


</body>
</html>
