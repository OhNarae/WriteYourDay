
$(document).ready(function() {
/*	var monthInfo = new Date($('#monthTitle').text()+'.01');	*/

	$('#cal-div').hide();
	$('input[name=ck-cal1]').on('click', function() {
		if ($('input[name=ck-cal1]').is(":checked")) {
			/*$('#cal-body').append('<tr><td class="cal-row">이마트</td><td class="cal-row">2000</td></tr>');*/
			$('#cal-div').show();
			cashbookList();			
		} else {
			$('#cal-div').hide();
		}
	})
	
/*	$.ajax({
		type: 'Get',
		url: '/WriteYourDay/month/event/list.do',
		data:{
			start_date : $('#monthTitle').text()+'.01'
		},
		success: function(out){
			setMonth(monthInfo.getFullYear(), monthInfo.getMonth(), out.result);	
        }	
	})*/
	eventList();
	eventShareList();
})

function eventList(){
	var monthInfo = new Date($('#monthTitle').text()+'.01');	
	
	$.ajax({
		type: 'Get',
		url: '/WriteYourDay/month/event/list.do',
		data:{
			start_date : $('#monthTitle').text()+'.01'
		},
		success: function(out){
			setMonth(monthInfo.getFullYear(), monthInfo.getMonth(), out.result);	
        }	
	})
} 

function eventShareList(){
	$.ajax({
		type: 'Get',
		url: '/WriteYourDay/event/share/list.do',
		success: function(out){
			var divs='';
            $.each(out.result, function(i, item){
            	divs += '<span class="msg fleft">&nbsp;&nbsp;&nbsp;&nbsp;' + item.event_title + ' </span><br>'
            	divs += '<a class="abutton fright" href="javascript:updateEventShare(\'reject\','+item.member_seq+','+item.event_seq+')">거절</a>'
            	divs += '<a class="abutton fright" href="javascript:updateEventShare(\'ok\','+item.member_seq+','+item.event_seq+')">수락</a><br>' 
            });
            $('#eventShareList').html(divs)
        }	
	})
}

function updateEventShare(type, m_seq, e_seq){
	$.ajax({
		type: 'Get',
		url: '/WriteYourDay/event/share/'+type+'.do',
		data:{
			member_seq: m_seq,
			event_seq: e_seq
		},
		success: function(){
			eventList();
			eventShareList();
		}
	})
}

function cashbookList(){
	var monthInfo = new Date($('#monthTitle').text()+'.01');
	var lastDate = new Date(monthInfo.getFullYear(), monthInfo.getMonth() + 1, 0);

	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/cashbook/list.do',
        data: {
        	start_date: $('#monthTitle').text() +'.01',
        	end_date: $('#monthTitle').text() + '.' + lastDate.getDate()
        },
		success: function(out){
			var totalCal = 0;
			$('#cal-body').html('');
            $.each(out.result, function(i, item){
            	//<tr><td class="cal-row">이마트</td><td class="cal-row">2000</td></tr>
            	var tr = '<tr>';
            	tr += '<td class="cal-row">' + item.pay_place + '</td>'
            	tr += '<td class="cal-row">' + item.price + '</td></tr>';
            	$('#cal-body').append(tr);
            	
            	totalCal += item.price;
            })
            
            $('#totalCal').text(totalCal);
         }	
	})
}

function setMonth(year, month, events){
	
	var firstDate = new Date(year, month, 1);  
	var lastDate = new Date(year, month + 1, 0);
	
	//events 준비
	var dayEventsLimit = 4;//하루에 이벤트 몇개를 보여줄지 
	var dayEventsStrLens = 6; //하루에 보여줄 수 있는 이벤트 제목의 글자 갯수
	var dayEvents = new Array(lastDate.getDate());
	for(var i = 0 ; i < dayEvents.length ; i++) 
		dayEvents[i] = new Array(dayEventsLimit);

	if(events != null){		
		for(var e = 0 ; e < events.length ; e++){
			var start_date = new Date(events[e].start_date);
			var end_date = new Date(events[e].end_date);
			
			var start = start_date.getDate() - 1;
			if(start_date.getTime() < firstDate.getTime())
				start = 0;
			
			var term = end_date.getDate() - start;
		    if(0==end_date.getHours() && 0==end_date.getMinutes()) --term;//event의 종료날짜가 00시00분일경우
			
		    var place = -1;
		    for(var i = 0; i < term ; i++){	    	
		    	var day = i + start;
		    	for(var j = 0 ; j < dayEventsLimit ; j++){
		    		if(j < place || dayEvents[day][j]) continue;
		    		else{
		    			dayEvents[day][j] = [events[e].color, events[e].title.substring(i*dayEventsStrLens, (i+1)*dayEventsStrLens)]
		    			place = j;
		    			break;
		    		}
		    	}	
		    	if(place == -1) break;
		    }
		}
	}	
	
	var start = firstDate.getDay(); 
	var dates = 0;
	
	$('#month-body').html('')
	for (var i = 0; i < 5; i++) {
		$('#month-body').append('<tr>')
		for (var j = 0; j < 7; j++) {
			var td = '<td class="month-row">';

			if (start == j) {
				start = -1;
				dates = 1;
			}

			if (dates > 0 && dates <= lastDate.getDate()){
				td += '<a href="/WriteYourDay/myday.do?date='+year+'.'+(month+1)+'.'+dates+'">' + dates + '</a><br>';
				for(var k = 0 ; k < dayEventsLimit ; k++){
					if(dayEvents[dates-1][k]){
						td += '<div style="background-color: ' + dayEvents[dates-1][k][0] + ';margin-bottom:1px"><strong><FONT face="Arial Black">' + (dayEvents[dates-1][k][1].length==0?'&nbsp;':dayEvents[dates-1][k][1]) + '</FONT><strong></div>';
					}
					else
						td += '<br>';
				}	
				dates++;
			}
			td += '</td>';
			$('#month-body').append(td);
		}
		$('#month-body').append('</tr>')		
	}
}

