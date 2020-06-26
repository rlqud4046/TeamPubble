<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<h1>가입폼창</h1>

<div class="container">

    <h1>회원가입</h1>
    <form method="post" action="<%= request.getContextPath() %>/member/join">
        <table class="table table-bordered table-hover">

            <!-- 이름 -->
            <tr>
                <td>이름</td>
                <td>
                    <input type="text" name="memberName" id="name">
                    <span id="namecheck"></span>
                </td>

            </tr>

            <!-- 나이 -->
            <tr>
                <td>나이</td>
                <td>
                    <input type="text" name="memberBirth" id="ages">
                </td>
            </tr>


            <!-- 아이디 -->
            <tr>
                <td>아이디</td>
                <td>
                    <input id="member_id" name="memberId" type="text" placeholder="5~20자리 숫자,영문">
                    <input type="button" id="idcheck_btn" value="중복확인">

                    <span id="idcheck"></span>
                </td>
            </tr>

            <!-- 비밀번호 -->
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" name="memberPwd"  id="pwd1" placeholder="8~16자리 숫자,영문,특문">
                </td>
            </tr>

            <!-- 비밀번호 확인 -->
            <tr>
                <td>비밀번호 확인</td>
                <td>
                    <input type="password" name="pwd" id="pwd2" placeholder="비밀번호 다시 입력">
                </td>
            </tr>

            <!-- 휴대전화 번호 -->
            <tr>
                <td>휴대전화 번호</td>
                <td>
                    <select id="tong">
                        <option>통신사 선택</option>
                        <option>SKT</option>
                        <option>KT</option>
                        <option>LG</option>
                        <option>알뜰폰</option>
                    </select>

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
                </td>
            </tr>

            <!-- SMS 수신여부 -->
            <tr>
                <td>SMS 수신여부</td>
                <td>
                    <input type="radio" id="smsdong" name="smsAgree" value="YES">
                    <label for="smsdong">동의</label>
                    <input type="radio" id="smsbdong" name="smsAgree" value="NO">
                    <label for="smsbdong">거부</label>
                </td>
            </tr>

            <!-- 이메일 주소 -->
            <tr>
                <td>이메일 주소</td>
                <td>
                    <input type="text" name="Email1">
                    @
                    <input type="text" name="Email2" id="emailInput" placeholder="나머지 입력">

                    <select class="form-control" id="select1" onchange="">
                        <option value="직접입력">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                </td>
            </tr>

            <!-- 이메일 수신여부 -->
            <tr>
                <td>이메일 수신여부</td>
                <td>
                    <input type="radio" id="emaildong" name="emailAgree" value="YES">
                    <label for="emaildong">동의</label>
                    <input type="radio" id="emailbdong" name="emailAgree" value="NO">
                    <label for="emailbdong">거부</label>
                </td>
            </tr>

        </table>

        <div align="center">
            <input type="submit" value="가입하기">
            <input type="reset" value="취소">
        </div>
    </form>

</div>

<%@include file ="../include/footer.jsp" %>