
$(document).ready(function(){
	getMSetList()
	$('#tbContent').hide()
	
	$('#addMemoC').click(function(){
	    layer_popup('insert');
	    addMemoSet();
	});
	
    $('#popBtnClose').click(function(){
        $('.dim-layer').fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });
})

function getMSetList(){
	$.ajax({
		type: 'Get',
		url: '/WriteYourDay/memoset/list.do',
		success: function(out){
			$('#memoL-body').html('');
            $.each(out.result, function(i, item){
            	var tr = '<tr><td class="memo-row">';
            	tr += '<a href="javascript:getMemoList(\'' + item.name + '\',' + item.seq + ')">'+ item.name +'</a>';
            	tr += '<a class="fright" href="javascript:deleteMemoSet(' + item.seq + ')">삭제</a>';
            	tr += '<a class="fright indent-right3" href="javascript:updateMemoSet(' + item.seq + ')">수정</a>';
            	tr += '</td></tr>';
				$('#memoL-body').append(tr);
            })
         },	
         error: function(){
        	 alert('메모 카테고리를 가져오지 못했습니다.')
         }
	})
}

function getMemoList(name, setSeq){

	$('#sMSetTitle').text(name)
	$('#tbContent').hide()	
	$('#addMemoT').unbind("click").bind("click",function(){
	    layer_popup('insert');
	    addMemo(name, setSeq)
	});
	
 	$.ajax({
		type: 'GET',
		url: '/WriteYourDay/memo/list.do',
		data: {seq: setSeq},		
		success: function(out){
			$('#memoT-body').html('')
            $.each(out.result, function(i, item){
            	var tr = '<tr><td class="memo-row">';
            	tr += '<a href="javascript:getMemo(\''+ item.name+'\',' + item.set_seq + ',' + item.seq + ')">'+ item.name +'</a>'
            	tr += '<a class="fright" href="javascript:deleteMemo(\''+ name +'\',' + item.set_seq + ',' + item.seq + ')">삭제</a>&nbsp;&nbsp;'
        		tr += '<a class="fright indent-right3" href="javascript:updateMemo(\''+ name +'\',' + item.set_seq + ',' + item.seq + ')">수정</a>&nbsp;&nbsp;';
                tr += '</td></tr>'
        		$('#memoT-body').append(tr);
            })
         },
		 error: function(){
			 alert('메모 목록을 가져오지 못했습니다.')
		 }
	}) 
}

function getMemo(title, setSeq, seq){
	
	$('#sMemoTitle').text(title)
 	$.ajax({
		type: 'GET',
		url: '/WriteYourDay/memo/get.do',
		data: {
			set_seq: setSeq,
			seq: seq
		},		
		success: function(out){
			if(out.result.contents != null)
				$('#memoContents').val(out.result.contents);
			else
				$('#memoContents').val('내용을 입력해주세요');
        }	
	}) 
	
	readyUpdateContents(setSeq, seq)
}

function addMemoSet(){
	 $('#popBtn').unbind("click").bind("click", function(){
		$('.dim-layer').fadeOut();// 닫기 버튼을 클릭하면 레이어가 닫힌다.
	 	$.ajax({
			type: 'POST',
			url: '/WriteYourDay/memoset/insert.do',
			data: {
					name: $('#popName').val()
			},		
			success: function(out){
					getMSetList();
	        }
		});
	});
}

function addMemo(name, setSeq){	
   $('#popBtn').unbind("click").bind("click", function(){
		$('.dim-layer').fadeOut();// 닫기 버튼을 클릭하면 레이어가 닫힌다.
	 	$.ajax({
			type: 'POST',
			url: '/WriteYourDay/memo/insert.do',
			data: {
					name: $('#popName').val(),
					set_seq: setSeq
			},		
			success: function(out){
				getMemoList(name, setSeq);
				readyUpdateContents(setSeq, out.result.seq)
	        }
		});
	});
}

function updateMemoSet(setSeq){
	layer_popup('update');
	 $('#popBtn').unbind("click").bind("click", function(){
			$('.dim-layer').fadeOut();// 닫기 버튼을 클릭하면 레이어가 닫힌다.
		 	$.ajax({
				type: 'POST',
				url: '/WriteYourDay/memoset/update.do',
				data: {
						seq: setSeq,
						name: $('#popName').val()
				},		
				success: function(out){
					getMSetList();
		        },
				 error: function(){
					 alert('업데이트에 실패하였습니다.')
				 }
			});
		});
}

function deleteMemoSet(setSeq){
 	$.ajax({
		type: 'POST',
		url: '/WriteYourDay/memoset/delete.do',
		data: {
				seq: setSeq,
		},		
		success: function(out){
			$('#sMSetTitle').text('')
			$('#memoT-body').html('')
			getMSetList();
        },
		 error: function(){
			 alert('삭제에 실패하였습니다.')
		 }
	});
}


function updateMemo(name, setSeq, seq){	
	layer_popup('update');
	 $('#popBtn').unbind("click").bind("click", function(){
			$('.dim-layer').fadeOut();// 닫기 버튼을 클릭하면 레이어가 닫힌다.
		 	$.ajax({
				type: 'POST',
				url: '/WriteYourDay/memo/update.do',
				data: {
						set_seq: setSeq,
						seq: seq,
						name: $('#popName').val()
				},		
				success: function(out){
					getMemoList(name, setSeq);
		        }
			});
		});
}

function deleteMemo(name, setSeq, seq){
 	$.ajax({
		type: 'POST',
		url: '/WriteYourDay/memo/delete.do',
		data: {
			set_seq: setSeq,
			seq: seq,
		},		
		success: function(out){
			getMemoList(name, setSeq);
        },
		 error: function(){
			 alert('삭제에 실패하였습니다.')
		 }
	});
}

function readyUpdateContents(setSeq, seq){
	 $('#tbContent').show()	
	 $('#updateMemo').unbind("click").bind("click", function(){
		 	$.ajax({
				type: 'POST',
				url: '/WriteYourDay/memo/update.do',
				data: {
						set_seq: setSeq,
						seq: seq,
						contents: $('#memoContents').val()
				},		
				success: function(out){
					alert('수정완료');
		        }
			});
		});
}

function layer_popup(action){ //#layer
    $('.dim-layer').fadeIn();

    var $elWidth = ~~($('#layer').outerWidth()),
        $elHeight = ~~($('#layer').outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
    	$('#layer').css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
    	$('#layer').css({top: 0, left: 0});
    }

    switch(action){
    case 'insert':
    	$('#layer').find('a.btn-layer').text('추가')
    	break;
    case 'update':
    	$('#layer').find('a.btn-layer').text('수정')
    	break;
    }
}