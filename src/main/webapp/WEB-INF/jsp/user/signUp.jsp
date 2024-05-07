<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<%--회원가입 제목 영역 --%>
	<div>
		<h3 class="text-center mt-2">회원가입</h3>
		<hr>
	</div>
	
	<%--회원가입 박스 --%>
	<div class="sign-up-box">
		<form id="signUpForm" method="post" action="/user/sign-up">
			<table class="sign-up-table table table-bordered">
				<tr>
					<th>아이디(4자 이상)</th>
					<td>
						<div class="d-flex">
							<input type="text" id="loginId" name="loginId" class="form-control col-8" placeholder="아이디를 입력하세요">
							<button type="button" id="loginIdCheckBtn" class="btn btn-info ml-2">중복확인</button>
						</div>
						
						<%--아이디 체크 결과 --%>
						<div id="idCheckLength" class="small text-danger d-none">아이디를 4자이상 입력해주세요.</div>
						<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
						<div id="idCheckOk" class="small text-success d-none">사용가능한 ID입니다.</div>
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" id="password" name="password" class="form-control col-8" placeholder="비밀번호를 입력하세요">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" id="confirmPassword" name="confirmPassword" class="form-control col-8" placeholder="비밀번호를 입력하세요">
					</td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="name" name="name" class="form-control col-8" placeholder="이름을 입력하세요">
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" id="email" name="email" class="form-control col-8" placeholder="이메일을 입력하세요">
					</td>
				</tr>
			</table>
			<%--가입하기 영역 --%>
			<div class="d-flex justify-content-center">
				<button type="submit" id="signUpBtn" class="btn btn-success">가입하기</button>
			</div>	
		</form>
		
		<div class="already-sign-up mt-2 text-center">
			<a href="/user/sign-in-view">이미 계정이 있으신가요?</a>	
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	//아이디 중복 확인
	//중복확인 버튼 클릭하면
	$('#loginIdCheckBtn').on('click', function() {
		//경고문구 초기화
		$('#idCheckLength').addClass("d-none");
		$('#idCheckDuplicated').addClass("d-none");
		$('#idCheckOk').addClass("d-none");
		
		let loginId = $('#loginId').val().trim();
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none');
			return;
		}
		
		//ajax-중복확인
		$.ajax({
			//request
			url:"/user/is-duplicated-id"
			, data:{"loginId":loginId}
		
			//response
			, success:function(data) {
				if (data.isDuplicated) { //아이디가 중복이라면
					$('#idCheckDuplicated').removeClass("d-none");
				} else { //아이디가 중복 아니라 사용가능하다면
					$('#idCheckOk').removeClass('d-none');
				}
			}
			, error:function(request, status, error) {
				alert("중복확인에 실패했습니다.");
			}
		});
	});//아이디 중복확인
	
	//회원가입
	$('#signUpForm').on('submit', function(e) {
		e.preventDefault(); //서브밋 기능 막는다
		
		//validation
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		let confirmPassword = $('#confirmPassword').val();
		let name = $('#name').val().trim();
		let email = $('#email').val().trim();
		
		if (loginId == '') {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if (!password || !confirmPassword) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if (password != confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		if (!name) {
			alert("이름을 입력하세요.");
			return false;
		}
		
		//사용가능한 아이디입니다가 안떠있다면
		if ($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		
		//ajax - 응답값 json
		let url = $(this).attr('action');
		console.log(url);
		let params = $(this).serialize(); //serialize: 폼태그에 있는 name 속성-값으로 파라미터 구성
		console.log(params);
		
		$.post(url, params) //request
		.done(function(data) { //response
			if (data.code == 200) { //성공
				alert("가입을 환영합니다. 로그인을 해주세요");
				location.href = "/user/sign-in-view";
			} else {
				//로직상 실패
				alert(data.errorMessage);
			}
		});
	}); //회원가입 
});
</script>