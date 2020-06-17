<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>회원 정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            background-color: rgb(224, 224, 224);
        }

        #tab1_info th {
            padding: 13px;
        }

        #member_tabs {
            background-color: white;
            height: 500px;
            margin-left: 20px;
            margin-right: 20px;
            border: 1px solid black;
        }

        #simple_info table {
            margin-left: 20%;
        }

        #simple_info th {
            padding: 15px;
        }


    </style>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <h3 style="margin: 5%">회원정보 - 개인정보</h3>
        </div>
        <div class="col-md-6" id="simple_info">

            <table>
                <tr>
                    <th>회원번호</th>
                    <td>assd</td>
                </tr>
                <tr>
                    <th>아 이 디</th>
                    <td>assd</td>
                </tr>
                <tr>
                    <th>이&emsp;&ensp;름</th>
                    <td>assd</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tabbable" id="member_tabs">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active show" href="#tab1" data-toggle="tab">개인 정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab2" data-toggle="tab">주문 관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab3" data-toggle="tab">계정 관리</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <c:set var="dto" value="${One}"/>
                    <div class="tab-pane active" id="tab1">
                        <div class="row">
                            <div class="col-sm-6">
                                <table id="tab1_info">

                                    <c:if test="${!empty dto}">
                                        <tr>
                                            <th>회원번호</th>
                                            <td>
                                                    ${dto.getId()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>아이디</th>
                                            <td>
                                                    ${dto.getMemberId()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>이름</th>
                                            <td>
                                                    ${dto.getMemberName()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td>
                                                    ${dto.getMemberBirth()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>연락처</th>
                                            <td>
                                                    ${dto.getMemberPhone()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>문자 수신동의</th>
                                            <td>
                                                    ${dto.getSmsAgree()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td>
                                                    ${dto.getMemberEmail()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>이메일 수신동의</th>
                                            <td>
                                                    ${dto.getEmailAgree()}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>가입일</th>
                                            <td>
                                                    ${dto.getMemberRegdate()}
                                            </td>
                                        </tr>
                                    </c:if>
                                </table>
                            </div>
                            <div class="col-sm-6">

                                    <h3>관리자 전용 메모</h3>
                                    <form>
                                        <textarea cols="67" rows="13" style="resize: none"></textarea>
                                        <br>
                                        <div style="float: right; margin-right: 30px">
                                        <button class="btn btn-secondary mr-2 my-2 my-sm-4" type="submit">작성</button>
                                        <button class="btn btn-secondary mr-2 my-2 my-sm-4" type="submit">취소</button>
                                        </div>
                                    </form>

                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab2">
                        <p>
                            Howdy, I'm in Section 2.
                        </p>
                    </div>
                    <div class="tab-pane" id="tab3">
                        <p>
                            Howdy, I'm in Section 3.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>

</html>