<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/js/calendar.js"></script>
<script type="text/javascript" src="/js/checkIdPw.js"></script>

	<title>회원가입</title>
	
	<style type="text/css">
		h5 {
			margin-bottom: 30px;
		}
		.card {
			width: 400px;
			margin-top: 100px;
		}
	</style>
	
	<div class="container">
        <!-- Outer Row -->
    	<div class="row justify-content-center">
			<div class="card shadow md-4">
				<div class="card-body">
					<form action="write.do" id="writeForm" method="post" enctype="multipart/form-data">
						<!-- 페이지 제목 --> 
						<div>
							<h5 class="text-center"><strong>Create an Account!</strong></h5>
						</div>
						<!-- 아이디 -->
						<div class="form-group">
							<div class="input-group">
								<input type="text" name="id" id="id" class="form-control" placeholder="ID"
									required="required" pattern="[A-Za-z0-9]{4,20}" autocomplete="off">
							</div>
							<div class="idCheckDiv" id="idCheckDiv"></div>
						</div>
						<!-- 비밀번호 -->
						<div class="form-group row">
							<!-- 비밀번호 입력 -->
                        	<div class="col-sm-6 mb-3 mb-sm-0">
                            	<input type="password" class="form-control" name="pw" id="pw" placeholder="Password" 
                            		required="required" pattern=".{4,20}">
                            	<div class="pwCheckDiv" id="pwCheckDiv"></div>
                            </div>
                            <!-- 비밀번호 확인 -->
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="repeatPw" name="repeatPw" placeholder="Repeat Password"
                                	required="required" pattern=".{4,20}">
                                <div class="repeatPwCheckDiv" id="repeatPwCheckDiv"></div>
                           	</div>
                        </div>
                        <!-- 이름 -->
						<div class="form-group">
							<div class="input-group mb-3">
								<input type="text" name="name" id="name" class="form-control" placeholder="Name" 
									required="required" pattern="[가-힣]{2,10}" autocomplete="off">
							</div>
						</div>
                        <!-- 성별 -->
						<div class="form-group">
							<div class="input-group mb-3">
								<div class="form-check-inline">
									<label>Gender : </label>
								</div>
								<div class="form-check-inline">
									<label class="form-check-label">
								    	<input type="radio" class="form-check-input" name="gender" checked="checked" value="남자">male
								 	</label>
								</div>
								<div class="form-check-inline">
								  	<label class="form-check-label">
								    	<input type="radio" class="form-check-input" name="gender" value="여자">female
								  	</label>
								</div>
							</div>
						</div>
                        <!-- 생년월일 -->
						<div class="form-group">
							<div class="input-group mb-3">
								<input type="text" name="birth" id="birth" class="form-control datepicker" placeholder="Birth" 
									required="required" autocomplete="off">
							</div>
						</div>
                        <!-- 연락처 -->
						<div class="form-group">
							<div class="input-group mb-3">
								<input type="text" name="tel" id="tel" class="form-control" placeholder="Contact (Tel)" 
									autocomplete="off">
							</div>
						</div>
                        <!-- 이메일 -->
						<div class="form-group">
							<div class="input-group mb-3">
								<input type="text" name="email" id="email" class="form-control" placeholder="Email" 
									required="required" autocomplete="off">
							</div>
						</div>
                        <!-- 사진 -->
						<div class="form-group">
							<div class="input-group mb-3">
								<input name="photoFile" id="photoFile" type="file">
							</div>
						</div>
						<!-- 등록 버튼 -->
						<div align="center">
							<button type="submit" class="btn btn-outline-primary btn-user btn-block">Join</button>
						</div>
					</form>
					<!-- /form -->
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card shadow md-4 -->
		</div>
	</div>