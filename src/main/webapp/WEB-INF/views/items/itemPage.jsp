<%@ page import="com.pubble.conpub.domain.SelectedOption" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>

    .left{
        float: left;
        width: 510px;
    }

    .right{
        float: right;
        width: 430px;
        margin-left: 20px;
        position: relative;
    }

</style>


<script>

    /*인준서 값 선택시 */
    function chooseSingnature(){
        if($("#selectedAmount").val() != ""){
            $.ajax({
                method:"post",
                url:"/signature",
                data:{"signaturePage":$("#selectedSignaturePage").val()},
                success: function (data) {

                    $("#totalPrice").val((parseInt(data)+parseInt($("#totalPrice").val())));

                }

            })
        }
    }


    $(function () {


        /*초기값 설정*/

        /*페이지,수량 경고*/
        $("#pageId").hide();
        $("#amountId").hide();

        /*이미지 미리보기*/

        $("#image2").mouseenter(function () {
            $("#bigView").attr("src","images/${itemImage2}");

        })

        $("#image1").mouseenter(function () {
            $("#bigView").attr("src","images/${itemImage1}");
        })

        $("#image3").mouseenter(function () {
            $("#bigView").attr("src","images/${itemImage3}");
        })


        $("#cash_calculate").hide();

        $("#selectedSize option:eq(2)").attr("selected", "selected");

        var ind=$("#selectedSize option:eq(2)").val().lastIndexOf("*");

        $("#paperSize1").val($("#selectedSize").val().substr(ind-3,3));
        $("#paperSize2").val($("#selectedSize").val().substring(ind+1));

        $("#selectedPaper option:eq(2)").attr("selected", "selected");
        $("#selectedTextBothSides option:eq(2)").attr("selected","selected");
        $("#selectedTextColor option:eq(2)").attr("selected","selected");

        if(${no==4}){
            $("#selectedAnnalsCoverColor option:eq(2)").attr("selected","selected");
            $("#selectedHardGold option:eq(2)").attr("selected","selected");
            $("#selectedCoverType option:eq(2)").attr("selected","selected");

        }else {
            if(${no!=5}){
                $("#selectedBinding option:eq(2)").attr("selected","selected");
                if(${no!=7}){
                    $("#selectedBindingDirection option:eq(2)").attr("selected","selected");
                    $("#selectedCoverColor option:eq(2)").attr("selected","selected");
                    $("#selectedCoverSide option:eq(2)").attr("selected","selected");
                    $("#selectedCoverCoating option:eq(2)").attr("selected","selected");
                }
            }
        }
    })

