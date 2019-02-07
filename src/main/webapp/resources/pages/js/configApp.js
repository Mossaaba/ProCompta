$("#rowUploadHostFile").hide();
$("#reccurentHostFileDive").hide();
$("#fixeTimeHostFileDive").hide();
$("#rowBtn").hide();
$("#rowUplaodJournalDiv").hide();


$("#fixedTimeParam").hide();
$("#reccurentTimeParam").hide();
$("#btnJouralParam").hide();





var elems = Array.prototype.slice.call(document.querySelectorAll('.switchery'));
// Success color: #10CFBD
elems.forEach(function(html) {
  var switchery = new Switchery(html, {color: '#6d5eac'});
});
 


$("#switchModifyParamHostFileUplaod").on("change", function(){
	 
	$("#rowUploadHostFile").toggle();
	$("#fixeTimeHostFileDive").toggle();
	$("#rowBtn").toggle();
	
	
	 
	
});


$("#switchModifyParamJournalFileUplaod").on("change", function(){
	 
	$("#rowUplaodJournalDiv").toggle();
	$("#btnJouralParam").toggle();
	
 
	
 
});






$('#TimeUploadHostFile').timepicker({
	'defaultTime' : false,
 
	'minuteStep' : 1,
	timeFormat : 'HH:mm:ss',
	showSecond : true,
	icons : {
		up : "fa fa-chevron-circle-up",
		down : "fa fa-chevron-circle-down",
		next : 'fa fa-chevron-circle-right',
		previous : 'fa fa-chevron-circle-left'
	}
});		

$('#fixeTimeJournalFile').timepicker({
	'defaultTime' : false,
 
	'minuteStep' : 1,
	timeFormat : 'HH:mm:ss',
	showSecond : true,
	icons : {
		up : "fa fa-chevron-circle-up",
		down : "fa fa-chevron-circle-down",
		next : 'fa fa-chevron-circle-right',
		previous : 'fa fa-chevron-circle-left'
	}
});	


$(document).ready(function(){
    $('#TimeUpload').timepicker({
        timeFormat: 'HH:mm:ss'
   
    
    });
});



  

$("#FixedTimeJounralFile") // select the radio by its id
.change(function(){ // bind a function to the change event
    if( $(this).is(":checked") ){ // check if the radio is checked
         
    	
    	 
		$("#RecurentJournalFile").prop('checked', false);
		$("#reccurentTimeParam").hide();
		$("#fixedTimeParam").toggle();
		$("#btnJouralParam").show();
	
    	
    }
});
$("#RecurentJournalFile") // select the radio by its id
.change(function(){ // bind a function to the change event
    if( $(this).is(":checked") ){ // check if the radio is checked
         
    	
    	 
		$("#FixedTimeJounralFile").prop('checked', false);
		$("#fixedTimeParam").hide();
		$("#reccurentTimeParam").toggle();
		$("#btnJouralParam").show();
    	
    	
    }
});

$("#journalFileParam").submit(
		function(e) {
	
			
			
			
			if($('#RecurentJournalFile').is(':checked')) { 
		var reccurentValue = $("#reccurentValue").val();
		if ((reccurentValue === '')) {
			
			$
			.confirm({
				title : 'Reccurent value is rong   !',
				content : 'Please inser a value . ',
				type : 'red',
				animation : 'left',
				icon : 'fa fa-exclamation-circle fa-spin',
				typeAnimated : true,
				buttons : {

					close : {
						text : 'Close',
						btnClass : 'btn-red',
						action : function() {

							$('#reccurentValue')
									.addClass(
											'b-danger b-dashed');
							 
						}

					}
				}
			});

	                  return false;
		}}  
	
if($('#FixedTimeJounralFile').is(':checked')) 
{ 
	
	var timeFixe = $("#fixeTimeJournalFile").val();
		
	if ((timeFixe === '')) {
		
		$
		.confirm({
			title : 'Fixe time is rong (HH:MM AM/PM)  !',
			content : 'Please insert a time . ',
			type : 'red',
			animation : 'left',
			icon : 'fa fa-exclamation-circle fa-spin',
			typeAnimated : true,
			buttons : {

				close : {
					text : 'Close',
					btnClass : 'btn-red',
					action : function() {

						$('#reccurentValue')
								.addClass(
										'b-danger b-dashed');
						 
					}

				}
			}
		});

                  return false;
	} }

		});
	

$("#hostFileParam").submit(
		function(e) 
		
		{  
		var TimeUploadHostFile = $("#TimeUploadHostFile").val();
		if ((TimeUploadHostFile === '')) {
			
			$
			.confirm({
				title : 'time value is rong   !',
				content : 'Please inser a value . ',
				type : 'red',
				animation : 'left',
				icon : 'fa fa-exclamation-circle fa-spin',
				typeAnimated : true,
				buttons : {

					close : {
						text : 'Close',
						btnClass : 'btn-red',
						action : function() {

							$('#reccurentValue')
									.addClass(
											'b-danger b-dashed');
							 
						}

					}
				}
			});

	                  return false;
		} });

  
 

