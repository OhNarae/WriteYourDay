

var backgroundColor = ['#E18060','#FFA556','#FFE05C','#DDFFAA','#C6D6F7'];
$(document).ready(function(){	
	$('#e_end_date').val('클릭 시 종료시간 입력가능!');
	$('#e_use_end_date').on('click', function() {
		if ($('#e_use_end_date').is(':checked')) {
			$('#e_end_date').attr('readonly',false);
			$('#e_end_date').val(addDay(new Date($('#e_start_date').val())));
		} else {
			$('#e_end_date').attr('readonly',false);
			$('#e_end_date').val('클릭 시 종료시간 입력가능');
		}
	})
	
	var ecolor_html = '';
	for(var i = 0 ; i < backgroundColor.length; i++){
		ecolor_html += '<a style="padding: 0 0 5px 20px; margin-left: 5px; background-color: '+backgroundColor[i]+'" id="ecolor'+i+'" href="javascript:selectColor('+i+')"></a>';
	}
	$('#ecolor').html(ecolor_html)
	$('#ecolor'+color).css('border', '3px solid black');
	
	$("#insertEvent").click(insertEvent);
	eventlist();

	$('#insertCashBook').click(insertCashbook);
	cashbookList();
})

var color = 0;
function selectColor(num){
	$('#ecolor'+color).css('border', '');
	$('#ecolor'+num).css('border', '3px solid black');
	color = num;
}

function updateMemo(setSeq, seq, name){
		
	if($('#memoContents').val().length == 0){
		alert('메모에 내용이 없습니다.');
		return;
	}	
		
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/memo/update.do',
        data: {
        	set_seq: setSeq,
        	seq: seq,
        	name: name,
        	contents:  $('#memoContents').val()
        },
		success: alert('메모를 저장하였습니다.')
	})
}


function addDay(start_date){
	var param_end_date;
	var dayOfMonth = start_date.getDate();
	start_date.setDate(dayOfMonth + 1);
	
	var mzero = start_date.getMonth() > 8 ? '' : '0';
	var dzero = start_date.getDate() > 9 ? '' : '0';
	param_end_date = start_date.getFullYear() + '.' + mzero + (start_date.getMonth()+1)  + '.' + dzero + start_date.getDate() + ' 00:00';		

	return param_end_date;
}

function eventlist(){
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/event/list.do',
        data: {
        	start_date: $('#dayTitle').text()
        },
		success: function(out){
			$('#eventT-body').html('');
            $.each(out.result, function(i, item){
            	var tr = '<tr style="background-color:'+item.color+'"><td>';
            	tr += item.title + '</td><td>' + item.start_date.substring(0,16) + '&nbsp;&nbsp;-&nbsp;&nbsp;' + item.end_date.substring(0,16);
            	tr += '</td><td><a class="fright" href="javascript:deleteEvent('+item.event_seq+')">삭제</a></td></tr>';
				$('#eventT-body').append(tr);
            })
         }	
	})
}

function deleteEvent(event_seq){
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/event/delete.do',
        data: {
        	event_seq: event_seq
        },
		success: function(){
			alert('이벤트를 삭제 하였습니다.')
			eventlist()
		}
	})
}

function insertEvent(){
	
	if($('#e_title').val().length == 0){
		alert('title을 입력해주세요.'); return;
	}
	
	var start_date = new Date($('#e_start_date').val());
	if(isNaN(start_date)){
		alert('시작 날짜가 잘못되었습니다.'); return;
	}
		
	var param_end_date;
	if($('#e_use_end_date').is(":checked")){	
		end_date = new Date($('#e_end_date').val());
		if(isNaN(end_date)){
			alert('종료 날짜가 잘못되었습니다.'); return;
		}else if(start_date >= end_date){
			alert('시작날짜가 종료날짜보다 같거나 늦습니다.'); return;
		}
		
		param_end_date = $('#e_end_date').val();
	}else{
		param_end_date = addDay(start_date)
	}
	
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/event/insert.do',
        data: {
        	title: $('#e_title').val(),
        	start_date: $('#e_start_date').val(),
        	end_date:  param_end_date,
        	color: backgroundColor[color]
        },
		success: function(){
			alert('이벤트를 저장하였습니다.')
			eventlist()
		}
	})
}

function cashbookList(){
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/cashbook/list.do',
        data: {
        	start_date: $('#dayTitle').text()
        },
		success: function(out){
			$('#cashbookT-body').html('');
            $.each(out.result, function(i, item){
            	var tr = '<tr>';
            	tr += '<td>' + item.pay_date.substring(0,19) + '</td>'
            	tr += '<td>' + item.pay_place + '</td>';
            	tr += '<td>' + item.pay_things + '</td>';
            	tr += '<td>' + item.price + '<a class="fright" href="javascript:deletePayment('+item.seq+')">삭제</a></td></tr>';
				$('#cashbookT-body').append(tr);
            })
         }	
	})
}

function deleteCashbook(seq){
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/cashbook/delete.do',
        data: {
        	seq: seq
        },
		success: function(){
			alert('구매내역을 삭제 하였습니다.')
			cashbookList()
		}
	})
}

function insertCashbook(){
	var pay_date = new Date($('#pay_date').val());
	if(isNaN(pay_date)){
		alert('구매 날짜가 잘못되었습니다.'); return;
	}
	
	if($('#pay_place').val().length == 0){
		alert('장소을 선택해주세요.'); return;
	}
	
	if($('#pay_things').val().length == 0){
		alert('품목을 선택해주세요.'); return;
	}
	
	var price = $('#price').val();
	if(price.length == 0){
		alert('가격을 입력해주세요.'); return;
	}else if(!/^[0-9,]+$/.test(price)){
		alert('가격은 숫자와 ,만 입력해주세요.'); return;
	}
	price = price.replace(/[^0-9]/g,'');
	
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/cashbook/insert.do',
        data: {
        	pay_date: $('#pay_date').val(),
			pay_place: $('#pay_place').val(),
			pay_things: $('#pay_things').val(),
			price: price
        },
		success: function(){
			alert('구매내역이 저장되었습니다.')
			cashbookList()
		}
	})
	
}



