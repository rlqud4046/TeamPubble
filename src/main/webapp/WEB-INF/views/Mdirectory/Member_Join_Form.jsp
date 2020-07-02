<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<h1>가입폼창</h1>

<div class="container">
    <h1>회원가입</h1>
    <form id="forms" method="post" action="<%= request.getContextPath() %>/member/join" onsubmit="return submitCheck()">
        <table class="table table-bordered table-hover">

            <!-- 이름 -->
            <tr class="form-group">
                <td>이름</td>
                <td>
                    <input type="text" name="memberName" id="name" >
                    <span id="namecheck"></span>
                </td>

            </tr>

            <!-- 나이 -->
            <tr class="form-group">
                <td>생년월일</td>
                <td>
                    <input type="text" name="memberBirth" id="birth">
                    <span id="birthcheck"></span>
                </td>
            </tr>


            <!-- 아이디 -->
            <tr class="form-group">
                <td>아이디</td>
                <td>
                    <input id="member_id" name="memberId" type="text" placeholder="5~20자리 숫자,영문">
                    <button type="button" id="idcheck_btn" class="btn btn-info">중복확인</button>

                    <span id="idcheck"></span>
                </td>
            </tr>

            <!-- 비밀번호 -->
            <tr class="form-group">
                <td>비밀번호</td>
                <td>
                    <input type="password" name="memberPwd"  id="pwd1" placeholder="8~16자리 숫자,영문,특문">

                    <span id="pwdcheck1"></span>
                </td>
            </tr>

            <!-- 비밀번호 확인 -->
            <tr class="form-group">
                <td>비밀번호 확인</td>
                <td>
                    <input type="password" name="pwd" id="pwd2" placeholder="비밀번호 다시 입력">

                    <span id="pwdcheck2"></span>
                </td>
            </tr>

            <!-- 휴대전화 번호 -->
            <tr class="form-group">
                <td>휴대전화 번호</td>
                <td>
                    <select id="bun1" name="bun1">
                        <option>010</option>
                        <option>011</option>
                        <option>017</option>
                        <option>018</option>
                    </select>
                    -
                    <input id="bun2" name="bun2" type="text" size="4" maxlength="4">
                    -
                    <input id="bun3" name="bun3" type="text" size="4" maxlength="4">
                    <span id="buncheck"></span>
                </td>
            </tr>

            <!-- SMS 수신여부 -->
            <tr class="form-group">
                <td>SMS 수신여부</td>
                <td>
                    <input type="radio" id="smsdong" name="smsAgree" value="YES">
                    <label for="smsdong">동의</label>
                    <input type="radio" id="smsbdong" name="smsAgree" value="NO">
                    <label for="smsbdong">거부</label>
                    <span id="smscheck"></span>
                </td>
            </tr>

            <!-- 이메일 주소 -->
            <tr class="form-group">
                <td>이메일 주소</td>
                <td>
                    <input type="text" name="Email1" id="email1">
                    @
                    <input type="text" name="Email2" id="emailInput" placeholder="나머지 입력">

                    <select id="select1" onchange="">
                        <option value="직접입력">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                    <span id="emailcheck"></span>
                </td>
            </tr>

            <!-- 이메일 수신여부 -->
            <tr class="form-group">
                <td>이메일 수신여부</td>
                <td>
                    <input type="radio" id="emaildong" name="emailAgree" value="YES">
                        <label for="emaildong">동의</label>
                    <input type="radio" id="emailbdong" name="emailAgree" value="NO">
                        <label for="emailbdong">거부</label>
                    <span id="emailsusin"></span>
                </td>
            </tr>

        </table>

        <div align="center">
            <input class="btn btn-group" type="submit" value="가입하기">
            <input class="btn btn-group" type="reset" value="취소">
        </div>
    </form>

</div>

<%@include file ="../include/footer.jsp" %>

