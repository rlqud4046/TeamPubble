<!-- 메뉴 하나를 수정하면 파일 5개를 수정해야 하고 중복코드라 헤더로 따로 빼두었었음. 우선 보류함 -->
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