/*paper선택시 값*/
    $(function () {
        $("#selectedSize").change(function () {
            var ind=$("#selectedSize").val().lastIndexOf("*");

            $("#paperSize1").val($("#selectedSize").val().substr(ind-3,3));
            $("#paperSize2").val($("#selectedSize").val().substring(ind+1));

        })
    })

    $(function () {

        $("#selectedPage").blur(function () {

            var regex= /[^0-9]/g;

            if(!regex.test($("#selectedPage").val())){//페이지가 숫자가 맞는지 확인
                $("#page").val($("#selectedPage").val());

                if($("#selectedAmount").val()!=null){//페이지와 수량 모두 입력시 단가출력

                    $.ajax({
                        type:"post",
                        url:"/sum",
                        data:{"no":${no},"selectedPage":$("#selectedPage").val(),"selectedTextColor":$("#selectedTextColor").val(),"selectedTextBothSides":$("#selectedTextBothSides").val(),
                            "selectedCoverCoating":$("#selectedCoverCoating").val(),"selectedCoverSide":$("#selectedCoverSide").val(),"selectedCoverColor":$("#selectedCoverColor").val(),
                            "selectedBindingDirection":$("#selectedBindingDirection").val(),"selectedPaper":$("#selectedPaper").val(),"selectedSize":$("#selectedSize").val(),
                            "selectedAmount":$("#selectedAmount").val(),"selectedAnnalsCoverColor":$("#selectedAnnalsCoverColor").val(),"selectedCoverType":$("#selectedCoverType").val(),
                            "selectedHardGold":$("#selectedHardGold").val(),"selectedBinding":$("#selectedBinding").val()},
                        success: function (data) {
                            $("#cash_calculate").show();
                            var totalPrice = data * $("#selectedAmount").val();
                            $("#cash").val(data);
                            $("#totalPrice").val(totalPrice);
                        }

                    });//ajax
                }//if
            }else {
                $("#pageId").show();
            }
        })
    })

    $(function () {
        $("#selectedAmount").blur(function () {
            var regex= /[^0-9]/g;
            if(regex.test($("#selectedAmount").val())){
              $("#amountId").show();
            }else{/*페이지와 수량 입력시, 가격계산*/
                if($("#selectedPage").val()!=null){

                    $.ajax({
                        type:"post",
                        url:"/sum",
                        data:{"no":${no},"selectedPage":$("#selectedPage").val(),"selectedTextColor":$("#selectedTextColor").val(),"selectedTextBothSides":$("#selectedTextBothSides").val(),
                            "selectedCoverCoating":$("#selectedCoverCoating").val(),"selectedCoverSide":$("#selectedCoverSide").val(),"selectedCoverColor":$("#selectedCoverColor").val(),
                            "selectedBindingDirection":$("#selectedBindingDirection").val(),"selectedPaper":$("#selectedPaper").val(),"selectedSize":$("#selectedSize").val(),
                            "selectedAmount":$("#selectedAmount").val(),"selectedAnnalsCoverColor":$("#selectedAnnalsCoverColor").val(),"selectedCoverType":$("#selectedCoverType").val(),
                            "selectedHardGold":$("#selectedHardGold").val(),"selectedBinding":$("#selectedBinding").val()},
                        success: function (data) {
                            $("#cash_calculate").show();
                            cash=data/$("#selectedAmount").val();
                            $("#cash").val(cash);
                            $("#totalPrice").val(data);
                        }
                    });//ajax
                }//if 페이지확인

                else {//page가 null일때: 학위논문인 경우

                        $.ajax({
                            type:"post",
                            url:"/sum",
                            data:{"no":${no},"selectedPage":$("#selectedPage").val(),"selectedTextColor":$("#selectedTextColor").val(),"selectedTextBothSides":$("#selectedTextBothSides").val(),
                                "selectedCoverCoating":$("#selectedCoverCoating").val(),"selectedCoverSide":$("#selectedCoverSide").val(),"selectedCoverColor":$("#selectedCoverColor").val(),
                                "selectedBindingDirection":$("#selectedBindingDirection").val(),"selectedPaper":$("#selectedPaper").val(),"selectedSize":$("#selectedSize").val(),
                                "selectedAmount":$("#selectedAmount").val(),"selectedAnnalsCoverColor":$("#selectedAnnalsCoverColor").val(),"selectedCoverType":$("#selectedCoverType").val(),
                                "selectedHardGold":$("#selectedHardGold").val(),"selectedBinding":$("#selectedBinding").val()},
                            success: function (data) {
                                $("#cash_calculate").show();
                                var totalPrice = data * $("#selectedAmount").val();
                                $("#cash").val(data);
                                $("#totalPrice").val(totalPrice);
                            }

                        });


                }//if 학위논문확인

            }//else
        })



    })

    /*리뷰페이징처리*/
/*

    $(document).ready(function () {
        $("#reviewTable").datatable();

    })
*/

</script>


