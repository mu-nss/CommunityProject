<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pageObject" required="true" type="com.webjjang.util.PageObject" %>
<%@ attribute name="listURI" required="true" type="java.lang.String" %>
<%@ attribute name="query" required="false" type="java.lang.String" %>

<% /** PageNation을 위한 사용자 JSP 태그  *
	 * 작성자 웹짱 이영환 강사 
	 * 작성일 2021.03.30
	 * 버전 3.0
	 
	 * 사용방법 :<pageObject:pageNav listURI="호출 List URL"
	 			pageObject= "웹짱 페이지 객체" query="댓글 페이지, 검색등 뒤에 붙이는 쿼리" />
     ________________________________________________________________________
	 * 작성자 유튜브 보고 공부하는 MunSJ
	 * 수정일 2023-04-10
	 * 부트스트랩 무료 템플릿(버전 4)적용 후 페이지네이션, 아이콘 적용이 안 돼서 <ui>, <li>, <i>의 클래스 수정 및 추가 함
   */ %>

<% request.setAttribute("noLinkColor", "#999"); %>
<% request.setAttribute("tooltip", " data-toggle=\"tooltip\" data-placement=\"top\" "); %>
<% request.setAttribute("noMove", " title=\"no move page!\" "); %>
<ul class="pagination justify-content-end">
  	<li class="page-item" data-page=1>
		<c:if test="${pageObject.page > 1 }">
	  		<a class="page-link" href="${listURI }?page=1&perPageNum=${pageObject.perPageNum}${query}"
	  		  title="click to move first page!" ${tooltip } >
	  			<i class="fa fa-fast-backward"></i>
	  		</a>
  		</c:if>
		<c:if test="${pageObject.page == 1 }">
	  		<a class="page-link" href="" onclick="return false" ${noMove }  ${tooltip }>
	  			<i class="fa fa-fast-backward" style="color: ${noLinkColor};"></i>
	  		</a>
	  	</c:if>
	</li>
	
	
	<li class="page-item" data-page=${pageObject.startPage -1 }>
		<c:if test="${pageObject.startPage > 1 }">
	  		<a class="page-link" href="${listURI }?page=${pageObject.startPage - 1 }&perPageNum=${pageObject.perPageNum}${query}"
	  		  title="click to move previous page group!" ${tooltip } >
	  			<i class="fa fa-step-backward"></i>
	  		</a>
	  	</c:if>
		<c:if test="${pageObject.startPage == 1 }">
	  		<a class="page-link" href="" onclick="return false"
	  		 ${noMove } ${tooltip }>
	  			<i class="fa fa-step-backward" style="color: ${noLinkColor};"></i>
	  		</a>
	  	</c:if>
  	</li>
  	
	<c:forEach begin="${pageObject.startPage }" end="${pageObject.endPage }" var="cnt">
	  	<li class="page-item" ${(pageObject.page == cnt)?"class=\"active\"":"" } 
	  	 data-page=${cnt }>
	  	 	<!-- 페이지와 cnt가 같으면 링크가 없음 -->
	  	 	<c:if test="${pageObject.page == cnt }">
	  			<a class="page-link" href="" onclick="return false"
	  			 ${noMove } ${tooltip }>${cnt}</a>
	  	 	</c:if>
	  	 	<!-- 페이지와 cnt가 같지 않으면 링크가 있음 -->
	  	 	<c:if test="${pageObject.page != cnt }">
	  			<a class="page-link" href="${listURI }?page=${cnt }&perPageNum=${pageObject.perPageNum}${query}"
		  		 title="click to move ${cnt } page" ${tooltip }>${cnt}</a>
	  		</c:if>
	  	</li>
	</c:forEach>
	<c:if test="${pageObject.endPage < pageObject.totalPage }">
	  	<li class="page-item" data-page=${pageObject.endPage + 1 }>
	  		<a class="page-link" href="${listURI }?page=${pageObject.endPage + 1 }&perPageNum=${pageObject.perPageNum}${query}"
	  		  title="click to move next page group!" ${tooltip } >
	  			<i class="fa fa-step-forward"></i>
	  		</a>
	  	</li>
  	</c:if>
	<c:if test="${pageObject.endPage == pageObject.totalPage }">
	  	<li class="page-item" data-page=${pageObject.endPage + 1 }>
	  		<a class="page-link" href="" onclick="return false"
	  		 ${noMove }  ${tooltip } >
	  			<i class="fa fa-step-forward" style="color: ${noLinkColor};"></i>
	  		</a>
	  	</li>
  	</c:if>
	<c:if test="${pageObject.page < pageObject.totalPage }">
	  	<li class="page-item" data-page=${pageObject.totalPage }>
	  		<a class="page-link" href="${listURI }?page=${pageObject.totalPage }&perPageNum=${pageObject.perPageNum}${query}"
	  		  title="click to move last page!" ${tooltip } >
		  		<i class="fa fa-fast-forward"></i>
	  		</a>
	  	</li>
  	</c:if>
	<c:if test="${pageObject.page == pageObject.totalPage }">
	  	<li class="page-item" data-page=${pageObject.totalPage }>
	  		<a class="page-link" href="" onclick="return false"
	  		 ${noMove }  ${tooltip } >
		  		<i class="fa fa-fast-forward" style="color: ${noLinkColor};"></i>
	  		</a>
	  	</li>
  	</c:if>
</ul> 

<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
  $(".pagination").mouseover(function(){
//   		$(".tooltip > *:last").css({"background-color": "red", "border": "1px dotted #444"});   
	});
});
</script>