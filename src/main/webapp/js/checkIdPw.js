/**
 * checkIdPw JS
 * 아이디, 비밀번호, 비밀번호 확인
 */

$(function(){
   	// id 중복 체크 변수, 비밀번호와 비밀번호 확인이 같은지 체크 변수
   	var idCheck = false;
   	var pwCheck = false;
	
	// 아이디 실시간 중복 체크
	$("#id").keyup(function(){
		idCheck = false;
		
		var id = $(this).val();
		
		var okIdCheckDiv = document.getElementById("idCheckDiv");
		var noIdCheckDiv = document.getElementById("idCheckDiv");
		
		// 4자 미만 20자 초과
		if(id.length < 4 || id.length > 20){
			noIdCheckDiv.style.color = "red";
			noIdCheckDiv.style.fontSize = "5px";
			$("#idCheckDiv").text("4~20자 이내의 영문과 숫자로만 입력해주세요.");
			return;
		}
		// 아이디 중복 체크(Ajax)
		$("#idCheckDiv").load("/member/idCheck?id=" + id, function(result){
			if(result.indexOf("가능한 ") == -1){
				// 중복된 아이디인 경우
				noIdCheckDiv.style.color = "red";
				noIdCheckDiv.style.fontSize = "5px";
				idCheck = false;
			} else{
				// 사용 가능한 아이디인 경우
				okIdCheckDiv.style.color = "green";
				okIdCheckDiv.style.fontSize = "5px";
				idCheck = true;
			}
		});
	});
	
	// 비밀번호 입력 처리 이벤트
	$("#pw").keyup(function(){
		pwCheck = false;

		var pw = $(this).val();
		
		var okPwCheckDiv = document.getElementById("pwCheckDiv");
		var noPwCheckDiv = document.getElementById("pwCheckDiv");
		
		if(pw.length < 4 || pw.length > 20){
			noPwCheckDiv.style.color = "red";
			noPwCheckDiv.style.fontSize = "5px";
			$("#pwCheckDiv").text("4~20자 이내로 입력해주세요.");
			return;
		} else {
			okPwCheckDiv.style.color = "green";
			okPwCheckDiv.style.fontSize = "5px";
			$("#pwCheckDiv").text("적당한 비밀번호입니다.");
			pwCheck = true;
		}
	});
	
	// 비밀번호 확인 처리 이벤트
	$("#repeatPw").keyup(function(){
		pwCheck = false;
		
		var pw = $("#pw").val();
		var repeatPw = $("#repeatPw").val();
		
		var okRePwCheckDiv = document.getElementById("repeatPwCheckDiv");
		var noRePwCheckDiv = document.getElementById("repeatPwCheckDiv");
		
		if(repeatPw.length < 4 || repeatPw.length > 20){
			noRePwCheckDiv.style.color = "red";
			noRePwCheckDiv.style.fontSize = "5px";
			$("#repeatPwCheckDiv").text("4~20자 이내로 입력해주세요.");
			return;
		}
	
		if(pw == repeatPw){
			noRePwCheckDiv.style.color = "green";
			noRePwCheckDiv.style.fontSize = "5px";
			$("#repeatPwCheckDiv").text("일치하는 비밀번호입니다.");
			pwCheck = true;
		} else {
			noRePwCheckDiv.style.color = "red";
			noRePwCheckDiv.style.fontSize = "5px";
			$("#repeatPwCheckDiv").text("불일치한 비밀번호입니다.");
			
			if(repeatPw.length < 4 || repeatPw.length > 20){
				noRePwCheckDiv.style.color = "red";
				noRePwCheckDiv.style.fontSize = "5px";
				$("#repeatPwCheckDiv").text("4~20자 이내로 입력해주세요.");
			} else {
				noRePwCheckDiv.style.color = "red";
				noRePwCheckDiv.style.fontSize = "5px";
				$("#repeatPwCheckDiv").text("불일치한 비밀번호입니다.");
			}
		}
	});
	
	// 회원가입 이벤트 처리
	$("#writeForm").submit(function(){
		// alert("아이디 체크 : " + idCheck + "\n비밀번호 체크 : " + pwCheck);
		
		// 아이디 중복 체크 - 사용 가능한 아이디인지 확인
		if(!idCheck){
			alert("중복된 아이디 또는 형식에 맞지 않는 아이디입니다.\n아이디를 다시 입력해주세요.");
			$("#id").focus();
			return false;
		}
		// 비밀번호와 비밀번호 확인 
		if(!pwCheck){
			alert("비밀번호를 다시 확인해주세요.");
			$("#repeatPw").focus();
			return false;
		}
		
		// return false; 나중에 지울 것
	});

});