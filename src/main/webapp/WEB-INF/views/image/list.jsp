<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
	<title>이미지 리스트</title>
	
	<style type="text/css">
		.dataRow:hover {
			cursor: pointer;
		}
		.card-body {
			padding-top: 0;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$("#key").val("${(!emptypageObject.key)? 'ti':pageObject.key}");
			$("#word").val("${pageObject.word}");
			$("#perPageNum").val("${pageObject.perPageNum}");
			
			$(".dataRow").click(function(){
				var no = $(this).find(".no").text();
				location = "view.do?no=" + no 
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
			});
		})
	</script>
	
	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>Image</strong></h1>
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="font-weight-bold text-default float-left" style="margin: 5px 0 0">Image List Page</h6>
			<c:if test="${!empty login }">
				<a href="write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-sm btn-primary float-right">New Register</a>
			</c:if>
		</div>
			
		<div class="card-body">
			<!-- 한 줄 시작 -->
			<div class="row">
				<div class="col-md-12">
					<form action="list.do">
						<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					
						<div class="input-group mt-3 mb-3">
					    	<div class="input-group-prepend">
					    		<select class="form-control" id="key" name="key">
					        		<option value="ti">전체</option>
					        		<option value="t">제목</option>
					        		<option value="i">아이디</option>
							  	</select>
					      	</div>
					     	<input type="text" class="form-control" placeholder="Search" id="word" name="word">
					      	<div class="input-group-append">
								<button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
					 	 	</div>
					    </div>
					</form>
				</div>
			
				<c:forEach items="${list }" var="vo" varStatus="vs">
				<!-- 이미지 데이터 한개 표시 시작 -->
				<div class="col-md-3 dataRow">
					<div class="card">
						<img class="card-img-top" src="${vo.fileName }" alt="image" style="width: 100%; height:200px">
						<div class="card-body">
							<p class="card-text"><span class="no">${vo.no }</span>. ${vo.title }</p>
							<div>${vo.id } (<fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/>)</div>
						</div>
					</div>
				</div>
				<!-- 이미지 데이터 한개 표시 끝 -->
				<c:if test="${vs.count % 4 == 0 && vs.count != pageObject.perPageNum }">
					${"</div></br>" }
					${"<div class='row'>" }
				</c:if>
				</c:forEach>
			</div>
			<!-- /.row : 한 줄 끝 -->
			<br>
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }"/>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card shadow mb-4 -->


