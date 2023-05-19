/**
 * utility JS
 */

function displayTime(timeValue) {
	var today = new Date(); // 오늘 날짜
	var gap = today.getTime() - timeValue; // 댓글 작성 시간과의 차이
	var dateObj = new Date(timeValue); // 작성한 날짜를 날짜 객체로 만들기
	var str = "";
	
	// 24시간 안 지난 경우
	if(gap < (24 * 60 * 60 * 1000)){
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		
		return [
			(hh > 9 ? '' : '0') + hh, ':',
			(mi > 9 ? '' : '0') + mi, ':',
			(ss > 9 ? '' : '0') + ss
		].join('');
	} else{ // 24시간 지난 경우
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		
		return[
			yy, '-',
			(mm > 9 ? '' : '0') + mm, '-',
			(dd > 9 ? '' : '0') + dd
		].join('');
	}
} // displayTime() 끝