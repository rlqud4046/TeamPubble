<%@ page import="com.pubble.conpub.domain.SelectedOption" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
    function alias_change(cartNo) {
        var aliasValue = "#updateAlias"+cartNo

        $.ajax({
            method: "post",
            data: {"d":"alias","value":$(aliasValue).val(),"no":cartNo},
            url: "/updateCart",
            success: function (data) {
                alert('별명이 변경되었습니다.')
            }

        })

    }

    function amount_change(cartNo) {

        var amountValue= "#updateAmount"+cartNo;

        $.ajax({
            method: "post",
            data: {"d":"amount","value":$(amountValue).val(),"no":cartNo},
            url: "/updateCart",
            success: function (data) {


                //data:바뀐 수량이 들어있음
                var addr_total_price = "item_price"+cartNo;
                var addr_price = "#price"+cartNo;
                var addr_signature = "#signature"+cartNo;

                document.getElementById(addr_total_price).innerHTML=data * $(addr_price).val() + parseInt($(addr_signature).val());

            }
        })
    }
</script>



<div>
    <h3 class="text-warning">
        장바구니
    </h3>

<form action=""
    <table class="table table-striped">
        <thead>
        <tr>
            <th>
                <input type="checkbox" id="allCheck">
            </th>
            <th>상품번호</th>
            <th>상품명</th>
            <th>수량</th>
            <th>단가</th>
            <th>금액</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cartList}" var="cart">

            <tr>
                <td><input type="checkbox" class="orderCheck" id="checkbox${cart.getId()}" onclick=""></td>

                <td>
                        ${cart.getItem().getId()}
                    <input type="hidden" value="${cart.getId()}" id="cart_no">
                </td>

                <td>
                    <c:forEach items="${itemList}" var="i">
                        <c:if test="${i.getId() == cart.getItem().getId()}">
                            ${i.getItemName()}
                        </c:if>
                    </c:forEach>

                    <input type="text" id="updateAlias${cart.getId()}" value="${cart.getAlias()}" name="alias">
                    <input type="button" onclick="alias_change(${cart.getId()});" value="변경">

                </td>
                <td>
                    <input type="text" id="updateAmount${cart.getId()}" value="${cart.getAmount()}" name="amount">
                    <input type="button" onclick="amount_change(${cart.getId()});" value="변경">

                </td>
                <td>
                        ${cart.getPrice()}
                    <input type="hidden" value="${cart.getPrice()}" id="price${cart.getId()}">
                    <input type="hidden" value="${cart.getSignature()}" id="signature${cart.getId()}">
                </td>
                <td>
                    <span id="item_price${cart.getId()}">${cart.getAmount()*cart.getPrice()+cart.getSignature()}</span>

                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="6" align="right"><b>총</b><span id="orderCash"/> 원</td>
        </tr>
        <tr>
            <td colspan="6"></td>
        </tr>
        </tbody>
    </table>

</div>


<%@include file="../include/footer.jsp" %>