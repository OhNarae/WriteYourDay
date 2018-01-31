

var backgroundColor = ['#E18060','#FFA556','#FFE05C','#DDFFAA','#C6D6F7'];
$(document).ready(function(){	
	$('#e_end_date').val('클릭 시 종료시간 입력가능!');
	$('#e_use_end_date').on('click', function() {
		if ($('#e_use_end_date').is(':checked')) {
			$('#e_end_date').attr('readonly',false);
			$('#e_end_date').val($('#e_start_date').val());
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
            	var tr = '<tr><td>';
            	tr += item.title + ' ' + item.start_date + ' ' + item.end_date + ' ' + item.color;
            	tr += '</td></tr>';
				$('#eventT-body').append(tr);
            })
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
		
	if($('#e_use_end_date').is(":checked")){	
		end_date = new Date($('#e_end_date').val());
		if(isNaN(end_date)){
			alert('종료 날짜가 잘못되었습니다.'); return;
		}else if(start_date >= end_date){
			alert('시작날짜가 종료날짜보다 같거나 늦습니다.'); return;
		}
	}
	
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/event/insert.do',
        data: {
        	title: $('#e_title').val(),
        	start_date: $('#e_start_date').val(),
        	end_date:  $('#e_use_end_date').is(":checked") ? 
        			$('#e_end_date').val() 
        			: (start_date.getFullYear() + '-' + ( (start_date.getMonth()+2)%13==0 ? '1' : (start_date.getMonth()+2)%13)  + '-' + start_date.getDate())
        	color: backgroundColor[color]
        },
		success: alert('이벤트를 저장하였습니다.')
	})
}

