<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>




<div class="container-fluid">
    <%@include file="../include/admin_header.jsp" %>
    <div class="row" id="viewbox">
        <div class="col-lg-6">
            <div class="h30"></div>
            <form action="/member/sms_send">
            <table class="table table-bordered" >
                <tr>
                    <th>분류</th>
                    <td>
                        <select name="sms_category">
                            <option value="smsAll">전체 회원</option>
                            <option value="smsMonth">현재 월 생</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>
                        SMS 내용
                    </th>
                    <td>
                        <textarea name="sms_text" rows="7" style="resize: none; width: 100%"></textarea>
                    </td>
                </tr>
            </table>
                <div style="float: right; margin-right: 30px">
                <button class="btn btn-secondary mr-2 my-2 my-sm-4" type="submit">발송</button>
                <button class="btn btn-secondary mr-2 my-2 my-sm-4" type="reset">취소</button>
                </div>
            </form>
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
<%@include file="../include/footer.jsp" %>