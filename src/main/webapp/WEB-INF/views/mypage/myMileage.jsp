<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
      type="text/css"/>
<%@include file ="../include/header.jsp" %>
<script>
    $(document).ready(function () {
        $('#mileageTable').DataTable({
            responsive: true,
            paging : true,
            ordering : false,
            info : true,
            filter : false,
            lengthChange : false,
            order : [[0, "asc"]],
            language: {
                "emptyTable": "데이터가 없어요.",
                "lengthMenu": "페이지당 _MENU_ 개씩 보기",
                "info": "_START_ - _END_ / _TOTAL_건",
                "infoEmpty": "데이터 없음",
                "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                "search": "에서 검색: ",
                "zeroRecords": "일치하는 데이터가 없어요.",
                "loadingRecords": "로딩중...",
                "processing":     "잠시만 기다려 주세요...",
                "paginate": {
                    "next": "다음",
                    "previous": "이전"
                }
            }
        });
    });
</script>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-3">
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
                </div>
                <div class="col-md-9">
                    <h3>
                        마일리지
                    </h3>
                    <table class="table table-hover" id="mileageTable">
                        <thead>
                        <tr>
                            <th class="text-center">No.</th>
                            <th class="text-center">변동내역</th>
                            <th class="text-center">사용액수</th>
                            <th class="text-center">변동일자</th>
                        </tr>
                        </thead>
                        <c:set var="list" value="${mileageList }" />
                        <c:if test="${!empty list }">
                            <c:forEach items="${list }" var = "dto" >
                                <tr class="notice">
                                    <td class="text-center">${dto.getId() } </td>
                                    <td class="text-center">${dto.getMileagePath() }</td>
                                    <td class="text-center"> <fmt:formatNumber value="${dto.getMileage() }" type="number"/> </td>
                                    <td class="text-center">${dto.getMileageDate() } </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test ="${empty mileageList }">
                            <tr>
                                <td colspan="5" align="center">
                                    <h3>서버 오류입니다. 새로고침하거나 고객센터에 문의하세요</h3>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file ="../include/footer.jsp" %>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"/>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"/>

<script>
    $('mileageTable').DataTable({
        data: data,
        columns: [
            { "data": 'id' },
            { "data": 'mileagePath' },
            { "data": 'mileage' },
            { "data": 'mileageDate' },
        ]
    });
</script>