<%@ page import="com.pubble.conpub.domain.SelectedOption" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

/*초기값 설정*/
    $(function () {
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

                if($("#selectedPage").val()!=null){//페이지와 수량 모두 입력시 단가출력

                    $.ajax({
                        type:"post",
                        url:"/sum",
                        data:{"no":${no},"selectedPage":$("#selectedPage").val(),"selectedTextColor":$("#selectedTextColor").val(),"selectedTextBothSides":$("#selectedTextBothSides").val(),
                            "selectedCoverCoating":$("#selectedCoverCoating").val(),"selectedCoverSide":$("#selectedCoverSide").val(),"selectedCoverColor":$("#selectedCoverColor").val(),
                            "selectedBindingDirection":$("#selectedBindingDirection").val(),"selectedPaper":$("#selectedPaper").val(),"selectedSize":$("#selectedSize").val(),
                            "selectedAmount":$("#selectedAmount").val(),"selectedAnnalsCoverColor":$("#selectedAnnalsCoverColor").val(),"selectedCoverType":$("#selectedCoverType").val(),
                            "selectedHardGold":$("#selectedHardGold").val(),"selectedSignaturePage":$("#selectedSignaturePage").val(),"selectedBinding":$("#selectedBinding").val()},
                        success: function (data) {
                            $("#cash_calculate").show();
                            var totalPrice = data * $("#selectedAmount").val();
                            $("#cash").val(data);
                            $("#totalPrice").val(totalPrice);
                        }

                    });//ajax


                }//if


            }else {
                alert("숫자아님")
            }
        })
    })

    $(function () {
        $("#selectedAmount").blur(function () {
            var regex= /[^0-9]/g;
            if(regex.test($("#selectedAmount").val())){
               alert("숫자아님")
            }else{/*페이지와 수량 입력시, 가격계산*/
                if($("#selectedPage").val()!=null){


                    $.ajax({
                        type:"post",
                        url:"/sum",
                        data:{"no":${no},"selectedPage":$("#selectedPage").val(),"selectedTextColor":$("#selectedTextColor").val(),"selectedTextBothSides":$("#selectedTextBothSides").val(),
                            "selectedCoverCoating":$("#selectedCoverCoating").val(),"selectedCoverSide":$("#selectedCoverSide").val(),"selectedCoverColor":$("#selectedCoverColor").val(),
                            "selectedBindingDirection":$("#selectedBindingDirection").val(),"selectedPaper":$("#selectedPaper").val(),"selectedSize":$("#selectedSize").val(),
                            "selectedAmount":$("#selectedAmount").val(),"selectedAnnalsCoverColor":$("#selectedAnnalsCoverColor").val(),"selectedCoverType":$("#selectedCoverType").val(),
                            "selectedHardGold":$("#selectedHardGold").val(),"selectedSignaturePage":$("#selectedSignaturePage").val(),"selectedBinding":$("#selectedBinding").val()},
                        success: function (data) {
                            $("#cash_calculate").show();
                            var totalPrice = data * $("#selectedAmount").val();
                            $("#cash").val(data);
                            $("#totalPrice").val(totalPrice);
                        }




                    });//ajax


                }//if

            }//else

        })
    })


</script>

<div align="center">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-3">
                        <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
                        <div class="row">
                            <div class="col-md-3">
                                <img alt="Bootstrap Image Preview"
                                     src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
                            </div>
                            <div class="col-md-3">
                                <img alt="Bootstrap Image Preview"
                                     src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
                            </div>
                            <div class="col-md-3">
                                <img alt="Bootstrap Image Preview"
                                     src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
                            </div>
                            <div class="col-md-3">
                                <img alt="Bootstrap Image Preview"
                                     src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
                            </div>
                        </div>
                    </div>
                    <form action="" method="">
                        <div class="col-md-9">
                            <h3 class="text-warning">
                                h3. Lorem ipsum dolor sit amet.
                            </h3>

                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>

                                    </th>
                                    <th align="right">
                                        <input type="reset" value="리셋">
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
                                            <select id="selectedSize">
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
                                            <select id="selectedCoverType">
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
                                            <select id="selectedBinding">
                                                <option value="">선택</option>
                                            <c:forEach var="binding" items="${BindingList}">
                                                <option value="${binding}">${binding}</option>
                                            </c:forEach>
                                            </select>

                                            <c:if test="${!empty BindingDirectionList}">
                                            제본방향
                                            <select id="selectedBindingDirection">
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
                                            <select id="selectedCoverSide">
                                                <option value="">선택</option>
                                                <c:forEach var="coverSide" items="${CoverSideList}">
                                                    <option value="${coverSide}">${coverSide}</option>
                                                </c:forEach>
                                            </select>
                                            <select id="selectedCoverColor">
                                                <option value="">선택</option>
                                                <c:forEach var="coverColor" items="${CoverColorList}">
                                                    <option value="${coverColor}">${coverColor}</option>
                                                </c:forEach>
                                            </select><br/>
                                            표지코팅
                                            <select id="selectedCoverCoating">
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
                                            <select id="selectedAnnalsCoverColor">
                                                <option value="">선택</option>
                                                <c:forEach var="annalsCoverColor" items="${AnnalsCoverColorList}">
                                                    <option value="${annalsCoverColor}">${annalsCoverColor}</option>
                                                </c:forEach>
                                            </select><br/>
                                            하드커버 금은박
                                            <select id="selectedHardGold">
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
                                        <select id="selectedTextBothSides">
                                            <option value="">선택</option>
                                            <c:forEach var="textBothSides" items="${TextBothSidesList}">
                                                <option value="${textBothSides}">${textBothSides}</option>
                                            </c:forEach>
                                        </select>
                                        <select id="selectedTextColor">
                                            <option value="">선택</option>
                                            <c:forEach var="textColor" items="${TextColorList}">
                                                <option value="${textColor}">${textColor}</option>
                                            </c:forEach>
                                        </select>

                                        <c:if test="${no!=4}">
                                        <input type="text" id="selectedPage" name="page" size="1">page<br/>
                                        </c:if>

                                        용지
                                        <select id="selectedPaper">
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
                                            <select id="selectedSignaturePage">
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
                                        <input type="text" id="selectedAmount" name="amount">부
                                    </td>

                                </tr>

                                <tr class="table-warning" id="cash_calculate">
                                    <td align="left">
                                        가격
                                    </td>
                                    <td align="right">
                                        <input type="hidden" id="cash" value="">
                                        <input type="text" id="totalPrice" value="" style="background-color:transparent; border:0 solid black;text-align:right;" readonly>원
                                    </td>

                                </tr>
                                </tbody>
                            </table>


                            <div class="row">
                                <div class="col-md-6">

                                    <input type="submit" value="주문하기"
                                           onclick="javascript: form.action='/orders/orders';"/>
                                </div>
                                <div class="col-md-6">

                                    <input type="submit" value="장바구니"
                                           onclick="javascript: form.action='/orders/cart';"/>

                                </div>


                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/footer.jsp" %>