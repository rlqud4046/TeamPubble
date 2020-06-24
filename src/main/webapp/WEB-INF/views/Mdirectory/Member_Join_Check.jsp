<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>



<style>

    /* Set a style for all buttons */
    .button1 {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .button1:hover {
        opacity:1;
    }

    /* Float cancel and delete buttons and add an equal width */
    .cancelbtn, .deletebtn {
        float: left;
        width: 50%;
        height: 60px;
    }

    /* Add a color to the cancel button */
    .cancelbtn {
        background-color: #F2CB61;
        color: black;
    }

    /* Add a color to the delete button */
    .deletebtn {
        background-color: #8C8C8C;
    }

    /* Add padding and center-align text to the container */
    .container1 {
        padding: 16px;
        text-align: center;

    }

    /* The Modal (background) */
    /*.modal {
        display: none; !* Hidden by default *!
        position: fixed; !* Stay in place *!
        z-index: 1; !* Sit on top *!
        left: 20%;
        top: 20%;
        width: 50%; !* Full width *!
        height: 50%; !* Full height *!
        overflow: auto; !* Enable scroll if needed *!
        background-color: #474e5d;
        padding-top: 250px;
    }*/

    /* Modal Content/Box */
    .modal-content {
        background-color: #D5D5D5;
        margin: 20% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 35%; /* 모달 사이즈 */
    }

    /* Style the horizontal ruler */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    /* The Modal Close Button (x) */
    .close {
        position: absolute;
        right: 35px;
        top: 15px;
        font-size: 40px;
        font-weight: bold;
        color: #f1f1f1;
    }

    .close:hover,
    .close:focus {
        color: #f44336;
        cursor: pointer;
    }

    /* Clear floats */
    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

    /* Change styles for cancel button and delete button on extra small screens */
    @media screen and (max-width: 300px) {
        .cancelbtn, .deletebtn {
            width: 100%;
        }
    }

    @media screen and (max-width: 768px) {

        .modal-content {
            background-color: #D5D5D5;
            margin: 60% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
            border: 1px solid #888;
            width: 90%; /* Could be more or less, depending on screen size */
        }

    }


</style>

<h1>본인인증 및 가입여부확인</h1>
<h3>회원가입 여부 확인을 위해 이름과 이메일주소를 입력해주세요.</h3>
<div class="container" align="center">

    <table cellspacing="0" border="1">

        <tr>
            <td>이름</td>
            <td><input type="text" id="name" name="name"></td>
            <td rowspan="2">

                <button id="modal01" onclick="document.getElementById('id01').style.display='block'" class="button1">확인</button>

                <div id="id01" class="modal">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">×</span>
                    <form class="modal-content">
                        <div class="container1">
                            <h1 id="modalTitle"> </h1>

                            <div class="clearfix">
                                <span id="btn01"> </span>
                                <span id="btn02"> </span>
                            </div>
                        </div>
                    </form>
                </div>
        </tr>

        <tr>
            <td>이메일</td>
            <td><input type="text" id="email" name="email"></td>
        </tr>
    </table>


</div>


<%@include file ="../include/footer.jsp" %>

<script type="text/javascript">

    $(function(){

        $("#modal01").click(function(){   // 확인버튼 클릭시 이벤트 발생

            var name = $("#name").val();
            var email = $("#email").val();

            if($("#name").val() != "" && $("#email").val() != ""){ // 아이디와 이메일 이 공백이 아닐경우

                $.ajax({
                    type : "post",              // 데이터 전송 방식(GET,POST방식)
                    url  : "/member/check",       // 파일의 주소와 경로
                    data : {"name" : name, "email" : email},
                    // 통신이 성공한 경우 결과값을 data라는 변수에 저장
                    success  : function(data){

                        if(data == 1){  // 아이디와 이메일이 일치하는 회원이 없는 경우
                            var titleText = '<span  style="color: #000; "> 회원가입이 가능합니다.</span>';

                            $("#modalTitle").text("");
                            $("#modalTitle").append(titleText);

                            var btn1 = '<button type="button" onclick="document.getElementById(\'id01\').style.display=\'none\'" class="cancelbtn">확인</button>';
                            var btn2 = '<button type="button" onclick=location.href="/member/join/form" class="deletebtn">회원가입하기</button>';

                            $("#btn01").text("");
                            $("#btn02").text("");
                            $("#btn01").append(btn1);
                            $("#btn02").append(btn2);
                            return false;

                        }else if(data == 0){ // 아이디와 이메일이 일치하는 회원이 있는 경우
                            var titleText = '<span  style="color: #000; "> 가입안됨.</span>';
                            $("#modalTitle").text("");
                            $("#modalTitle").append(titleText);

                            var btn1 = '<button type="button" onclick="document.getElementById(\'id01\').style.display=\'none\'" class="cancelbtn">확인</button>';
                            var btn2 = '<button type="button" onclick=location.href="#" class="deletebtn">비밀번호 재발급</button>';

                            $("#btn01").text("");
                            $("#btn02").text("");
                            $("#btn01").append(btn1);
                            $("#btn02").append(btn2);
                            return false;
                        }
                    },
                    error : function() { // 데이터 통신이 실패한 경우
                        alert('data error');
                    }
                }); // ajax end

            } else { // 아이디 또는 이메일을 공백으로 입력했을 경우
                var titleText = '<span  style="color: #000; "> 아이디와 이메일을 입력해주세요. </span>';

                $("#modalTitle").text("");
                $("#modalTitle").append(titleText);

                var btn1 = '<button type="button" onclick="document.getElementById(\'id01\').style.display=\'none\'" class="cancelbtn">확인</button>';
                var btn2 = '<button type="button" onclick=location.href="/" class="deletebtn">메인으로</button>';

                $("#btn01").text("");
                $("#btn02").text("");
                $("#btn01").append(btn1);
                $("#btn02").append(btn2);
                return false;

            }

        });
    });

</script>