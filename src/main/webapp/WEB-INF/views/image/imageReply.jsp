<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="card shadow mb-4">
	    <!-- 댓글 -->
		<div class="card-header py-3">
			<!-- 테이블 제목 -->
			<h6 class="font-weight-bold text-default  float-left" style="margin: 5px 0 0">
				<i class="fa fa-comments fa-fw"></i> Image View Reply
			</h6>
			<button id="addReplyBtn" class="btn btn-sm btn-primary float-right">New Reply</button>
		</div>
		<div class="card-body">
			<ul class="chat">
				<!-- ajax로 데이터를 가져가서 chat에 empty()를 이용해서 비운 다음 append로 추가 -->
			</ul>
			<!-- /.char -->
		</div>
		<!-- /.card-body -->
		
		<div class="card-footer" id="footer_pagination">
		</div>
		
		<!-- 댓글 등록 수정 삭제를 위한 모달 창 : 맨 처음에는 안 보임 -->
		<div id="myModal" class="modal fad" role="dialog">
			<div class="modal-dialog">
				<!-- 모달 내용 -->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Reply Modal</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
	     			 <div class="modal-body">
	     			 	<div class="form-group">
	     			 		<label>Reply</label>
							<textarea rows="3" name="reply" class="form-control" id="modalReply"></textarea>
	     			 	</div>
		     			<div class="form-group">
		     			 	<label>Replyer</label>
		     			 	<input name="replyer" class="form-control" id="modalReplyer">
		     			</div>
	     			 </div>
	     			 <div class="modal-footer">
	     			 	<button class="btn btn-warning" id="modalUpdateBtn">Update</button>
	     			 	<button class="btn btn-danger" id="modalDeleteBtn">Delete</button>
	     			 	<button class="btn btn-primary" id="modalWriteBtn">Register</button>
	     			 	<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
	     			 </div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- /.card shadow mb-4 -->