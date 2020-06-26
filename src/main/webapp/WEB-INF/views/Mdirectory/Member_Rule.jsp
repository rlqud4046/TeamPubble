<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script>

    $(document).ready(function(){

        $("#checkall").click(function(){
            //클릭되었으면
            if($("#checkall").prop("checked")){
                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                $("input[name=chk]").prop("checked",true);
                //클릭이 안되있으면
            }else{
                //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                $("input[name=chk]").prop("checked",false);
            }
        })

        $("#rule_ok").click(function(){

            var check = $("input[name='chk']").prop("checked");  // 체크되어 있으면 true 안되어있으면 false

            if(check){
                location.href = '/member/join/check'
            }else{
                alert("약관에 동의해 주셔야 합니다.")
            }

        })

    })

</script>


<h1>회원약관</h1>
<h3>CONPUB 회원약관을 읽고 동의해주십시오.</h3>

<div class="container" align="center">

<h3>회원 약관</h3>
<textarea cols="30" rows="7">akslfjklqwjfowafkoapsfjivmav;giigvjj;vagjvgjj;mjsgmjsd;g;mjsgjg;mjgmjgmsjdgjmdgmjgjmgdjmdgjdjmvjx</textarea> <br />
    <input type="checkbox" id="checkbox1" name="chk">
    <label for="checkbox1">회원약관에 동의합니다</label>


<h3>개인정보취급방침</h3>
<textarea cols="30" rows="7">akslfjklqwjfowafkoapsfjivmav;giigvjj;vagjvgjj;mjsgmjsd;g;mjsgjg;mjgmjgmsjdgjmdgmjgjmgdjmdgjdjmvjx</textarea> <br />
    <input type="checkbox" id="checkbox2" name="chk">
    <label for="checkbox2">개인정보취급방침에 동의합니다</label>

<br/>

<input type="checkbox" id="checkall">
    <label for="checkall">전체동의</label>

<br/>

<button id="rule_ok">가입하기</button>
<button onclick="location.href = '/'">취소</button>

</div>


<%@include file ="../include/footer.jsp" %>