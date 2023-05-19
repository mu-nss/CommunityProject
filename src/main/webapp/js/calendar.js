/**
 * calendar JS
 */

$(function(){
	var now = new Date();
	var startYear = now.getFullYear();
   	var yearRange = (startYear - 120) +":" + startYear ;
   	
   	$(".datepicker").datepicker({
	   changeMonth: true,
	   changeYear: true,
	   dateFormat: "yy-mm-dd",
	   dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
	   monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
  	});

	$(".datepicker" ).datepicker("option", {
		"maxDate" : new Date(),
	    "yearRange" : yearRange
	});
});