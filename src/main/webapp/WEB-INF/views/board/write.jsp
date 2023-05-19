<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

	<title>게시판 글 등록</title>
	
	<script type="text/javascript">
		$(function(){
			// 취소 버튼 이벤트
			$("#cancelBtn").click(function(){
				history.back();
			});
		});
	</script>

	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>Board</strong></h1>
	
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="font-weight-bold text-default float-left" style="margin: 5px 0 0">Board Write Page</h6>
		</div>
		
		<div class="card-body">
			<form action="write.do" method="post">
				<input type="hidden" name="perPageNum" value="${param.perPageNum }"> 
				
				<div class="form-group">
					<label for="title">제목</label>
					<input class="form-control" type="text" id="title" name="title" value="${vo.title }">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea rows="5" class="form-control" id="content" name="content">${vo.getContent().replace("/n", "<br>")}</textarea>
				</div>
				<div class="form-group">
					<label for="writer">작성자</label>
					<input class="form-control" type="text" id="writer" name="writer" value="${vo.writer }">
				</div>

				<div align="right">
					<button class="btn btn-xs btn-outline-primary">Register</button>
					<button class="btn btn-xs btn-outline-secondary" type="reset">Reset</button>
					<button class="btn btn-xs btn-outline-danger" type="button" id="cancelBtn">Cancel</button>
				</div>
			</form>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card shadow mb-4 -->