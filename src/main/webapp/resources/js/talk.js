

$(document).ready(function(){
	fList();
	$("#sMemberBtn").click(function(){
		$.ajax({
			type: 'Post',
			url: '/WriteYourDay/member/search.do',
			data:{
				id: $('#searchId').val()
			},
			success: function(out){
				$('#menuL-body').html('');
				var tr = '<tr><td>검색결과<br>';
	            $.each(out.result, function(i, item){
	            	tr += '<li><a href="talkbody.do?seq=' + item.seq + '" target="talkbody">' + item.id + '</a></li>';
	            })
	            tr += '</td></tr>';
	            $('#menuL-body').append(tr);
	         }	
		})	
	})
})

function fList(){
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/friends/list.do',
		success: function(out){
			$('#menuL-fbody').html('');
			var tr = '<tr><td>';
            $.each(out.result, function(i, item){
            	tr += '<li><a href="talkbody.do?seq=' + item.seq + '" target="talkbody">'+item.id+'</a></li>';
            })
            tr += '</td></tr>';
            $('#menuL-fbody').append(tr);
         }	
	})	
}

