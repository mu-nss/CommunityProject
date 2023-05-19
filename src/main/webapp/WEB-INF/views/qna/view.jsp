<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<title>질문답변 보기</title>
	
	<script type="text/javascript">
		$(function(){
			$("#deleteBtn").click(function(){
				return confirm("정말 삭제하시겠습니까?");
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
						<button data-oper="answer" class="btn btn-xs btn-primary"
								onclick="location = 'answer.do?no=${vo.no }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}'">answer</button>
					</c:if>
					<c:if test="${vo.id == login.id }">
						<button data-oper="update" class="btn btn-xs btn-primary"
								onclick="location = 'update.do?no=${vo.no }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}'">modify</button>
						<button data-oper="delete" class="btn btn-xs btn-primary"
								onclick="location = 'delete.do?no=${vo.no }&perPageNum=${param.perPageNum}" id="deleteBtn" class="btn btn-default'">delete</button>
					</c:if>
				</c:if>
				<button data-oper="list" class="btn btn-xs btn-primary"
						onclick="location = 'list.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}'">list</button>
			</div>
		</div>	
		<!-- /.card-body -->
	</div>
	<!-- /.h2 mb-2 text-gray-800 -->