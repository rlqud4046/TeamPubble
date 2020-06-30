<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    if(data != 1){
                        alert("로그인")
                        location.href='/'
                    }else if(data == 1){
                        alert("일치하는 아이디와 비밀번호가 없습니다.")
                        $("#id").val("");
                        $("#pwd").val("");
                        $("#id").focus();
                    }
                }
            }) ; // ajax end
        })

    })

</script>