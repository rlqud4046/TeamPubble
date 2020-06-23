<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" type="text/css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.jqueryui.min.css" type="text/css"/>



<div class="container-fluid">
    <%@include file="../include/admin_header.jsp" %>
    <div class="row" id="viewbox">
        <c:set var="list" value="${List}"/>
        <div class="col-md-10" id="menu_body">
            <div class="h30"></div>
            <table class="display" id="send_list_tables" style="width:100%">
                <thead>
                <tr>
                    <th>
                        수신자
                    </th>
                    <th>
                        제목
                    </th>
                    <th>
                        발송일
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${!empty list}">

                    <c:forEach items="${list}" var="dto">
                        <tr onclick="window.open('/member/send_info?id=${dto.getId()}&memid=${dto.getEmailMember().getId()}','','width=1080,height=720,resizable=no ')">
                            <td>
                                    ${dto.getEmailMember().getMemberName()}
                            </td>
                            <td>
                                    ${dto.getEmailTitle()}
                            </td>
                            <td>
                                    ${dto.getSendDate()}
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>
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

    /*$('#member_list_tables_filter').prepend('<select id="select"></select>');
    $('#member_list_tables > thead > tr').children().each(function (indexInArray, valueOfElement) {
        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
    });
    $('.dataTables_filter input').unbind().bind('keyup', function () {
        var colIndex = document.querySelector('#select').selectedIndex;
        table.column(colIndex).search(this.value).draw();
    });*/


</script>
