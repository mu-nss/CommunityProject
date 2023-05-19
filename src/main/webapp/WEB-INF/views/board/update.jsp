<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<title>게시판 글 수정</title>
	
	<script type="text/javascript">
		$(function(){
			var formObj = $("#updateForm");
			
			$("button[data-oper='remove']").on("click", function(){
				// form 태그의 action 속성을 바꿔서 remove로 가게 만든다.
				if(!confirm("삭제하시겠습니까?")) return false;
				formObj.attr("action", "remove").submit();
			});
		});
	</script>

	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>Board</strong></h1>
	
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="font-weight-bold text-default float-left" style="margin: 5px 0 0">Board Update Page</h6>
		</div>
		
		<div class="card-body">
				<form role="form" method="post" id="updateForm">
					<input type="hidden" name="page" value="${param.page }">
					<input type="hidden" name="perPageNum" value="${param.perPageNum }">
				
					<div class="form-group">
						<label>no</label>
						<input class="form-control" name="no" value="${vo.no }" readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label>
						<input class="form-control" name="title" value="${vo.title }">
					</div>
					<div class="form-group">
						<label>Writer</label>
						<input class="form-control" name="writer" value="${vo.writer }">
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea class="form-control" name="content" rows="3">${vo.content }</textarea>
					</div>
					<div align="right">
						<button data-oper="modify" class="btn btn-primary">수정</button>
						<button data-oper="remove" class="btn btn-danger">삭제</button>
						<button data-oper="list" class="btn btn-secondary" type="button" onclick="location = 'list.do'">리스트</button>
					</div>
				</form>
			</div>
 		<!-- /.card-body -->
	</div>
	<!-- /.card shadow mb-4 -->

