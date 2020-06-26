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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.jqueryui.min.css"
          type="text/css"/>
</head>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>


</script>
<body id="admin_member_infos_body">


<div class="container-fluid">
    <c:set var="vo" value="${Member}"/>
    <c:set var="dto" value="${Email}"/>
    <div class="row">
        <div class="col-md-6">
            <h3 style="margin: 5%" id="selected_tab">${dto.getId()}번 메일</h3>
        </div>
        <div class="col-md-6" id="simple_info">

            <table>
                <tr>
                    <th>회원번호</th>
                    <td>${vo.getId()}</td>
                </tr>
                <tr>
                    <th>아 이 디</th>
                    <td>${vo.getMemberId()}</td>
                </tr>
                <tr>
                    <th>이&emsp;&ensp;름</th>
                    <td>${vo.getMemberName()}</td>
                </tr>
            </table>
        </div>
    </div>
    <div id="member_tabs">
        <div class="row">
            <div class="col-md-12" id="menu_body">
                <div class="h30"></div>
                <h3>내용</h3>
                <textarea style="width: 90%;height: 70%; resize: none">${dto.getEmailCont()}</textarea>


        </div>
    </div>
</div>

<%--<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        $('#send_list_tables').DataTable({
            responsive: true,
            order: [[2, 'desc']],
            orderMulti: true,

            "language": {
                "emptyTable": "데이터가 없어요.",
                "lengthMenu": "페이지당 _MENU_ 개씩 보기",
                "info": "현재 _START_ - _END_ / _TOTAL_건",
                "infoEmpty": "데이터 없음",
                "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                "search": "검색: ",
                "zeroRecords": "일치하는 데이터가 없어요.",
                "loadingRecords": "로딩중...",
                "processing": "잠시만 기다려 주세요...",
                "paginate": {
                    "next": "다음",
                    "previous": "이전"
                }
            }

        });
    });


</script>
</body>

</html>