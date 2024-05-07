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