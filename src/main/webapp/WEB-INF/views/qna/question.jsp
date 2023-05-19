<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<title>질문답변 질문하기</title>
	
	<script type="text/javascript">
		$(function(){
			$("#cancelBtn").click(function(){
				history.back();
			});
		});
	</script>

	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>QnA</strong></h1>
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="m-0 font-weight-bold text-default"> QnA Question Page</h6>
		</div>
			
		<div class="card-body">
			<form method="post">
				<input type="hidden" name="perPageNum" value="${param.perPageNum }" >
				
				<div class="form-group">
					<label>제목</label>
					<input name="title" class="form-control" required="required">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea name="content" class="form-control" rows="5"></textarea>
				</div>
				<div align="right">
					<button class="btn btn-xs btn-outline-primary">Register</button>
					<button class="btn btn-xs btn-outline-secondary" data-oper="reset" type="reset">Reset</button>
					<button class="btn btn-xs btn-outline-danger" type="reset" onclick="location = 'list.do'" id="cancelBtn">Cancel</button>
				</div>

			</form>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card shadow mb-4 -->
