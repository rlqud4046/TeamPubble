<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="include/header.jsp" %>

<style>

    .hr1 {
        border: solid 1px gold;
    }

    .main19-best1-text {
        margin-top: 20px;
        color: #333;
        line-height: 20px;
    }

    .main19-best1-text1 {
        float: left;
        font-size: 20px;
        font-weight: 700;
    }

    .main19-best1-text2 {
        float: left;
        margin-left: 5px;
        padding-top: 3px;
        font-size: 13px;
        background-color: white;
    }

    .main19-best1-order {
        float: right;
        padding-top: 3px;
    }

</style>

        <br/>

        <div class="carousel slide" id="carousel-249579">
            <ol class="carousel-indicators">
                <li data-slide-to="0" data-target="#carousel-249579">
                </li>
                <li data-slide-to="1" data-target="#carousel-249579" class="active">
                </li>
                <li data-slide-to="2" data-target="#carousel-249579">
                </li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item">
                    <img id="carousel-img1" class="d-block w-100" alt="Carousel Bootstrap First" height="500"
                         src="./images/main4.png">
                </div>
                <div class="carousel-item active">
                    <img id="carousel-img2" class="d-block w-100" alt="Carousel Bootstrap Second" height="500"
                         src="./images/main5.png">
                </div>
                <div class="carousel-item">
                    <img id="carousel-img3" class="d-block w-100" alt="Carousel Bootstrap Third" height="500"
                         src="./images/main6.png">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carousel-249579" data-slide="prev"><span
                    class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a
                class="carousel-control-next" href="#carousel-249579" data-slide="next"><span
                class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
        </div>

<br/>
<br/>

<div align="center">
    <div style="width:65%">
            <div class="row">
                <div class="col-md-6">
                    <h4 align="left">BEST상품</h4>
                    <hr class="hr1"/>
                    <img id="best-img" align="left" alt="Bootstrap Image Preview" src="./images/best.png" width="100%">
                </div>
                <div class="col-md-6">
                    <h4 align="left">CONPUB 가이드</h4>
                    <hr class="hr1"/>
                    <div class="row">
                        <div class="col-md-6">
                        <img id="guide-img1" alt="Bootstrap Image Preview" src="./images/guide1.png">
                        </div>
                        <div class="col-md-6">
                        <img id="guide-img2" alt="Bootstrap Image Preview" src="./images/guide2.png">
                        </div>
                    </div>
                </div>
            </div>

        <br/>

        <h4 align="left">인기상품</h4>
        <hr class="hr1"/>
        <div class="row">
            <div class="col-md-3">
                <img alt="Bootstrap Image Preview" id="ingi-img1" src="./images/ingi1.png">
                <div class="main19-best1-text">
                    <div class="main19-best1-text1">도서</div>
                    <div class="main19-best1-text2">독립출판</div>
                    <div class="main19-best1-order"><a href="/items?no=2"><img src="./images/main19-order.png" alt="주문하기"></a></div>
                </div>
            </div>
            <div class="col-md-3">
                <img alt="Bootstrap Image Preview" id="ingi-img2" src="./images/ingi2.png">
                <div class="main19-best1-text">
                    <div class="main19-best1-text1">홍보물</div>
                    <div class="main19-best1-text2">카탈로그</div>
                    <div class="main19-best1-order"><a href="/items?no=6"><img src="./images/main19-order.png" alt="주문하기"></a></div>
                </div>
            </div>
            <div class="col-md-3">
                <img alt="Bootstrap Image Preview" id="ingi-img3" src="./images/ingi3.png">
                <div class="main19-best1-text">
                    <div class="main19-best1-text1">포토북</div>
                    <div class="main19-best1-text2"></div>
                    <div class="main19-best1-order"><a href="/items?no=8"><img src="./images/main19-order.png" alt="주문하기"></a></div>
                </div>
            </div>
            <div class="col-md-3">
                <img alt="Bootstrap Image Preview" id="ingi-img4" src="./images/ingi4.png">
                <div class="main19-best1-text">
                    <div class="main19-best1-text1">홍보물</div>
                    <div class="main19-best1-text2">팜플렛</div>
                    <div class="main19-best1-order"><a href="/items?no=5"><img src="./images/main19-order.png" alt="주문하기"></a></div>
                </div>
            </div>
        </div>

        <br/>
        <br/>
        <br/>

    </div>
</div>
<%@include file="include/footer.jsp" %>