<script>

    $(function() {

        $("#name").blur(function () {
            $("#namecheck").hide();

            if ($("#name").val() == ""){  // 공백 체크
                var ment ='<font color ="red">필수 입력사항입니다.</font>';
                $("#namecheck").text('');
                $("#namecheck").show();
                $("#namecheck").append(ment);
            }else{
                var userNameCheck = /^[가-힣]{2,4}$/;

                if(!userNameCheck.test($("#name").val())) { // 정규식 체크
                    var ment = '<font color ="red">올바르지 못한 형태입니다.</font>';
                    $("#namecheck").text('');
                    $("#namecheck").show();
                    $("#namecheck").append(ment);
                }else{
                    var ment = '<font color ="green">O</font>';
                    $("#namecheck").text('');
                    $("#namecheck").show();
                    $("#namecheck").append(ment);
                }
            }

        })  // 이름 관련 end

        $("#birth").blur(function () {
            $("#birthcheck").hide();

            if ($("#birth").val() == ""){  // 공백 체크
                var ment ='<font color ="red">필수 입력사항입니다.</font>';
                $("#birthcheck").text('');
                $("#birthcheck").show();
                $("#birthcheck").append(ment);
            }else{
                var userBirthCheck = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;

                if(!userBirthCheck.test($("#birth").val())) { // 정규식 체크
                    var ment = '<font color ="red">올바르지 못한 형태입니다.</font>';
                    $("#birthcheck").text('');
                    $("#birthcheck").show();
                    $("#birthcheck").append(ment);
                }else{
                    var ment = '<font color ="green">O</font>';
                    $("#birthcheck").text('');
                    $("#birthcheck").show();
                    $("#birthcheck").append(ment);
                }
            }
        }) // 생년월일 관련 end

        $("#emailInput").blur(function () {  // 이메일 관련
            if($("#email1").val() == "" || $("#emailInput").val() == "") {
                var ment = '<font color ="red"> 필수 입력사항입니다.</font>';
                $("#emailcheck").text('');
                $("#emailcheck").show();
                $("#emailcheck").append(ment);
            }else{
                var ment = '<font color ="green">O</font>';
                $("#emailcheck").text('');
                $("#emailcheck").show();
                $("#emailcheck").append(ment);
            }
        })

        $("#select1").change(function(){
            if($("#select1").val() == "직접입력"){
                $("#emailInput").val("");
                $("#emailInput").focus();
            }else{
                $("#emailInput").val($(this).val());
                if($("#email1").val() == ""){
                    $("#email1").focus();
                }
            }
        });

        $("#idcheck_btn").click(function() {  // 아이디 관련 사항들
            $("#idcheck").hide();

            var userId = $("#member_id").val();

            if($("#member_id").val() == ""){  // 공백 체크
                var ment ='<font color ="red">필수 입력사항입니다.</font>';
                $("#idcheck").text('');
                $("#idcheck").show();
                $("#idcheck").append(ment);
                $("#member_id").val('').focus();
            }else {
                var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);

                if (!userIdCheck.test($("#member_id").val())) {  // 정규식 체크
                    var ment = '<font color ="red">올바르지 못한 형태입니다.</font>';
                    $("#idcheck").text('');
                    $("#idcheck").show();
                    $("#idcheck").append(ment);
                    $("#member_id").val('').focus();
                } else {
                    $.ajax({
                        type: "post",
                        url: "/member/id/overlap/check",
                        data: {"userId": userId},

                        success: function (data) {  // DB에 있는 아이디와 중복 체크
                            if (data == 1) {
                                var ment = '<font color ="green">O</font>';
                                $("#idcheck").text('');
                                $("#idcheck").show();
                                $("#idcheck").append(ment);
                                $("#pwd1").val('').focus();
                            } else if (data == 0) {
                                var ment = '<font color ="red">이미 사용중인 아이디입니다.</font>';
                                $("#idcheck").text('');
                                $("#idcheck").show();
                                $("#idcheck").append(ment);
                                $("#member_id").val('').focus();
                            }
                        }, error: function () { // 데이터 통신이 실패한 경우
                            alert('data error');
                        }
                    }) // ajax end
                }
            }
        })  // id 관련 체크사항 end

        $("#pwd1").blur(function () {  // pwd1 에서 포커스가 떠나면 이벤트 발생

            $("#pwdcheck1").hide();

            if($("#pwd1").val() == ""){   // 공백 체크
                var ment = '<font color="red">필수 입력사항입니다.</font>';
                $("#pwdcheck1").text('');
                $("#pwdcheck1").show();
                $("#pwdcheck1").append(ment);
            }else{

                var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);

                if(!passwdCheck.test($("#pwd1").val())){  // 비밀번호 정규식 검사
                    var ment = '<font color ="red">올바르지 못한 형태입니다.</font>';
                    $("#pwdcheck1").text('');
                    $("#pwdcheck1").show();
                    $("#pwdcheck1").append(ment);
                }else{
                    var ment = '<font color ="green">O</font>';
                    $("#pwdcheck1").text('');
                    $("#pwdcheck1").show();
                    $("#pwdcheck1").append(ment);
                    $("#pwd2").val("").focus();
                }
            }
        })  // pwd1 관련 체크 end

        $("#pwd2").blur(function () {

            if($("#pwd2").val() == ""){  // 공백 체크
                var ment = '<font color="red" >필수 입력사항입니다.</font>';
                $("#pwdcheck2").text('');
                $("#pwdcheck2").show();
                $("#pwdcheck2").append(ment);
            }else{
                if($("#pwd1").val() != $("#pwd2").val()){  // 비밀번호 일치 체크
                    var ment = '<font color="red" > 비밀번호가 불일치합니다.</font>';
                    $("#pwdcheck2").text('');
                    $("#pwdcheck2").show();
                    $("#pwdcheck2").append(ment);
                }else{
                    var ment = '<font color="green" >O</font>';
                    $("#pwdcheck2").text('');
                    $("#pwdcheck2").show();
                    $("#pwdcheck2").append(ment);
                }
            }
        })

        $("#bun3").blur(function () {
            if($("#bun2").val() == "" || $("#bun3").val() == ""){
                var ment = '<font color="red" > 필수 입력사항입니다.</font>';
                $("#buncheck").text('');
                $("#buncheck").show();
                $("#buncheck").append(ment);
            }else{
                var bunCheck= /[^0-9]/g
                if(bunCheck.test($("#bun2").val()) || bunCheck.test($("#bun3").val())){
                    var ment = '<font color="red" > 숫자만 입력가능합니다</font>';
                    $("#buncheck").text('');
                    $("#buncheck").show();
                    $("#buncheck").append(ment);
                }else{
                    var ment = '<font color="green" >O</font>';
                    $("#buncheck").text('');
                    $("#buncheck").show();
                    $("#buncheck").append(ment);
                }
            }
        })



    })

    function submitCheck() {

        var userNameCheck = /^[가-힣]{2,4}$/;
        var userBirthCheck = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
        var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
        var passwdCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
        var bunCheck= /[^0-9]/g

        if ($("#name").val() == ""){  // 공백 체크
            var ment ='<font color ="red">필수 입력사항입니다.</font>';
            $("#namecheck").text('');
            $("#namecheck").show();
            $("#namecheck").append(ment);
            return false;
        }else{
            if(!userNameCheck.test($("#name").val())) { // 정규식 체크
                var ment = '<font color ="red">올바르지 못한 형태입니다.</font>';
                $("#namecheck").text('');
                $("#namecheck").show();
                $("#namecheck").append(ment);
                return false;
            }else{
                var ment = '<font color ="green">O</font>';
                $("#namecheck").text('');
                $("#namecheck").show();
                $("#namecheck").append(ment);
            }
        }


        if ($("#birth").val() == ""){  // 공백 체크
            var ment ='<font color ="red">필수 입력사항입니다.</font>';
            $("#birthcheck").text('');
            $("#birthcheck").show();
            $("#birthcheck").append(ment);
            return false;
        }else{
            if(!userBirthCheck.test($("#birth").val())) { // 정규식 체크
                var ment = '<font color ="red">올바르지 못한 형태입니다.</font>';
                $("#birthcheck").text('');
                $("#birthcheck").show();
                $("#birthcheck").append(ment);
                return false;
            }else{
                var ment = '<font color ="green">O</font>';
                $("#birthcheck").text('');
                $("#birthcheck").show();
                $("#birthcheck").append(ment);
            }
        }



        if($("#member_id").val() == ""){  // 공백 체크
            var ment ='<font color ="red">필수 입력사항입니다.</font>';
            $("#idcheck").text('');
            $("#idcheck").show();
            $("#idcheck").append(ment);
            $("#member_id").val('').focus();
            return false;
        }else {
            if (!userIdCheck.test($("#member_id").val())) {  // 정규식 체크
                var ment = '<font color ="red">올바르지 못한 형태입니다.</font>';
                $("#idcheck").text('');
                $("#idcheck").show();
                $("#idcheck").append(ment);
                $("#member_id").val('').focus();
                return false;
            } else {

                var userId = $("#member_id").val();

                $.ajax({
                    type: "post",
                    url: "/member/id/overlap/check",
                    data: {"userId": userId},

                    success: function (data) {  // DB에 있는 아이디와 중복 체크
                        if (data == 0) {
                            var ment = '<font color ="red">이미 사용중인 아이디입니다.</font>';
                            $("#idcheck").text('');
                            $("#idcheck").show();
                            $("#idcheck").append(ment);
                            $("#member_id").val('').focus();
                            return false;
                        }else{
                            var ment = '<font color ="green">O</font>';
                            $("#idcheck").text('');
                            $("#idcheck").show();
                            $("#idcheck").append(ment);
                        }
                    }, error: function () { // 데이터 통신이 실패한 경우
                        alert('data error');
                    }
                }) // ajax end
            }
        }



        if($("#pwd1").val() == ""){   // 공백 체크
            var ment = '<font color="red">필수 입력사항입니다.</font>';
            $("#pwdcheck1").text('');
            $("#pwdcheck1").show();
            $("#pwdcheck1").append(ment);
            return false;
        }else{
            if(!passwdCheck.test($("#pwd1").val())){  // 비밀번호 정규식 검사
                var ment = '<font color ="red">올바르지 못한 형태입니다.</font>';
                $("#pwdcheck1").text('');
                $("#pwdcheck1").show();
                $("#pwdcheck1").append(ment);
                return false;
            }else{
                var ment = '<font color ="green">O</font>';
                $("#pwdcheck1").text('');
                $("#pwdcheck1").show();
                $("#pwdcheck1").append(ment);
            }
        }



        if($("#pwd2").val() == ""){  // 공백 체크
            var ment = '<font color="red" >필수 입력사항입니다.</font>';
            $("#pwdcheck2").text('');
            $("#pwdcheck2").show();
            $("#pwdcheck2").append(ment);
            return false;
        }else{
            if($("#pwd1").val() != $("#pwd2").val()){  // 비밀번호 일치 체크
                var ment = '<font color="red" > 비밀번호가 불일치합니다.</font>';
                $("#pwdcheck2").text('');
                $("#pwdcheck2").show();
                $("#pwdcheck2").append(ment);
                return false;
            }else{
                var ment = '<font color="green" >O</font>';
                $("#pwdcheck2").text('');
                $("#pwdcheck2").show();
                $("#pwdcheck2").append(ment);
            }
        }



        if($("#bun2").val() == "" || $("#bun3").val() == ""){  // 전화번호 공백 체크
            var ment = '<font color="red" > 필수 입력사항입니다.</font>';
            $("#buncheck").text('');
            $("#buncheck").show();
            $("#buncheck").append(ment);
            return false;
        }else{
            if(bunCheck.test($("#bun2").val()) || bunCheck.test($("#bun3").val())){
                var ment = '<font color="red" > 숫자만 입력가능합니다</font>';
                $("#buncheck").text('');
                $("#buncheck").show();
                $("#buncheck").append(ment);
                return false;
            }else{
                var ment = '<font color="green" >O</font>';
                $("#buncheck").text('');
                $("#buncheck").show();
                $("#buncheck").append(ment);
            }
        }

        if(!($("#smsdong").is(":checked") || $("#smsbdong").is(":checked"))){
            var ment = '<font color="red" > 동의 또는 거부를 눌러주세요</font>';
            $("#smscheck").text('');
            $("#smscheck").show();
            $("#smscheck").append(ment);
            return false;
        }else{
            var ment = '<font color="green  " >O</font>';
            $("#smscheck").text('');
            $("#smscheck").show();
            $("#smscheck").append(ment);
        }

        if($("#email1").val() == "" || $("#emailInput").val() == ""){
            var ment = '<font color="red" > 필수 입력사항입니다.</font>';
            $("#emailcheck").text('');
            $("#emailcheck").show();
            $("#emailcheck").append(ment);
            return false;
        }else{
            var ment = '<font color="green" >O</font>';
            $("#emailcheck").text('');
            $("#emailcheck").show();
            $("#emailcheck").append(ment);
        }

        if(!($("#emaildong").is(":checked") || $("#emailbdong").is(":checked"))){
            var ment = '<font color="red" > 동의 또는 거부를 눌러주세요</font>';
            $("#emailsusin").text('');
            $("#emailsusin").show();
            $("#emailsusin").append(ment);
            return false;
        }else{
            var ment = '<font color="green  " >O</font>';
            $("#emailsusin").text('');
            $("#emailsusin").show();
            $("#emailsusin").append(ment);
        }
    }

</script>

<%@include file ="../include/footer.jsp" %>