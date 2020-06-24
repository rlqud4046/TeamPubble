<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/header.jsp" %>


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

    .item_images {
        font-size: 29px;
        right: 0px;
        top: 0px;
        filter: alpha(opacity=0);
        -ms-filter: alpha(opacity=0);
        position: absolute;
        opacity: 0;
    }

    .bigPictureWrapper {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top:0%;
        width:100%;
        height:100%;
        background-color: gray;
        z-index: 100;
        background:rgba(255,255,255,0.5);
    }
    .bigPicture {
        position: relative;
        display:flex;
        justify-content: center;
        align-items: center;
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
                    <td><input type="text" value="${item.getItemName()}" ></td>
                </tr>

                <tr>
                    <th>기본금</th>
                    <td><input type="text" value="${item.getItemBasePrice()}">원</td>
                </tr>
            </table>
        </div>
        <div class="col-md-2">
        </div>

        <div class="col-md-10" id="item_edit_body" style="margin-left: 0%">
            <div class="h30"></div>

            <h5>상품 이미지</h5>

            <div class='bigPictureWrapper'>
                <div class='bigPicture'>
                </div>
            </div>

            <table id="item_list" class="table table-bordered" style="width:100%">
                <tr>
                    <th style="width: 15%">상품 이미지1</th>
                    <td><input type="text" id="item_image1_src" readonly style="float: left; height: 29px">
                        <div class="file_input_div">
                            <img src="${pageContext.request.contextPath}/images/findBtn.jpg" class="file_input_img_btn"
                                 alt="open">

                            <input type="file" id="find_image" class="item_images"
                            >
                        </div>
                        <div class="img_wrap">
                            <img src="${pageContext.request.contextPath}/images/catalog1.jpg" id="item_image1"
                                 style="max-width: 15%;"></div>
                    </td>

                </tr>
                <tr>
                    <th style="width: 15%">상품 이미지2</th>
                    <td><input type="text" id="item_image2_src" readonly style="float: left; height: 29px">
                        <div class="file_input_div">
                            <img src="${pageContext.request.contextPath}/images/findBtn.jpg" class="file_input_img_btn"
                                 alt="open">

                            <input type="file" id="find_image2" class="item_images"
                            >
                        </div>
                        <div class="img_wrap">
                            <img src="${pageContext.request.contextPath}/images/catalog2.jpg" id="item_image2"
                                 style="max-width: 15%;"></div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 15%">상품 이미지3</th>
                    <td><input type="text" id="item_image3_src" readonly style="float: left; height: 29px">
                        <div class="file_input_div">
                            <img src="${pageContext.request.contextPath}/images/findBtn.jpg" class="file_input_img_btn"
                                 alt="open">

                            <input type="file" class="item_images" id="find_image3"
                            >
                        </div>
                        <div class="img_wrap">
                            <img src="${pageContext.request.contextPath}/images/catalog3.jpg" id="item_image3"
                                 style="max-width: 15%;"></div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 15%">상품 정보 이미지</th>
                    <td><input type="text" id="item_info_src" readonly style="float: left; height: 29px">
                        <div class="file_input_div">
                            <img src="${pageContext.request.contextPath}/images/findBtn.jpg" class="file_input_img_btn"
                                 alt="open">

                            <input type="file" class="item_images" id="find_info"
                            >
                        </div>
                        <div class="img_wrap">
                            <img src="${pageContext.request.contextPath}/images/catalog3.jpg" id="item_info"
                                 style="max-width: 15%;"></div>
                    </td>
                </tr>

                <tr>
                    <th style="width: 15%">추천 제작사양 이미지</th>
                    <td><input type="text" id="item_recommend_src" readonly style="float: left; height: 29px">
                        <div class="file_input_div">
                            <img src="${pageContext.request.contextPath}/images/findBtn.jpg" class="file_input_img_btn"
                                 alt="open">

                            <input type="file" class="item_images" id="find_recommend"
                            >
                        </div>
                        <div class="img_wrap">
                            <img src="${pageContext.request.contextPath}/images/catalog3.jpg" id="item_recommend"
                                 style="max-width: 15%;"></div>
                    </td>
                </tr>
                <tr>
                    <th style="width: 15%">배송정보 이미지</th>
                    <td><input type="text" id="item_delivery_src" readonly style="float: left; height: 29px">
                        <div class="file_input_div">
                            <img src="${pageContext.request.contextPath}/images/findBtn.jpg" class="file_input_img_btn"
                                 alt="open">

                            <input type="file" class="item_images" id="find_delivery"
                            >
                        </div>
                        <div class="img_wrap">
                            <img src="${pageContext.request.contextPath}/images/catalog3.jpg" id="item_delivery"
                                 style="max-width: 15%;"></div>
                    </td>
                </tr>

            </table>

            <div style="float: right; margin-right: 30px">
                <button id="saveMemo" class="btn btn-secondary mr-2 my-2 my-sm-4" type="submit">
                    저장
                </button>
                <button id="resetMemo" class="btn btn-secondary mr-2 my-2 my-sm-4" type="button" onclick="location.href='/item/list'">
                    목록
                </button>
            </div>
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
                document.getElementById('item_image1_src').value = this.value
            }

            reader.readAsDataURL(f);

        })
    }


    $(document).ready(function () {
        $("#find_image2").on("change", handleImgFileSelect2);
    });

    function handleImgFileSelect2(e) {
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
                $("#item_image2").attr("src", e.target.result);
                document.getElementById('item_image2_src').value = this.value

            }

            reader.readAsDataURL(f);

        })
    }


    $(document).ready(function () {
        $("#find_image3").on("change", handleImgFileSelect3);
    });

    function handleImgFileSelect3(e) {
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
                $("#item_image3").attr("src", e.target.result);
                document.getElementById('item_image3_src').value = this.value
            }

            reader.readAsDataURL(f);

        })
    }


    $(document).ready(function () {
        $("#find_recommend").on("change", handleImgFileSelect4);
    });

    function handleImgFileSelect4(e) {
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
                $("#item_recommend").attr("src", e.target.result);
                document.getElementById('item_recommend_src').value = this.value
            }

            reader.readAsDataURL(f);

        })
    }


    $(document).ready(function () {
        $("#find_delivery").on("change", handleImgFileSelect5);
    });

    function handleImgFileSelect5(e) {
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
                $("#item_delivery").attr("src", e.target.result);
                document.getElementById('item_delivery_src').value = this.value
            }

            reader.readAsDataURL(f);

        })
    }


    $(document).ready(function () {
        $("#find_info").on("change", handleImgFileSelect6);
    });

    function handleImgFileSelect6(e) {
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
                $("#item_info").attr("src", e.target.result);
                document.getElementById('item_info_src').value = this.value
            }

            reader.readAsDataURL(f);

        })
    }

    $(document).ready(function (e){

        $(document).on("click","img",function(){
            var path = $(this).attr('src')
            showImage(path);
        });//end click event

        function showImage(fileCallPath){

            $(".bigPictureWrapper").css("display","flex").show();

            $(".bigPicture")
                .html("<img src='"+fileCallPath+"' >")
                .animate({width:'100%', height: '100%'}, 1000);

        }//end fileCallPath

        $(".bigPictureWrapper").on("click", function(e){
            $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
            setTimeout(function(){
                $('.bigPictureWrapper').hide();
            }, 1000);
        });//end bigWrapperClick event
    });


</script>