<div>
    <div class="container-fluid" style="width: 950px">
        <div class="row">
            <div>
                <div class="row">
                    <div class="left">
                        <img alt="Bootstrap Image Preview" src="images/${itemImage1}" id="bigView" width="500px">
                        <div class="row">
                            <div class="col-md-4">
                                <img alt="Bootstrap Image Preview" id="image1"
                                     src="images/${itemImage1}" width="139px">
                            </div>
                            <div class="col-md-4">
                                <img alt="Bootstrap Image Preview" id="image2"
                                     src="images/${itemImage2}" width="139px">
                            </div>
                            <div class="col-md-4">
                                <img alt="Bootstrap Image Preview" id="image3"
                                     src="images/${itemImage3}" width="139px">
                            </div>

                        </div>
                    </div>

                        <div class="right">
                            <form method="post">
                            <c:set var="name" value="${itemName}"/>
                            <h3 class="text-warning">
                                ${name}
                            </h3>



                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>

                                    </th>
                                    <th align="right">
                                        <input type="reset" value="리셋" style="float: right">
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${!empty SizeList}">
                                    <tr>
                                        <td>
                                            사이즈
                                        </td>
                                        <td>
                                            <select id="selectedSize" name="size">
                                                <option value="">선택</option>
                                                <c:forEach var="size" items="${SizeList}">
                                                    <option value="${size}" id="${size}">${size}</option>
                                                </c:forEach>

                                            </select>
                                            <input type="text" id="paperSize1" size="1" style="background-color:transparent; border:0 solid black;text-align:right;" readonly>X
                                            <input type="text" id="paperSize2" size="1" style="background-color:transparent; border:0 solid black;text-align:right;" readonly>mm
                                        </td>

                                    </tr>
                                </c:if>
                                <c:if test="${!empty CoverTypeList}">
                                    <tr>
                                        <td>
                                            제작형태
                                        </td>
                                        <td>
                                            <select id="selectedCoverType" name="coverType">
                                                <option value="">선택</option>
                                            <c:forEach var="coverType" items="${CoverTypeList}">
                                                <option value="${coverType}">${coverType}</option>
                                            </c:forEach>
                                            </select>
                                        </td>

                                    </tr>
                                </c:if>
                                <c:if test="${!empty BindingList}">
                                    <tr>
                                        <td>
                                            제본
                                        </td>
                                        <td>
                                            <select id="selectedBinding" name="binding">
                                                <option value="">선택</option>
                                            <c:forEach var="binding" items="${BindingList}">
                                                <option value="${binding}">${binding}</option>
                                            </c:forEach>
                                            </select>

                                            <c:if test="${!empty BindingDirectionList}">
                                            제본방향
                                            <select id="selectedBindingDirection" name="bindingDirection">
                                                <option value="">선택</option>
                                                <c:forEach var="bindingDirection" items="${BindingDirectionList}">
                                                    <option value="${bindingDirection}">${bindingDirection}</option>
                                                </c:forEach>
                                            </select>
                                            </c:if>
                                        </td>

                                    </tr>
                                </c:if>
                                <c:if test="${!empty CoverColorList}">
                                    <tr>
                                        <td>
                                            표지인쇄
                                        </td>
                                        <td>
                                            <select id="selectedCoverSide" name="coverSide">
                                                <option value="">선택</option>
                                                <c:forEach var="coverSide" items="${CoverSideList}">
                                                    <option value="${coverSide}">${coverSide}</option>
                                                </c:forEach>
                                            </select>
                                            <select id="selectedCoverColor" name="coverColor">
                                                <option value="">선택</option>
                                                <c:forEach var="coverColor" items="${CoverColorList}">
                                                    <option value="${coverColor}">${coverColor}</option>
                                                </c:forEach>
                                            </select><br/>
                                            표지코팅
                                            <select id="selectedCoverCoating" name="coverCoating">
                                                <option value="">선택</option>
                                                <c:forEach var="coverCoating" items="${CoverCoatingList}">
                                                    <option value="${coverCoating}">${coverCoating}</option>
                                                </c:forEach>
                                            </select>
                                        </td>

                                    </tr>
                                </c:if>
                                <c:if test="${no==4}">
                                    <tr>
                                        <td>
                                            표지옵션
                                        </td>
                                        <td>
                                            하드커버 색상
                                            <select id="selectedAnnalsCoverColor" name="annalsCoverColor">
                                                <option value="">선택</option>
                                                <c:forEach var="annalsCoverColor" items="${AnnalsCoverColorList}">
                                                    <option value="${annalsCoverColor}">${annalsCoverColor}</option>
                                                </c:forEach>
                                            </select><br/>
                                            하드커버 금은박
                                            <select id="selectedHardGold" name="hardGold">
                                                <option value="">선택</option>
                                                <c:forEach var="hardGold" items="${HardGoldList}">
                                                    <option value="${hardGold}">${hardGold}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <td>
                                        본문인쇄
                                    </td>
                                    <td>
                                        <select id="selectedTextBothSides" name="textBothSides">
                                            <option value="">선택</option>
                                            <c:forEach var="textBothSides" items="${TextBothSidesList}">
                                                <option value="${textBothSides}">${textBothSides}</option>
                                            </c:forEach>
                                        </select>
                                        <select id="selectedTextColor" name="textColor">
                                            <option value="">선택</option>
                                            <c:forEach var="textColor" items="${TextColorList}">
                                                <option value="${textColor}">${textColor}</option>
                                            </c:forEach>
                                        </select>

                                        <c:if test="${no!=4}">
                                        <input type="text" id="selectedPage" name="page" size="1">page<br/>
                                            <span id="pageId"><font size="2" color="red">페이지 값은 정수로 입력해주세요.</font></span><br/>
                                        </c:if>

                                        용지
                                        <select id="selectedPaper" name="paper">
                                            <option value="">선택</option>
                                            <c:forEach var="paper" items="${PaperList}">
                                                <option value="${paper}">${paper}</option>
                                            </c:forEach>
                                        </select>


                                    </td>

                                </tr>
                                <c:if test="${no!=4}">
                                <tr>
                                    <td>
                                        페이지
                                    </td>
                                    <td>
                                        <input type="text" readonly id="page" style="background-color: #e2e2e2; background-color:transparent; border:0 solid black;text-align:right;" readonly><br/>
                                        * 페이지는 [본문인쇄]에서 선택가능합니다.
                                    </td>

                                </tr>
                                </c:if>
                                <c:if test="${no==4}">
                                    <tr>
                                        <td>
                                            인준서
                                        </td>
                                        <td>
                                            <select id="selectedSignaturePage" onchange="chooseSingnature()" name="signaturePage">
                                                <option value="">선택</option>
                                                <c:forEach var="signaturePage" items="${SignaturePageList}">
                                                    <option value="${signaturePage}">${signaturePage}</option>
                                                </c:forEach>
                                            </select>
                                        </td>

                                    </tr>
                                </c:if>
                                <tr class="table-warning">
                                    <td>
                                        제작수량
                                    </td>
                                    <td>
                                        <input type="text" id="selectedAmount" name="amount" required>부<br/>
                                        <span id="amountId"><font size="2" color="red">페이지 값은 정수로 입력해주세요.</font></span><br/>
                                    </td>

                                </tr>

                                <tr class="table-warning" id="cash_calculate">
                                    <td align="left">
                                        가격
                                    </td>
                                    <td align="right">
                                        <input type="hidden" id="cash" value="" name="price">
                                        <input type="text" id="totalPrice" value="" style="background-color:transparent; border:0 solid black;text-align:right;" readonly>원
                                    </td>

                                </tr>
                                </tbody>
                            </table>


                            <div class="row">
                                <div>

                                    <input type="submit" value="주문하기"
                                           onclick="javascript: form.action='/orders/order';"/>

                                    <input type="submit" value="장바구니"
                                           onclick="javascript: form.action='/orders/cart';"/>

                                </div>


                            </div>
                            </form>
                        </div>
                </div>
            </div>
        </div>
    </div>

    <div style="height: 30px">

    </div>

    <div class="container-fluid" style="width: 950px; border: 1px solid black">
        <div class="row">
        <div >
            <div class="tabbable" >
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active show" href="#tab1" data-toggle="tab" id="into_tab1">상품정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab2" data-toggle="tab" id="into_tab2">추천제작사양</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab3" data-toggle="tab" id="into_tab3">배송정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#tab4" data-toggle="tab" id="into_tab4">리뷰</a>
                    </li>
                </ul>
                <div class="tab-content">

                    <div class="tab-pane active" id="tab1">
                        <div>
                            <div>
                                <hr color="white">
                                <img alt="Bootstrap Image Preview" src="images/${itemInfo}">
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane" id="tab2">

                        <div>
                            <div>
                                <hr color="white">
                                <img alt="Bootstrap Image Preview" src="images/${itemRec}">
                            </div>
                        </div>

                    </div>
                    <div class="tab-pane" id="tab3">
                        <div>
                            <div>
                                <hr color="white">
                                <img alt="Bootstrap Image Preview" src="images/${itemDelivery}">
                                <hr color="white">
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab4">
                        <div>
                            <div>
                                <hr color="white">

                            <%--리뷰보기--%>

                                <table class="table" id="reviewTable">
                                    <thead>
                                    <tr>
                                        <th>이미지</th>
                                        <th>별점</th>
                                        <th>내용</th>
                                        <th>날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                        <c:forEach items="${review}" var="Review">
                                        <tr>
                                            <td>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading" role="tab" >
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" id="heading${Review.getId()}" data-parent="#accordion" href="#collapse${Review.getId()}" aria-expanded="true" aria-controls="collapse${Review.getId()}">
                                                                <c:if test="${!empty Review.getReviewPhoto()}">
                                                                <img src="images/reviewImages/${Review.getReviewPhoto()}" width="100px">
                                                                </c:if>
                                                            </a>
                                                        </h4>
                                                    </div>

                                                </div>
                                            </td>
                                            <td>
                                                <div class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse${Review.getId()}" aria-expanded="true" aria-controls="collapse${Review.getId()}">
                                                            <c:choose>
                                                                <c:when test="${Review.getReviewStarpoint()==0}">☆☆☆☆☆</c:when>
                                                                <c:when test="${Review.getReviewStarpoint()==1}">★☆☆☆☆</c:when>
                                                                <c:when test="${Review.getReviewStarpoint()==2}">★★☆☆☆</c:when>
                                                                <c:when test="${Review.getReviewStarpoint()==3}">★★★☆☆</c:when>
                                                                <c:when test="${Review.getReviewStarpoint()==4}">★★★★☆</c:when>
                                                                <c:when test="${Review.getReviewStarpoint()==5}">★★★★★</c:when>
                                                            </c:choose>
                                                        </a>
                                                    </h4>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse${Review.getId()}" aria-expanded="true" aria-controls="collapse${Review.getId()}">
                                                                <c:if test="${Review.getReviewCont().length()<=15}">
                                                                     ${Review.getReviewCont()}
                                                                </c:if>
                                                                <c:if test="${Review.getReviewCont().length()>15}">
                                                                    ${Review.getReviewCont().substring(0,14)}...
                                                                </c:if>

                                                        </a>
                                                    </h4>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse${Review.getId()}" aria-expanded="true" aria-controls="collapse${Review.getId()}">
                                                            <fmt:parseDate value="${Review.getReviewDate()}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" type="both"/>
                                                            <fmt:formatDate value="${parseDateTime}" pattern="yyyy.MM.dd HH:mm" var="date"/>
                                                            ${date}


                                                        </a>
                                                    </h4>
                                                </div>
                                            </td>

                                        </tr>
                                        <tr id="hide1">
                                            <td colspan="4">
                                                <div id="collapse${Review.getId()}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${Review.getId()}"
                                                     onclick="findMember(${Review.getId()})">

                                                    <div class="panel-body">
                                                        <c:if test="${!empty Review.getReviewPhoto()}">
                                                            <div class="left row" >
                                                                <img src="images/reviewImages/${Review.getReviewPhoto()}" width="430px" style="margin-left: 30px">
                                                            </div>
                                                        </c:if>
                                                        <div class="right row">
                                                            <div style="margin-left: -30px">
                                                                <b> ${Review.getReviewMember().getMemberName()}
                                                                    (${Review.getReviewMember().getMemberId().substring(0,4)}
                                                                    <c:forEach begin="1" end="${Review.getReviewMember().getMemberId().length() - 4}">*</c:forEach> )<br/>
                                                                    <fmt:parseDate value="${Review.getReviewDate()}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" type="both"/>
                                                                    <fmt:formatDate value="${parseDateTime}" pattern="yyyy.MM.dd" var="date"/>
                                                                        ${date}
                                                                </b>
                                                                <br/><br/>
                                                                ${Review.getReviewCont()}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>



                                        </c:forEach>

                                    </div>
                                    </tbody>
                                </table>




                                <hr color="white">
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>
</div>






<%@include file="../include/footer.jsp" %>