<%@ page import="com.pubble.conpub.domain.SelectedOption" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div>
    <h3 class="text-warning">
        장바구니
    </h3>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>
                <input type="checkbox" name="orderCheck">
            </th>
            <th>상품번호</th>
            <th>상품명</th>
            <th>수량</th>
            <th>단가</th>
            <th>금액</th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <td>

            </td>
        </tr>
        </tbody>
    </table>
</div>


<%@include file="../include/footer.jsp" %>