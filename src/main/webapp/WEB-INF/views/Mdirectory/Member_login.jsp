<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>

    var IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init("imp59762723"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

</script>

<div>
<h1>로그인</h1>
    <div align="center">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" id="id"></td>
                <td rowspan="2"><input id="log_btn" class="btn btn-group" type="button" value="로그인"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" id="pwd"></td>
            </tr>
        </table>

        <br />

        <center>
            <c:choose>
                <c:when test="${sessionId != null}">
                    <h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
                    <h3>'${sessionId}' 님 환영합니다! </h3>
                    <h3><a href="logout">로그아웃</a></h3>
                </c:when>
                <c:otherwise>

                    <br>
                    <!-- 네이버 로그인 창으로 이동 -->
                    <div id="naver_id_login" style="text-align:center"><a href="${url}">
                        <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
                    <br>
                </c:otherwise>
            </c:choose>
        </center>

        <hr width="50%" color="yellow"/>

        <input type="button" class="btn btn-group" value="회원가입" onclick="location.href='/member/rule'">
        <input type="button" class="btn btn-group" value="아이디 찾기" onclick="location.href='/member/find/id'">
        <input type="button" class="btn btn-group" value="비밀번호 찾기" onclick="location.href='/member/find/pwd'">

        <br/>
        <br/>
        <br/>
        <br/>

        <button onclick="requestPay()">결제하기</button>

        <script>
            function requestPay() {
                // IMP.request_pay(param, callback) 호출    param객체에 데이터 넣어서 넘겨오면 될듯
                // pay_method : 결제수단
                // merchant_uid : 가맹점에서 생성/관리하는 고유주문번호
                // name : 주문명
                // amount : 결제할 금액
                // buyer_email : 주문자 이메일
                // buyer_tel : 주문자 연락처
                // buyer_name : 주문자 이름
                // buyer_addr : 주문자 주소
                // buyer_postcode : 주문자 우편번호


                IMP.request_pay({ // param
                    pg: "inicis",
                    pay_method: "card",
                    merchant_uid: "ORD11330132-10aa233",
                    name: "노르웨이 회전 의자",
                    amount: 100,
                    buyer_email: "gildong@gmail.com",
                    buyer_name: "홍길동",
                    buyer_tel: "010-4242-4242",
                    buyer_addr: "서울특별시 강남구 신사동",
                    buyer_postcode: "01181"
                }, function(rsp) {
                    console.log(rsp);
                    if (rsp.success) {
                        //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                        $.ajax({
                            url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                            type: 'POST',
                            dataType: 'json',
                            data: {
                                imp_uid: rsp.imp_uid
                                //기타 필요한 데이터가 있으면 추가 전달
                            }
                        }).done(function (data) {
                            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                            if (everythings_fine) {
                                var msg = '결제가 완료되었습니다.';
                                msg += '\n고유ID : ' + rsp.imp_uid;
                                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                                msg += '\n결제 금액 : ' + rsp.paid_amount;
                                msg += '\n카드 승인번호 : ' + rsp.apply_num;

                            } else {
                                //[3] 아직 제대로 결제가 되지 않았습니다.
                                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                            }
                            alert(msg);
                        });
                        /*location.href='<%=request.getContextPath()%>/'; 결제 성공시 페이지 이동*/
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;

                        /*location.href='<%=request.getContextPath()%>/member/rule';  실패시 페이지 이동가능 */
                        alert(msg);
                    }
                });
            }
        </script>



    </div>
</div>



<%@include file ="../include/footer.jsp" %>

<script>

    $(function () {

        $("#log_btn").click(function() {

            var id = $("#id").val();
            var pwd = $("#pwd").val();

            $.ajax({
                type : "post",
                url : "/member/login/ok",
                data : {"id" : id, "pwd" : pwd},
                success : function (data) {
                    if(data != ""){
                        alert("로그인")
                        location.href='/'
                    }else{
                        alert("일치하는 아이디와 비밀번호가 없습니다.")
                    }
                }
            }) ; // ajax end
        })

    })

</script>