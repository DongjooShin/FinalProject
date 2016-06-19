

$(document).ready(function(){
	var i =0;
	
	$("form#main_input_box").submit(function(event){
		event.preventDefault();
		
		i++;
		var deleteButton = "<button class='delete btn btn-warning'>삭제</button>";
		var twoButtons = "<div class='btn-group pull-right'>" + deleteButton + "</div>";
	
		//"<div class = 'radiobox'><input type='radio' name='check'>1</input></div>"
		//var radiobox = "<div class='checkbox'><label><input type='checkbox' class='pull-right'></label></div>";
		//"<input type='radio'" +i +"asd"
		
		var radiobox ="<div class ='radiobox'><input type='radio' name='check"+i+"' value='5'>매우좋음</div><div class ='radiobox'><input type='radio' name='check"+i+"' value='4'>좋음</div><div class ='radiobox'><input type='radio' name='check"+i+"' value='3'>보통</div><div class ='radiobox'><input type='radio' name='check"+i+"' value='2'>나쁨</div><div class ='radiobox'><input type='radio' name='check"+i+"' value='1'>매우나쁨</div>";
		var hiddenbox = "<div class ='hidden'><input type='hidden' name='hidden' value='"+i+"'>매우좋음</div>";
		var context = $("#custom_textbox").val();
		
		var contextform = "<input type='hidden' name='su_context' value='"+context+"'>" + "<input type='hidden' name='number' value='"+i+"'>";
		
		
		$(".list_of_items").append("<div class='bb'>" +"<li class='list-group-item'>" + "<div class='text_holder'>" +i+ "."+ $("#custom_textbox").val()+ twoButtons + "</div>"+ radiobox +contextform+ "</div>"+"</li>");
		$("#custom_textbox").val('');
		
		
		
	});
	
	
	$(".list_of_items").on("click", "button.delete", function(){
		$(this).closest("li").remove();
	});


	
	$(".list_of_items").on("click", ":checkbox", function (){
		$(this).closest("li").toggleClass("completed_item");
	});
	
	
	
});


