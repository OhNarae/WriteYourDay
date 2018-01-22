

$(document).ready(function(){
	getlist();
	readythumbnail();	
	
	$("#iTalkBtn").click(function(){
      var form = $('#iTalkForm')[0];
        var formData = new FormData(form);
        if($("#getfile")[0].files.length > 0)
        	formData.append("contents_uploadfile", $("#getfile")[0].files[0]);
        
		$.ajax({
			type: 'Post',
			url: '/WriteYourDay/talk/insert.do',
			processData: false,
            contentType: false,
            data: formData,
			success: getlist
		})
	})
})

function getlist(){
	$.ajax({
		type: 'Post',
		url: '/WriteYourDay/talk/list.do',
		data:{
			member_seq: $('#member_seq').val()
		},
		success: function(out){
			$('#talk-body').html('');
            $.each(out.result, function(i, item){
            	var tr = '<tr><td>';
            	if(item.contents_uploadfile_path != null && item.contents_uploadfile_path.length > 0)
            		tr += '<img alt="사진" src="' + item.contents_uploadfile_path + '" ><br>';
            	if(item.contents_talk != null && item.contents_talk.length > 0)
            		tr += item.contents_talk + '<br>';
            	tr += '</td></tr>';
				$('#talk-body').append(tr);
            })
         }	
	})
}

function readythumbnail(){
	
	$('#thumbnail').hide();
	
	var file = document.querySelector('#getfile');
	file.onchange = function () { 		
		var fileList = file.files ;
    
	    // 읽기
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList [0]);

	    //로드 한 후
	    reader.onload = function  () {
	        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
	        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
	        tempImage.onload = function() {
	        	var MAX_WIDTH = 400;
	            var MAX_HEIGHT = 300;
	            var tempW = tempImage.width;
	            var tempH = tempImage.height;
	            if (tempW > tempH) {
	                if (tempW > MAX_WIDTH) {
	                   tempH *= MAX_WIDTH / tempW;
	                   tempW = MAX_WIDTH;
	                }
	            } else {
	                if (tempH > MAX_HEIGHT) {
	                   tempW *= MAX_HEIGHT / tempH;
	                   tempH = MAX_HEIGHT;
	                }
	            }
	        	
	            //리사이즈를 위해 캔버스 객체 생성
	            var canvas = document.createElement('canvas');
	            var canvasContext = canvas.getContext("2d");            
	            //캔버스 크기 설정
	            canvas.width = tempW; //가로 100px
	            canvas.height = tempH; //세로 100px            
	            //이미지를 캔버스에 그리기
	            canvasContext.drawImage(this, 0, 0, tempW, tempH);
	            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
	            var dataURI = canvas.toDataURL("image/jpeg");
	            //썸네일 이미지 보여주기
	            document.querySelector('#thumbnail').src = dataURI;
	            $('#thumbnail').show();
	        };
	    }; 
	}; 
}