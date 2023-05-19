<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<title>이미지 수정</title>
	
	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>Image</strong></h1>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="m-0 font-weight-bold text-default">Image Update Page</h6>
		</div>
		
		<div class="card-body">
			<form method="post">
				<input type="hidden" name="page" value="${param.page }">
				<input type="hidden" name="perPageNum" value="${param.perPageNum }">
				
				<div class="form-group">
					<label for="no">번호</label>
					<input name="no" id="no" value="${vo.no }" class="form-control" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="title">제목</label>
					<input name="title" id="title" value="${vo.title }" class="form-control" required="required">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea name="content" id="content" class="form-control" rows="5" >${vo.content }</textarea>
				</div>
				<div align="right">
					<button data-oper="modify" class="btn btn-xs btn-outline-primary">Modify</button>
					<button data-oper="reset" class="btn btn-xs btn-outline-secondary" type="reset">Reset</button>
					<button data-oper="cancel" class="btn btn-xs btn-outline-danger" onclick="location = 'list.do'" id="cancelBtn">Cancel</button>
				</div>
			</form>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- card shadow mb-4 -->