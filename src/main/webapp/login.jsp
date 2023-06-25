<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.bg-image {
	background-image:
		url('https://github.com/JeonghwanKim30/InvincibleArmadaPage/blob/main/build/classes/resources/loginPage001.jpg?raw=true');
	/* 이미지 파일의 경로로 수정해주세요 */
	background-size: cover;
	background-position: center;
	height: 100vh;
}
</style>
<title>로그인 | 무적함대</title>
</head>
<body>
	<div class="bg-image opacity-50">
		<div class="col-md-4 mx-auto">
			<div class="mx-auto">
				<img alt="" class="img-fluid img-thumbnail rounded-circle" src="https://github.com/JeonghwanKim30/InvincibleArmadaPage/blob/main/build/classes/resources/teamLogo001.png?raw=true">
			</div>
			<form action="main" method="post">
				<div class="container">
					<div class="row">
						<div class="form-group">
							<label for="login_id">회원아이디</label> <input type="text"
								class="form-control" id="login_id" name="login_id"
								placeholder="회원아이디">
						</div>
						<div class="form-group mt-1">
							<label for="login_password">비밀번호</label> <input type="password"
								class="form-control" id="login_password" name="login_password"
								placeholder="비밀번호">
						</div>
						<div class="form-group mt-1 text-primary">
							아직 회원이 아니신가요? <a href="./regist.jsp">회원가입</a>
						</div>
						<div class="form-group mt-3">
							<input type="submit" class="btn btn-success" name="action"
								value="로그인" style="width: 100%">
						</div>
						<div class="form-group mt-1">
							<input type="submit" class="btn btn-success" name="action"
								value="아이디/비밀번호 찾기" style="width: 100%">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>