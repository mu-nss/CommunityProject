<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<title>로그인</title>
	<style type="text/css">
		h5 {
			margin-bottom: 30px;
		}
		.row{
			margin-top: 200px;
		}
		.card {
			width: 400px;
		}
	</style>
	
	<div class="container">
        <!-- Outer Row -->
    	<div class="row justify-content-center">
			<div class="card shadow md-4">
				<div class="card-body">
					<form action="login.do" id="loginForm" method="post">
						<!-- 페이지 제목 --> 
						<div>
							<h5 class="text-center"><strong>Welcome Back!</strong></h5>
						</div>
						<!-- 아이디 -->
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="material-icons">person</i></span>
								</div>
								<input type="text" name="id" id="id" class="form-control" placeholder="Enter Id">
							</div>
						</div>
						<!-- 비밀번호 -->
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="material-icons">vpn_key</i></span>
								</div>
								<input type="password" name="pw" id="pw" class="form-control"
									placeholder="Enter password">
							</div>
						</div>
						<div align="center">
							<button type="submit" class="btn btn-outline-primary btn-user btn-block">Login</button>
						</div>
					</form>
					<!-- /form -->
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card shadow md-4 -->
		</div>
	</div>