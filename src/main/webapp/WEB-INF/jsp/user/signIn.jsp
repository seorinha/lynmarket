<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<%--로그인 제목 영역 --%>
	<div>
		<h3 class="text-center mt-2">로그인</h3>
		<hr>
	</div>

	<%--로그인 박스 --%>
	<div class="login-box">
		<form id="loginForm" method="post" action="/user/sign-in"
			class="d-flex justify-content-center">
			<div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">ID</span>
					</div>
					<input type="text" id="loginId" name="loginId" class="form-control">
				</div>

				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">PW</span>
					</div>
					<input type="password" id="password" name="password"
						class="form-control">
				</div>
			</div>

			<input type="submit" id="loginBtn" class="btn btn-success ml-3"
				value="로그인">
		</form>
	</div>

	<%--네이버 로그인 버튼 --%>
	<div class="d-flex justify-content-center mt-4">
		<a id="naver-login-btn" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=gT5IjJe8sr3XPkEy2PKl&redirect_uri=http://localhost:8080/naver/callback"> 
		<img src="https://static.nid.naver.com/oauth/small_g_in.PNG"
			height="45" width="auto" alt="네이버 로그인 버튼">
		</a>
	</div>

	<div class="text-center mt-3">
		<a href="/user/sign-up-view">회원가입하기</a>
	</div>
</div>

<script>
	$(document).ready(function() {
		//로그인
		$('#loginForm').on('submit', function(e) {
			e.preventDefault();

			let loginId = $('input[name=loginId]').val().trim();
			let password = $('#password').val();

			if (!loginId) {
				alert("아이디를 입력하세요.");
				return false;
			}

			if (!password) {
				alert("비밀번호를 입력하세요.");
				return false;
			}

			//서버에 로그인 정보 보내기
			//ajax
			let url = $(this).attr('action');
			console.log(url);
			let params = $(this).serialize();
			console.log(params);

			$.post(url, params) //request
			.done(function(data) { //response
				if (data.code == 200) {
					location.href = "/home/home-list-view";
				} else {
					alert(data.errorMessage);
				}
			});
		}); //로그인 

	});
</script>