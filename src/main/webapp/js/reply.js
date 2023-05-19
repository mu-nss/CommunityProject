/**
 * 댓글 관련 JS
 */

var module = "/imagereply";

replyService = {
	// 댓글 리스트 처리
	list : function(param, callback, error){
		console.log("reply.js - reply list() ... ");
	 	var no = param.no;
	 	var page = param.page || 1; 
	
	 	$.getJSON(
	 		module + "/list.do?page=" + page + "&no=" + no ,
	 		function(data){ 
	 			if(callback){
	 				callback(data.pageObject, data.list);
	 			} else { // callback 함수가 없으면 처리되는 처리문
		 			if(data.list != null && data.list.length > 0) {
		 				alert("데이터가 있습니다.");
		 			} else {
		 				alert("데이터가 없습니다.");
		 			}
	 			}
	 		}
	 	// 데이터 가져오기 실패했을 때 처리되는 함수
	 	).fail(function(xhr, status, err){
	 		if(error) error();
	 	}); // getJSON()의 끝
	},
	
	// 댓글 쓰기 처리
	write : function(reply, callback, error){
	 	console.log("reply.js - write().reply : " + JSON.stringify(reply));
	 		
	 	$.ajax({
	 		type : "post", // 전달 방식
	 		url : module + "/write.do", // url
	 		data : JSON.stringify(reply), // 브라우저 -> 서버 전달 데이터
	 		contentType : "application/json; charset=utf-8", // 전달 데이터의 형식
	 		success : function(result, status, xhr){ // 서버 처리가 성공 후 브라우저에서 실행된 함수 
	 					if(callback) {
	 						callback(result);
	 					}
	 		},
	 		error : function(xhr, status, er) { // 서버 처리가 실패 후 브라우저에서 실행된 함수 
	 					if(error) {
	 						error(er);
	 					} else {
	 						console.log(xhr);
	 						console.log(status);
	 						console.log(er);
	 					}
	 		}
	 	});
	}, 
	
	// 댓글 수정 처리
	update : function(reply, callback, error){
		console.log("reply.js - update().reply : " + reply)
	 		
	 	$.ajax({
	 		type : "put", 
	 		url : module + "/update.do", 
	 		data : JSON.stringify(reply), 
	 		contentType : "application/json; charset=utf-8", 
	 		success : function(result, status, xhr){ 
	 			if(callback) callback(result);
	 		},
	 		error : function(xhr, status, er){ 
	 			if(error) error(er);
	 			else {
	 				console.log(xhr);
	 				console.log(status);
	 				console.log(er);
	 			}
	 		}
	 	});		
	},
	
	// 댓글 삭제 처리
	delete : function(rno, callback, error){
		$.ajax({
	 		type : "delete", 
	 		url : module + "/delete.do?rno=" + rno, 
	 		success : function(result, status, xhr){ 
	 			if(callback) callback(result);
	 		},
	 		error : function(xhr, status, er){
	 			if(error) error(er);
	 			else {
	 				console.log(xhr);
	 				console.log(status);
	 				console.log(er);
	 			}
	 		}
	 	});
 	} 
}
