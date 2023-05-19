<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

	<title>공지사항 리스트</title>
	
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
			$("#key").val("${(!emptypageObject.key)? 'tcw':pageObject.key}");
			$("#word").val("${pageObject.word}");
			$("#perPageNum").val("${pageObject.perPageNum}");

			// 리스트 데이터 클릭 이벤트
			$(".dataRow").on("click", function(){
				var no = $(this).find(".no").text();
				location = "view.do?no=" + no
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}";
			});
		});
	</script>

	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>Notice</strong></h1>
	
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="font-weight-bold text-default float-left" style="margin: 5px 0 0">Notice List Page</h6>
			<c:if test="${!empty login }">
				<a href="write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-sm btn-primary float-right">New Register</a>
			</c:if>
		</div>
		
		<div class="card-body">
			<!-- 검색 -->
			<div class="row">
				<div class="col-md-12">
					<form action="list.do" method="post">
						<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					
						<div class="input-group mt-3 mb-3">
					    	<div class="input-group-prepend">
					    		<select class="form-control" id="key" name="key">
					        		<option value="tcw">전체</option>
					        		<option value="t">제목</option>
					        		<option value="c">내용</option>
					        		<option value="w">작성자</option>
					        		<option value="tc">제목/내용</option>
					        		<option value="tw">제목/작성자</option>
					        		<option value="cw">내용/작성자</option>
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
			        	<th>번호</th>
			        	<th>제목</th>
			        	<th>작성일</th>
			      	</tr>
			    </thead>
			    <tbody>
					<c:forEach items="${list }" var="vo">
						<tr class="dataRow">
							<td><strong><span class="no">${vo.no }</span></strong></td>
							<td>${vo.title }</td>
							<td><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></td>
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