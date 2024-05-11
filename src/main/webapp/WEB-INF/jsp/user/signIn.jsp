<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div>
	<%--�α��� ���� ���� --%>
	<div>
		<h3 class="text-center mt-2">�α���</h3>
		<hr>
	</div>
	
	<%--�α��� �ڽ� --%>
	<div class="login-box">
		<form id="loginForm" method="post" action="/user/sign-in" class="d-flex justify-content-center">
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
					<input type="password" id="password" name="password" class="form-control">
				</div>
			</div>
			

			<input type="submit" id="loginBtn" class="btn btn-success ml-3" value="�α���">
		</form>
	</div>
	
	<div class="text-center mt-3">
		<a href="/user/sign-up-view">ȸ�������ϱ�</a>
	</div>
</div>

<script>
$(document).ready(function() {
	//�α���
	$('#loginForm').on('submit', function(e) {
		e.preventDefault();
		
		let loginId = $('input[name=loginId]').val().trim();
		let password = $('#password').val();
		
		if (!loginId) {
			alert("���̵� �Է��ϼ���.");
			return false;
		}
		
		if (!password) {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
		
		//������ �α��� ���� ������
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
	}); //�α��� 
	
});
</script>