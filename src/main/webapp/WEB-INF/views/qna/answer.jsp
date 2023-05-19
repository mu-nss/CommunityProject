<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<title>질문 답변하기</title>

	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>QnA</strong></h1>
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="m-0 font-weight-bold text-default">QnA Answer Page
			</h6>
		</div>
			
		<div class="card-body">
			<form method="post">
				<input name="no" value="${vo.no }" type="hidden">
				<input name="page" value="${param.page }" type="hidden">
				<input name="perPageNum" value="${param.perPageNum }" type="hidden">
	<%-- 			<input name="key" value="${param.key }" type="hidden"> --%>
	<%-- 			<input name="word" value="${param.word }" type="hidden"> --%>
				<input name="refNo" value="${vo.refNo }" type="hidden">
				<input name="ordNo" value="${vo.ordNo }" type="hidden">
				<input name="levNo" value="${vo.levNo }" type="hidden">
				
				<div class="form-group">
					<label>제목</label>
					<input name="title" class="form-control" required="required" value="[답변]${vo.title }">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea name="content" class="form-control" rows="5">
	
------------------------- 질문 내용 -------------------------
${vo.content }
					</textarea>
				</div>
				
				<div align="right">
					<button class="btn btn-xs btn-primary">등록</button>
					<button class="btn btn-xs btn-primary" data-oper="reset" type="reset">새로고침</button>
					<button class="btn btn-primary" type="reset" onclick="location = 'list.do'" id="cancelBtn">취소</button>
				</div>
			</form>
		</div>	
		<!-- /.card-body -->
	</div>
	<!-- /.h2 mb-2 text-gray-800 -->