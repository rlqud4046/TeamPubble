<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file ="../include/header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-3">
                    <div class="btn-group btn-group-lg btn-group-vertical" role="group">
                        <button class="btn btn-warning" type="button" onclick="location.href='/shoppingInfo'">
                            쇼핑정보
                        </button>
                        <button class="btn btn-warning" type="button" onclick="location.href='/cart'">
                            장바구니
                        </button>
                        <button class="btn btn-warning" type="button" onclick="location.href='/mileage?id=${sessionScope.member.memberId}'">
                            마일리지
                        </button>
                        <button class="btn btn-warning" type="button" onclick="location.href='/updateInfo'">
                            회원정보수정
                        </button>
                        <button class="btn btn-warning" type="button" onclick="location.href='/unsubscribe'">
                            회원탈퇴
                        </button>
                    </div>
                </div>



                <div class="col-md-9">
                    <h3>
                        회원정보수정
                    </h3>
<!-- 비밀번호 확인 -->
                    <form role="form">
                        <div class="form-group">
                            <label for="exampleInputPassword1">
                                Password
                            </label>
                            <input type="password" class="form-control" id="exampleInputPassword1" />
                        </div>
                        <button type="submit" class="btn btn-warning">
                            확인
                        </button>
                    </form>
<!-- 수정 창 -->
                    <div class="container">
                        <h1>회원정보수정</h1>
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
                                <input type="submit" value="가입하기">
                                <input type="reset" value="취소">
                            </div>
                        </form>

                    </div>




                </div>
            </div>
        </div>
    </div>
</div>

<!-- ajax 비동기통신 -->
<script>


</script>
<%@include file ="../include/footer.jsp" %>