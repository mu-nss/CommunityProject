<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

	<title>회원 관리 리스트</title>
	
	<style type="text/css">
		.dataRow:hover {
			background: #eee;
			cursor: pointer;
		}
		.card-body {
			padding-top: 0;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			// 검색 데이터 유지
			$("#key").val("${(!emptypageObject.key)? 'ine':pageObject.key}");
			$("#word").val("${pageObject.word}");
			$("#perPageNum").val("${pageObject.perPageNum}");

			// 리스트 데이터 클릭 이벤트
			$(".dataRow").on("click", function(){
				var id = $(this).find(".id").text();
				location = "view.do?id=" + id
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}";
			});
		});
	</script>

	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>Member Management</strong></h1>
	
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="font-weight-bold text-default float-left" style="margin: 5px 0 0">Member List Page</h6>
		</div>
		
		<div class="card-body">
			<!-- 검색 -->
			<div class="row">
				<div class="col-md-12">
					<form action="list.do">
						<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					
						<div class="input-group mt-3 mb-3">
					    	<div class="input-group-prepend">
					    		<select class="form-control" id="key" name="key">
					        		<option value="ine">전체</option>
					        		<option value="i">아이디</option>
					        		<option value="n">이름</option>
					        		<option value="e">이메일</option>
							  	</select>
					      	</div>
					     	<input type="text" class="form-control" placeholder="Search" id="word" name="word">
					      	<div class="input-group-append">
								<button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
					 	 	</div>
					    </div>
					</form>
				</div>
			</div>
			
			<table class="table">
				<thead>
			    	<tr>
			        	<th>아이디</th>
			        	<th>이름</th>
			        	<th>생년월일</th>
			        	<th>성별</th>
			        	<th>연락처</th>
			        	<th>이메일</th>
			        	<th>계정상태</th>
			        	<th>등급번호</th>
			        	<th>등급명</th>
			      	</tr>
			    </thead>
			    <tbody>
					<c:forEach items="${list }" var="vo">
						<tr class="dataRow">
							<td class="id">${vo.id }</td>
							<td>${vo.name }</td>
							<td><fmt:formatDate value="${vo.birth }" pattern="yyyy-MM-dd"/></td>
							<td>${vo.gender }</td>
							<td>${vo.tel }</td>
							<td>${vo.email }</td>
							<td>${vo.status }</td>
							<td>${vo.gradeNo }</td>
							<td>${vo.gradeName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<div>
				<pageNav:pageNav listURI="list.do" pageObject="${pageObject }"/>
			</div>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card shadow mb-4 -->