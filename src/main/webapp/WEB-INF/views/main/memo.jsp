<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>MyPage</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/grid.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/popup.css" type="text/css"
	media="screen">
<script src="resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	getMSetList()
	
/* 	$('#addMemoF').click(function(){
	    var $href = $(this).attr('href');
	    layer_popup($href);
	}); */
	
	$('#addMemoC').click(function(){
	    var $href = $(this).attr('href');
	    layer_popup('add_memo_set');
	});
	
	$('#addMemoT').click(function(){
	    var $href = $(this).attr('href');
	    layer_popup('add_memo_title');
	});
})

function getMSetList(){
	$.ajax({
		type: 'Get',
		url: '/WriteYourDay/memoset/list.do',
		success: function(out){
            $.each(out.mList, function(i, item){
            	var tr = '<tr><td class="memo-row">'
            	tr += '<div id="mset' + item.seq + '">'
            	tr += '<a href="javascript:getMemoList(' + item.seq + ')">'+ item.name +'</a>'
            	tr += '<a class="fright" href="javascript:readyMSet(' + item.seq + ')">수정</a>'
            	tr += '</div>'
               	tr += '<div id="msetForU' + item.seq + '" style="display: none">'
               	tr += '<input id="msetName' + item.seq + '" value="' + item.name + '">'
               	tr += '<a class="fright" href="javascript:updateMSet(' + item.seq + ')">완료</a>'
               	tr += '</div>'
            	tr += '</td></tr>'
				$('#memoL-body').append(tr)
            })
         }	
	})
}



function getMemoList(setSeq){
 	$.ajax({
		type: 'GET',
		url: '/WriteYourDay/memo/list.do',
		data: {seq: setSeq},		
		success: function(out){
            $.each(out.mList, function(i, item){
        		$('#memoT-body').append('<tr>')
        		$('#memoT-body').append('<td class="memo-row"><a href="">'+ item.name +'</a></td>');	
        		$('#memoT-body').append('</tr>')
            })
         }	
	}) 
}

function readyMSet(setSeq){
	$('#mset'+setSeq).css("display","none"); 
	$('#msetForU'+setSeq).css("display",""); 
}

function updateMSet(setSeq){
	
}



function layer_popup(btype){ //#layer
	
    var $el = $(el);        //레이어의 id를 $el 변수에 저장
   /*  var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수 */

    $('.dim-layer').fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        $('.dim-layer').fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });
    
    switch(btype){
    case 'add_memo_set':
    	$el.find('a.btn-layer').text('추가')
    	$el.find('a.btn-layer').click(function(){
	        $('.dim-layer').fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	        return false;
    	});
    	break;
    case 'add_memo_title':
    	$el.find('a.btn-layer').text('추가')
    	$el.find('a.btn-layer').click(function(){
        	$('.dim-layer').fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        	return false;
    	});
    	break;
    }

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}

</script>
<style type="text/css">

/* 월별 스케쥴 테이블 스타일 */
.memo-tb {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
}

.memo-tb td {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	height: 10px
}

.memo-tb th {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	background-color: #ff9601;
}

.memo-tb .memo-row {
	vertical-align: top
}

textarea {
	float: left;
	height: 192px;
	overflow: auto;
	width: 95%;
	font-size: 13px;
	line-height: 1.23em;
	color: #404040;
	padding: 6px 10px;
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
	border: 1px solid #d9d9d9;
	background: #fcfcfc;
	outline: none
}
</style>
</head>
<body>
	<div class="indent-top"></div>
	<div class="main">
		<div class="container_12">
			<div class="grid_3">
				<div class="dim-layer">
					<div class="dimBg"></div>
					<div id="layer" class="pop-layer">
						<a href="#" class="btn-layerClose"><img
							src="resources/images/close.png" alt="이전 이벤트 보기" /></a>
						<div class="pop-container">
							<div class="pop-conts">
								<div class="btn-r">
									<input id="popName" type=text> <a href="#"
										class="btn-layer" id="popBtn"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<table class="memo-tb">
					<tr>
						<th class="memo-row alignleft">메모 카테고리 <a href="#layer"
							class="fright color-3" id="addMemoC">+</a>
						</th>
					</tr>
					<tbody id="memoL-body"></tbody>
				</table>
			</div>
			<div class="grid_3">
				<table class="memo-tb" style="width: 100%;">
					<tr>
						<th class="memo-row alignleft">메모 제목 <a href="#layer"
							class="fright color-3" id="addMemoT">+</a></th>
					</tr>
					<tbody id="memoT-body"></tbody>
				</table>
			</div>
			<div class="grid_6">
				<table class="memo-tb" style="width: 100%;">
					<tr>
						<th class="memo-row alignleft">메모 내용</th>
					</tr>
					<tbody id="memo-body">
						<tr>
							<td><textarea id="memoContents"></textarea><br> <a
								class="fright" id="updateMemo">수정</a> <a
								class="fright indent-right2" id="deleteMemo">삭제</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>