<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>회원 정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    $(function () {
        $("#saveMemo").click(function () {
            var id = $("#idMemo").val();
            var memo = $("#contMemo").val();
            $.ajax({
                type: "post",
                url: "/member/memo",
                data: {"id": id, "memo": memo},
                success: function (data) {

                    id = data.id;
                    memo = data.memo;
                    //$("#contMemo").append(memo);
                    // return false;
                },
                error: function () {
                    alert('data error');
                }
            });

        });

        /*$("#resetMemo").click(function () {
            var id = $("#idMemo").val();
            var memo = $("#contMemo").val();
            $.ajax({
                type: "post",
                url: "/member/memo_reset",
                data: {"id": id},
                success: function (data) {

                    id = data.id;

                    $("#contMemo").value(memo);
                    // return false;
                },
                error: function () {
                    alert('data error');
                }
            });*/
    });

    $(function () {
        $("#into_tab1").click(function () {
            $("#selected_tab").text("회원 정보 - 개인 정보");
        });
        $("#into_tab2").click(function () {
            $("#selected_tab").text("회원 정보 - 주문 관리");
        });
        $("#into_tab3").click(function () {
            $("#selected_tab").text("회원 정보 - 계정 관리");
        });
    });

/* 블랙리스트 전환 미완성

    $(function () {
        var id = $("#idMemo").val();
        var black = $("#memberBlack").val();

        if(black == "YES"){

        }

        if($("#switch1").is(":checked")){
            black = "Yes"
        }else {
            black = "No"
        }
            $.ajax({
                type: "post",
                url: "/member/black",
                data: {"id": id, "black": black},
                success: function (data) {

                },
                error: function () {
                    alert('data error');
                }
            });
    });
*/


</script>
<body id="admin_member_infos_body">


<div class="container-fluid">
    <c:set var="dto" value="${One}"/>
    <input type="hidden" id="idMemo" value="${dto.getId()}">
    <%--<input type="hidden" id="memberBlack" value="${dto.getMemberBlack()}">--%>
    <div class="row">
        <div class="col-md-6">
            <h3 style="margin: 5%" id="selected_tab">회원정보 - 개인정보</h3>
        </div>
        <div class="col-md-6" id="simple_info">

            <table>
                <tr>
                    <th>회원번호</th>
                    <td>${dto.getId()}</td>
                </tr>
                <tr>
                    <th>아 이 디</th>
                    <td>${dto.getMemberId()}</td>
                </tr>
                <tr>
                    <th>이&emsp;&ensp;름</th>
                    <td>${dto.getMemberName()}</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tabbable" id="member_tabs">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active show" href="#tab1" data-toggle="tab" id="into_tab1">개인 정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab2" data-toggle="tab" id="into_tab2">주문 관리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab3" data-toggle="tab" id="into_tab3">계정 관리</a>
                    </li>
                </ul>
                <div class="tab-content">

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
                            <div class="col-sm-6" id="tab1_memo">

                                <h3>관리자 전용 메모</h3>

                                <textarea id="contMemo" cols="67" rows="13"
                                          style="resize: none">${dto.getMemberMemo()}</textarea>
                                <br>
                                <div style="float: right; margin-right: 30px">
                                    <button id="saveMemo" class="btn btn-secondary mr-2 my-2 my-sm-4" type="button">
                                        작성
                                    </button>
                                    <button id="resetMemo" class="btn btn-secondary mr-2 my-2 my-sm-4" type="button">
                                        취소
                                    </button>
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab2">

                        <div class="row">
                            <div class="col-md-12">
                                <h3>
                                    주문 내역
                                </h3>
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>
                                            #
                                        </th>
                                        <th>
                                            Product
                                        </th>
                                        <th>
                                            Payment Taken
                                        </th>
                                        <th>
                                            Status
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            TB - Monthly
                                        </td>
                                        <td>
                                            01/04/2012
                                        </td>
                                        <td>
                                            Default
                                        </td>
                                    </tr>
                                    <tr class="table-success">
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            TB - Monthly
                                        </td>
                                        <td>
                                            02/04/2012
                                        </td>
                                        <td>
                                            Declined
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h3>
                                    주문 이력
                                </h3>
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>
                                            #
                                        </th>
                                        <th>
                                            Product
                                        </th>
                                        <th>
                                            Payment Taken
                                        </th>
                                        <th>
                                            Status
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-active">
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            TB - Monthly
                                        </td>
                                        <td>
                                            01/04/2012
                                        </td>
                                        <td>
                                            Approved
                                        </td>
                                    </tr>
                                    <tr class="table-success">
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            TB - Monthly
                                        </td>
                                        <td>
                                            02/04/2012
                                        </td>
                                        <td>
                                            Declined
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab3">
                        <div class="row">
                            <div class="col-md-12">
                                <h3>
                                    회원 정보 삭제
                                </h3>
                                <form class="form-inline my-2 my-lg-0" action="/member/delete">
                                    <input type="hidden" name="id" value="${dto.getId()}">
                                    <input class="form-control mr-sm-2" type="text" placeholder="ADMIN PASSWORD" name="admin_pwd">
                                    <input class="btn btn-secondary mr-2 my-2 my-sm-4" type="submit" value="삭제">
                                </form>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h3>
                                    블랙 리스트 전환 / 해제
                                </h3>
                                <input type="checkbox" id="switch1" name="switch1" class="input__on-off">
                                <label for="switch1" class="label__on-off">
                                    <span class="marble"></span>
                                    <span class="on">블랙</span>
                                    <span class="off">해제</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>

</html>