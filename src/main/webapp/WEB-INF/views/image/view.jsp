<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- util JS -->
<script type="text/javascript" src="/js/util.js"></script>
<!-- 댓글 객체 replyService -->
<script type="text/javascript" src="/js/reply.js"></script>
<!-- 댓글 이벤트 처리 replyService 호출해서 DB 처리 -->
<script type="text/javascript" src="/js/replyEvent.js"></script>

	<title>이미지 보기</title>
	
	<style type="text/css">
		#imageChangeDiv{
			display: none; /* 맨 처음에 안 보임 */
		}
		li > label{
			width: 150px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			// 이미지 변경 버튼 이벤트
			$("#imageChangeDivShowBtn").click(function(){
				$("#imageChangeDiv").show();
			});
			
			// 이미지 변경 취소 버튼 클릭 시 숨기기
			$("#cancelBtn").click(function(){ 
				$("#imageChangeDiv").hide();
			});
			
			// 리스트 버튼 클릭 이벤트
			$("#listBtn").on("click", function(){
				var no = $(this).find(".no").text();
				location = "list.do?page=${param.page}"
							+ "&perPageNum=${param.perPageNum}"
							+ "&key=${param.key}"
							+ "&word=${param.word}";
			});
			// 수정 버튼 클릭 이벤트
			$("#updateBtn").on("click",function(){
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

	<div class="col-md-12">
		<!-- 페이지 제목 -->
		<h1 class="h2 mb-2 text-gray-800"><strong>Image</strong></h1>
	</div>
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="m-0 font-weight-bold text-default">Image View Page</h6>
		</div>
		
		<div class="card-body">
			<ul class="list-group">
				<li class="list-group-item"><label>번호</label><strong id="no">${vo.no }</strong></li>
				<li class="list-group-item"><label>제목</label>${vo.title }</li>
				<li class="list-group-item"><label>첨부이미지</label>
					<img src="${vo.fileName }">
					<div>
						<button class="btn btn-link" id="imageChangeDivShowBtn">이미지 변경</button>
						<div id="imageChangeDiv">
							<form action="imageChange.do" method="post" enctype="multipart/form-data">
								<input type="hidden" name="no" value="${vo.no }">
								<input type="hidden" name="page" value="${param.page }">
								<input type="hidden" name="perPageNum" value="${param.perPageNum }">
								<input type="hidden" name="key" value="${param.key }">
								<input type="hidden" name="word" value="${param.word }">
								<input type="hidden" name="deleteName" value="${vo.fileName }"> <!-- 원래 있던 파일 -->
								<div class="form-group">
									<label for="imageFile">변경 파일</label>
									<input class="form-control" type="file" id="imageFile" name="imageFile" required="required">
								</div>
								<div align="right">
									<button class="btn btn-xs btn-outline-primary">Modify</button>
									<button class="btn btn-xs btn-outline-danger" type="button" id="cancelBtn">Cancel</button>
								</div>
							</form>
						</div>
					</div>
				</li>
				<li class="list-group-item"><label>내용</label>${vo.content }</li>
				<li class="list-group-item"><label>아이디</label>${vo.id }</li>
				<li class="list-group-item"><label>작성일</label><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd" /></li>
			</ul>
			<div>
				<div class="alert alert-warning">
					<strong>수정 유의 사항!</strong> 정보만 수정할 수 있습니다. 이미지 파일을 이미지 아래 변경 버튼을 사용하세요.
				</div>
				<div align="right">
					<button data-oper="update" id="updateBtn" class="btn btn-xs btn-outline-primary">Modify</button>
					<button data-oper="delete" id="deleteBtn" class="btn btn-xs btn-outline-danger">Delete</button>
					<button data-oper="list" id="listBtn" class="btn btn-xs btn-outline-primary">List</button>
				</div>
			</div>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card shadow mb-4 -->
		
	<!-- 댓글 부분 -->
	<%@ include file="imageReply.jsp" %>