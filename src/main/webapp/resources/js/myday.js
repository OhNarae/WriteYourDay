
$(document).ready(function(){	
/*	$('#dayTitle').text('2018.01.25')*/
	$('#end_date').val('클릭 시 종료시간 입력가능');
	$('input[name=use_end_date]').on( 'click', function() {
		if ($('input[name=use_end_date]').is(':checked')) {
			$('#end_date').attr('readonly',false);
			$('#end_date').val($('#start_date').val());
		} else {
			$('#end_date').attr('readonly',false);
			$('#end_date').val('클릭 시 종료시간 입력가능');
		}
	})
})

