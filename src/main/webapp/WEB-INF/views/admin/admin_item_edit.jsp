<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>
242 242 242

<style>

    .file_input_div {
        position: relative;
        width: 80px;
        height: 36px;
        overflow: hidden;
    }

    .file_input_img_btn {
        padding: 0 0 0 5px;
        height: 31px;
    }

    #find_image {
        font-size: 29px;
        right: 0px;
        top: 0px;
        filter: alpha(opacity=0);
        -ms-filter: alpha(opacity=0);
        position: absolute;
        opacity: 0;
    }
</style>


<div class="container-fluid">
    <%@include file="../include/admin_header.jsp" %>
    <div class="row" id="viewbox">
        <c:set var="item" value="${Item}"/>
        <div class="col-md-10" id="item_edit_body" style="margin-left: 0%">
            <div class="h30"></div>

            <h5>상품 정보</h5>
            <table id="item_list" class="table table-bordered" style="width:100%">
                <tr>
                    <th style="width: 15%">상품코드</th>
                    <td>${item.getId()}</td>
                </tr>
                <tr>
                    <th>상품명</th>
                    <td>${item.getItemName()}</td>
                </tr>

                <tr>
                    <th>기본금</th>
                    <td>${item.getItemBasePrice()}원</td>
                </tr>
            </table>
        </div>
        <div class="col-md-2">
        </div>

        <div class="col-md-10" id="item_edit_body" style="margin-left: 0%">
            <div class="h30"></div>

            <h5>상품 이미지</h5>

            <table id="item_list" class="table table-bordered" style="width:100%">
                <tr>
                    <th style="width: 15%">상품 이미지</th>
                    <td><input type="text" id="item_image1_src" readonly style="float: left; height: 29px">
                        <div class="file_input_div">
                            <img src="${pageContext.request.contextPath}/images/findBtn.jpg" class="file_input_img_btn"
                                 alt="open">

                            <input type="file" id="find_image"
                                   onchange="javascript: document.getElementById('item_image1_src').value = this.value">
                        </div>
                        <div class="img_wrap">
                            <img src="${pageContext.request.contextPath}/images/catalog1.jpg" id="item_image1" style="max-width: 10%;"></div>
                    </td>

                </tr>
                <tr>
                    <th style="width: 15%">상품 이미지</th>
                    <td><input type="text" id="item_image2_src" readonly style="float: left; height: 29px">
                        <div class="file_input_div">
                            <img src="${pageContext.request.contextPath}/images/findBtn.jpg" class="file_input_img_btn"
                                 alt="open">

                            <input type="file" id="find_image"
                                   onchange="javascript: document.getElementById('item_image2_src').value = this.value">
                        </div>
                        <div class="img_wrap">
                            <img src="${pageContext.request.contextPath}/images/catalog2.jpg" id="item_image2" style="max-width: 10%;"></div>
                    </td>
                </tr>
                <tr>
                    <th>추천 제작사양 이미지</th>
                    <td>${item.getItemRecommend()}</td>
                </tr>
                <tr>
                    <th>배송정보 이미지</th>
                    <td>${item.getItemDelivery()}</td>
                </tr>
            </table>
        </div>
        <div class="col-md-2">
        </div>

    </div>
</div>

<%@include file="../include/footer.jsp" %>
<script>
    var sel_file;

    $(document).ready(function () {
        $("#find_image").on("change", handleImgFileSelect);
    });

    function handleImgFileSelect(e) {
        var files = e.target.files;
        var fileArr = Array.prototype.slice.call(files);

        fileArr.forEach(function (f) {
            if (!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function (e) {
                $("#item_image1").attr("src", e.target.result);
            }

            reader.readAsDataURL(f);

        })
    }
</script>