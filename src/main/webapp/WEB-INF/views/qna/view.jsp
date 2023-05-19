<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<title>질문답변 보기</title>
	
	<script type="text/javascript">
		$(function(){
			// 리스트 버튼 클릭 이벤트
			$("#listBtn").on("click", function(){
				var no = $(this).find(".no").text();
				location = "list.do?page=${param.page}"
							+ "&perPageNum=${param.perPageNum}"
							+ "&key=${param.key}"
							+ "&word=${param.word}";
			});
			// 답변하기 버튼 클릭 이벤트
			$("#answerBtn").on("click", function(){
				location = "answer.do?no=${vo.no}"
							+ "&page=${param.page}"
							+ "&perPageNum=${param.perPageNum}"
							+ "&key=${param.key}"
							+ "&word=${param.word}";
			});
			// 수정 버튼 클릭 이벤트
			$("#updateBtn").on("click", function(){
				location = "update.do?no=${vo.no}"
							+ "&page=${param.page}"
							+ "&perPageNum=${param.perPageNum}"
							+ "&key=${param.key}"
							+ "&word=${param.word}";
			});
			// 삭제 버튼 클릭 이벤트
			$("#deleteBtn").on("click",function(){
				if(confirm("정말 삭제하시겠습니까?"))
					location = "delete.do?no=${vo.no}&perPageNum=${param.perPageNum}";
			});
		});
	</script>
	
	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>QnA</strong></h1>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="m-0 font-weight-bold text-default">QnA View Page</h6>
		</div>
		
		<div class="card-body">
			<form method="post">
				<input type="hidden" name="perPageNum" value="${param.perPageNum }">
				
				<div class="form-group">
					<div class="form-group">
						<label for="no">번호</label>
						<input class="form-control" type="text" id="no" name="no" value="${vo.no }">
					</div>
					<div class="form-group">
						<label for="title">제목</label>
						<input class="form-control" type="text" id="title" name="title" value="${vo.title }">
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea rows="5" class="form-control" id="content" name="content">${vo.getContent().replace("/n", "<br>")}</textarea>
					</div>
					<div class="form-group">
						<label for="id">아이디</label>
						<input class="form-control" type="text" id="id" name="id" value="${vo.id }">
					</div>
					<div class="form-group">
						<label for="writeDate">작성일</label>
						<input class="form-control" type="text" id="writeDate" name="writeDate"
							value="<fmt:formatDate value='${vo.writeDate }' pattern='yyyy-MM-dd'/>">
					</div>
					<div class="form-group">
						<label for="hit">조회수</label>
						<input class="form-control" type="text" id="hit" name="hit" value="${vo.hit }">
					</div>
				</div>
			</form>
	
			<br>
			<div align="right">
				<c:if test="${!empty login }">
					<c:if test="${vo.id != login.id }">
						<button data-oper="answer" id="answerBtn" class="btn btn-xs btn-outline-primary">Answer</button>
					</c:if>
					<c:if test="${vo.id == login.id }">
						<button data-oper="update" id="updateBtn" class="btn btn-xs btn-outline-primary">Modify</button>
						<button data-oper="delete" id="deleteBtn" class="btn btn-xs btn-outline-danger">Delete</button>
					</c:if>
				</c:if>
				<button data-oper="list" id="listBtn" class="btn btn-xs btn-outline-primary">List</button>
			</div>
		</div>	
		<!-- /.card-body -->
	</div>
	<!-- /.h2 mb-2 text-gray-800 -->