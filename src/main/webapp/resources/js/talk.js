
$(document).ready(function(){

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
	            //썸네일 이미지를 다운로드할 수 있도록 링크 설정
	            /*document.querySelector('#download').href = dataURI;*/
	            $('#thumbnail').show();
	        };
	    }; 
	}; 
})

