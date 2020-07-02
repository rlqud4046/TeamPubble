<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
      type="text/css"/>
<script>
    $(document).ready(function () {
        $('#shoppingInfo').DataTable({
            responsive: true,
            paging : true,
            ordering : true,
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

<!-- section -->
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
                        <button class="btn btn-warning" type="button"
                                onclick="location.href='/mileage?id=${sessionScope.member.memberId}'">
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
                    <!-- 주문내역 수정 필요 -->
                    <h3>
                        쇼핑정보
                    </h3>
                    <table class="table table-hover" id="mileageTable">
                        <thead>
                        <tr>
                            <th class="text-center">No.</th>
                            <th class="text-center">주문번호</th>
                            <th class="text-center">상품명(고객메모)</th>
                            <th class="text-center">배송상태</th>
                            <th class="text-center">주문일</th>
                            <th class="text-center">리뷰</th>
                        </tr>
                        </thead>
                        <c:set var="list" value="${shoppingInfo }" />
                        <c:if test="${!empty list }">
                            <c:forEach items="${list }" var = "dto" >
                                <tr class="notice">
                                    <!-- 수정 -->
                                    <td class="text-center">${dto.getId() } </td>
                                    <td class="text-center">${dto.getMileagePath() }</td>
                                    <td class="text-center">${dto.getMileage() } </td>
                                    <td class="text-center">${dto.getMileageDate() } </td>
                                    <td class="text-center">${dto.getId() } </td>
                                    <td class="text-center"> 리뷰작성/리뷰확인 버튼 </td>
                                    <!-- ("이미 리뷰를 작성하였습니다. 리뷰게시판으로 이동하시겠습니까?")-->
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test ="${empty shoppingInfo }">
                            <tr>
                                <td colspan="5" align="center">
                                    <h3>서버 오류입니다. 새로고침하거나 고객센터에 문의하세요</h3>
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
            </div>
            <nav>
                <ul class="pagination">
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
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%@include file="../include/footer.jsp" %>