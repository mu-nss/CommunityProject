/**
 * 댓글 이벤트 처리
 */
$(function(){
	
	// 게시판 글보기의 번호 - id="no" 속성으로 지정
	var no = $("#no").text();
	console.log("replyEvent - no : " + no);
	// replyPagination.js 에서 전역변수 선언
	var pageNum = 1; 
		
	replyUL = $(".chat");
	
	// 맨처음에 댓글 데이터를 가져와서 처리 - 자동 실행
	showList(1);
	
	// 자동으로 실행이 안되고 호출해야 실행된다.
	function showList(page){
		replyService.list(
			{no: no, page:page},
			function(pageObject, list){
				
				// 넘어오는 데이터 확인하기
				console.log("pageObject : " + JSON.stringify(pageObject));
				console.log("list : " + JSON.stringify(list));
				
				// list가 넘어오지 않았거나 데이터가 없는 경우 처리하지 않게한다.
				if(list == null || list.length == 0){
					replyUL.html("<li class='left clearfix'><div>댓글 데이터가 없습니다.</div></li>");
					return;
				}

				// list에 데이터가 있는 경우
				var str = "";
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<li class='left clearfix' data-rno='" + list[i].rno + "' >";
					str += "  <div>";
					str += "     <div class='hader'>";
					str += "        <strong class='primary-font'>" + list[i].replyer + "</strong>";
					str += "        <small class='text-muted'>" + displayTime(list[i].replyDate) + "</small>";
					str += "        <p>" + list[i].reply + "</p>";
					str += "     </div>";
					str += "  </div>";
					str += "</li>";
					str += "<hr>";
				} // for 문의 끝 

				replyUL.html(str); 
				
				// 페이네이션 처리
				// showReplyPage(pageObject);
			}
		);
	} // showList() 끝
	
	// 댓글 등록을 위한 모달 창을 보이게 하는 버튼 이벤트
	$("#addReplyBtn").on("click", function(e){
		$("#modalReply, #modalReplyer").val("");
		$("#modalUpdateBtn, #modalDeleteBtn").hide();
		$("#modalWriteBtn").show();
		$("#myModal").modal("show");
	}); 
	
	// 모달 창의 등록 버튼 이벤트 
	$("#modalWriteBtn").on("click", function(){
		// 데이터 수집
		var reply = {
			reply : $("#modalReply").val(),
			replyer : $("#modalReplyer").val(),
			no : no
		}
		
		// 댓글 등록 함수로 데이터 전달이 잘해서 댓글 등록 진행
		replyService.write(
			reply,
			function(result){
				// 결과 메시지 경고
				alert(result);
				// 댓글 리스트를 새롭게 뿌려 준다.
				showList(1);
			}
		);
		$("#myModal").modal("hide"); // 모달 닫음
	});

	// 댓글 클릭 시 수정/삭제하는 이벤트
	$(replyUL).on("click", "li", function(){
		var rno = $(this).data("rno");
		$("#myModal").data("rno", rno);
		
		// 수정 할 데이터 세팅
		var reply = $(this).find("p").html();
		$("#modalReply").val(reply.replaceAll("<br>", "\n"));
		var replyer = $(this).find("strong").text();
		$("#modalReplyer").val(replyer);
		
		// 필요한 입력 항목은 보이게 필요 없는 보이지 않게
		$("#modalUpdateBtn, #modalDeleteBtn").show();
		$("#modalWriteBtn").hide();
		$("#myModal").modal("show");
	});

	// 댓글 수정 처리 이벤트
	$("#modalUpdateBtn").on("click", function(){
		var reply = {
			reply : $("#modalReply").val(),
			replyer : $("#modalReplyer").val(),
			rno : $("#myModal").data("rno")
		}
		$("#myModal").modal("hide");
		
		// replyService로 보냄
		replyService.update(reply, function(result){
			alert(result);
			showList(pageNum);
		});
	})

	// 댓글 삭제 처리 이벤트
	$("#modalDeleteBtn").on("click", function(){
		replyService.delete($("#myModal").data("rno"),
			function(result){ // 성공했을 때 실행되는 함수
				$("#myModal").modal("hide"); 
				alert(result); 
				showList(1); 
			},
			function(err){ // 실패했을 때 실해되는 함수.
				alert("Error ... : " + err)
			}
		);
	}); 

//	// 페이지네이션 페이지 이벤트 함수
//	// 반드시 on 함수 사용해야만 한다. - JS에 의해서 새로 생긴 태그에는 이벤트가 주어지지 않는다.
//	$("#footer_pagination").on("click", "li a", function(e){
//		// a 태그 페이지 이동 무시
//		e.preventDefault();
//		// alert("댓글 페이지 이동 클릭");
//
//		// 이동하려는 페이지 정보 가져오기
//		var targetPageNum = $(this).attr("href");
//		console.log("targetPageNum : " + targetPageNum);
//		// 전역 변수인 pageNum에 넣으면 다른 함수에서도 사용이 가능하다.
//		pageNum = targetPageNum;
//
//		showList(pageNum);
//	});
		
});