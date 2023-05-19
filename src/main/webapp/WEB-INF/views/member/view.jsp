<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

	<title>내 정보 보기</title>
	
	<style type="text/css">
		.input-group-text{
			width: 90px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			// 리스트 버튼 클릭 이벤트
			$("#listBtn").on("click", function(){
				var id = $(this).find(".id").text();
				location = "list.do?page=${param.page}"
							+ "&perPageNum=${param.perPageNum}"
							+ "&key=${param.key}"
							+ "&word=${param.word}";
			});
			// 수정 버튼 클릭 이벤트
			$("#updateBtn").on("click",function(){
				location = "update.do?id=${vo.id}"
							+ "&page=${param.page}";
			});

			// 삭제 버튼 클릭 이벤트
			$("#deleteBtn").on("click",function(){
				if(confirm("정말 삭제하시겠습니까?"))
					location = "delete.do?id=${vo.id}&perPageNum=${param.perPageNum}";
			});
		});
	</script>

	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>Member</strong></h1>
	
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="font-weight-bold text-default float-left" style="margin: 5px 0 0">${title }</h6>
		</div>
		<div class="card-body">
				<input type="hidden" name="perPageNum" value="${param.perPageNum }"> 
				<div class="row">
					<div class="col-md-10">
						<div class="input-group mb-3">
						 	<div class="input-group-prepend">
						      <span class="input-group-text">아이디</span>
						    </div>
							<input class="form-control" type="text" id="id" name="id" value="${vo.id }">
						</div>
						<div class="input-group mb-3">
						 	<div class="input-group-prepend">
						      <span class="input-group-text">이름</span>
						    </div>
							<input class="form-control" type="text" id="name" name="name" value="${vo.name }">
						</div>
						<div class="input-group mb-3">
						 	<div class="input-group-prepend">
						      <span class="input-group-text">생년월일</span>
						    </div>
							<input class="form-control" type="text" id="birth" name="birth"
									value="<fmt:formatDate value='${vo.birth }' pattern='yyyy-MM-dd'/>">
						</div>
						<div class="input-group mb-3">
						 	<div class="input-group-prepend">
						      <span class="input-group-text">성별</span>
						    </div>
							<input class="form-control" type="text" id="gender" name="gender" value="${vo.gender }">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								 <span class="input-group-text">연락처</span>
							</div>
							<input class="form-control" type="text" id="tel" name="tel" value="${vo.tel }">
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group mb-3">
							<img alt="img" src="${vo.photo }" style="width: 200px; height: 200px;" >
						</div>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						 <span class="input-group-text">이메일</span>
					</div>
					<input class="form-control" type="text" id="email" name="email" value="${vo.email }">
				</div>
				<!-- 관리자 버튼 메뉴 - 상태 변경-->
				<form action="chageStatus.do" method="post">
					<div class="input-group mb-3">
						<input type="hidden" name="id" value="${vo.id }">
						<input type="hidden" name="page" value="${param.page }">
						<input type="hidden" name="perPageNum" value="${param.perPageNum }">
							
						<div class="input-group-prepend">
							 <span class="input-group-text">계정상태</span>
						</div>
						<select name="status" class="form-control">
							<option ${(vo.status == "정상")? "selected":"" } value="정상">정상</option>
							<option ${(vo.status == "탈퇴")? "selected":"" } value="탈퇴">탈퇴</option>
							<option ${(vo.status == "강퇴")? "selected":"" } value="강퇴">강퇴</option>
							<option ${(vo.status == "휴면")? "selected":"" } value="휴면">휴면</option>
						</select>
						<c:if test="${!empty param.id && login.id != vo.id && login.gradeNo == 9 }">
							<div class="input-group-append">
								<button class="btn btn-outline-primary" id="changeStatusBtn">변경</button>
							</div>
						</c:if>
					</div>
				</form>
				<!-- 관리자 버튼 메뉴 - 등급 변경-->
				<form action="changeGradeNo.do" method="post">
					<div class="input-group mb-3">
						<input type="hidden" name="id" value="${vo.id }">
						<input type="hidden" name="page" value="${param.page }">
						<input type="hidden" name="perPageNum" value="${param.perPageNum }">
						
						<div class="input-group-prepend">
							 <span class="input-group-text">등급번호</span>
						</div>
						<select name="gradeNo" class="form-control">
							<option ${(vo.gradeNo == "1")? "selected":"" } value="1">일반회원 (1)</option>
							<option ${(vo.gradeNo == "9")? "selected":"" } value="9">관리자 (9)</option>
						</select>
						<c:if test="${!empty param.id && login.id != vo.id && login.gradeNo == 9 }">
							<div class="input-group-append">
								<button class="btn btn-outline-primary" id="changeGradeNoBtn">변경</button>
							</div>
						</c:if>
					</div>
				</form>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						 <span class="input-group-text">가입일</span>
					</div>
					<input class="form-control" type="text" id="regDate" name="regDate"
						value="<fmt:formatDate value='${vo.regDate }' pattern='yyyy-MM-dd'/>">
				</div>

				<div align="right">
					<!-- 개인 버튼 메뉴 -->
					<c:if test="${empty param.id}">
						<button class="btn btn-primary" type="button" id="updateBtn">Update</button>
						<button class="btn btn-primary" type="button" id="changePwBtn">Change Pw</button>
						<button class="btn btn-primary" type="button" id="deleteBtn">Delete</button>
					</c:if>
					<button class="btn btn-primary" type="button" id="listBtn">List</button>
				</div>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card shadow mb-4 -->