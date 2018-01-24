

$(document).ready(function(){
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

