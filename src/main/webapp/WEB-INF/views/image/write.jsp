<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<title>이미지 등록</title>
	
	<script type="text/javascript">
		$(function(){});
	</script>
	
	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>Image</strong></h1>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="m-0 font-weight-bold text-default">Image Write Page</h6>
		</div>
		
		<div class="card-body">
			<form action="write.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="perPageNum" value="${param.perPageNum }">
				
				<div class="form-group">
					<label for="title">제목</label>
					<input name="title" id="title" class="form-control" required="required">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea rows="5" name="content" id="content" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<label for="imageFile">첨부파일</label>
					<input name="imageFile" id="imageFile" class="form-control" type="file">
				</div>
				
				<div align="right">
					<button class="btn btn-xs btn-outline-primary">Register</button>
					<button class="btn btn-xs btn-outline-secondary" type="reset">Reset</button>
					<button class="btn btn-xs btn-outline-danger" type="reset" onclick="location = 'list.do'" id="cancelBtn">Cancel</button>
				</div>
			</form>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card shadow mb-4 -->
