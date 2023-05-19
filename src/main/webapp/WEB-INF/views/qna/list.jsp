<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>질문답변 리스트</title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(
				function() {
					var no = $(this).find(".no").text();
					location = "view.do?no=" + no + "&inc=1"
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
				});
	});
</script>

	<!-- 페이지 제목 -->
	<h1 class="h2 mb-2 text-gray-800"><strong>QnA</strong></h1>
	<!-- 테이블 데이터 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="font-weight-bold text-default float-left" style="margin: 5px 0 0">QnA List Page</h6>
			<a href="question.do" class="btn btn-sm btn-primary float-right">New Register</a>
		</div>
			
		<div class="card-body">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="vo">
							<tr class="dataRow">
								<td class="no">${vo.no }</td>
								<td><c:forEach begin="1" end="${vo.levNo * 3 }">&nbsp;</c:forEach>
									<c:if test="${vo.levNo > 0 }">
										<i class="material-icons">subdirectory_arrow_right</i>
									</c:if> ${vo.title }</td>
								<td>${vo.id }</td>
								<td><fmt:formatDate value="${vo.writeDate }"
										pattern="yyyy-MM-dd" /></td>
								<td>${vo.hit }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.h2 mb-2 text-gray-800 -->