<%@include file ="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<style>

    /* Set a style for all buttons */
    .button1 {
        background-color: #F2CB61;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 10%;
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

<div>
    <h1>비밀번호 찾기</h1>
    <div align="center">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" id="id"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" id="email"></td>
            </tr>
        </table>

        <br />

        <p>* 아이디와 이메일을 입력하시면 이메일로 임시비밀번호를 보내드립니다.</p>

        <br />

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

    </div>
</div>

<%@include file ="../include/footer.jsp" %>

<script>

    $(function() {

        $("#modal01").click(function(){

            var id = $("#id").val()
            var email = $("#email").val()

            if($("#id").val() != "" && $("#email").val() != "") { // 아이디와 이메일 이 공백이 아닐경우

                $.ajax({

                    type: "post",
                    url: "/member/find/pwd/ok",
                    data: {"id": id, "email": email},
                    success: function (data) {
                        if (data == 0) {

                            var titleText = '<span  style="color: #000; "> 일치하는 회원 정보가 없습니다. </span>';

                            $("#modalTitle").text("");
                            $("#modalTitle").append(titleText);

                            var btn1 = '<button type="button" onclick="document.getElementById(\'id01\').style.display=\'none\'" class="cancelbtn">확인</button>';
                            var btn2 = '<button type="button" onclick=location.href="/" class="deletebtn">메인으로</button>';

                            $("#btn01").text("");
                            $("#btn02").text("");
                            $("#btn01").append(btn1);
                            $("#btn02").append(btn2);

                        } else {


                            location.href="/member/find/change?email=" + data

                        }
                    }

                }) // ajax end

            }else { // 아이디 또는 이메일을 공백으로 입력했을 경우
                var titleText = '<span  style="color: #000; "> 아이디와 이메일을 입력해주세요. </span>';

                $("#modalTitle").text("");
                $("#modalTitle").append(titleText);

                var btn1 = '<button type="button" onclick="document.getElementById(\'id01\').style.display=\'none\'" class="cancelbtn">확인</button>';
                var btn2 = '<button type="button" onclick=location.href="/" class="deletebtn">메인으로</button>';

                $("#btn01").text("");
                $("#btn02").text("");
                $("#btn01").append(btn1);
                $("#btn02").append(btn2);

            }

        })

    })

</script>
