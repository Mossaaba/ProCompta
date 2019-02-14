 

$('#TimeUpload').timepicker({
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
		
		
		
		
		
		$('#TimeUploadHost').timepicker({
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
		
		
		
		
		
		
		$("#FixedTimeRow").hide();
		$("#reccurentTimeRow").hide();

		$("#Recurent") // select the radio by its id
	    .change(function(){ // bind a function to the change event
	        if( $(this).is(":checked") ){ // check if the radio is checked
                 
	        	
	        	$("#reccurentTimeRow").show();
				$("#FixedTimeRow").hide();
				$("#FixedTime").prop('checked', false);
	        	
	        	
	        }
	    });
		$("#FixedTime") // select the radio by its id
	    .change(function(){ // bind a function to the change event
	        if( $(this).is(":checked") ){ // check if the radio is checked
                 
	        	
	        	$("#FixedTimeRow").show();
				$("#reccurentTimeRow").hide();
				$("#Recurent").prop('checked', false);
	        	
	        	
	        }
	    });
		
		$("#divUploadHostFile").hide();
		$("#divUploadJournal").hide();
		  
		
		
		
		
		
		
		$("#FixedTimeRowHost").hide();
		$("#reccurentTimeRowHost").hide();
		
		
		
		
		
		$("#RecurentHostFile") // select the radio by its id
	    .change(function(){ // bind a function to the change event
	        if( $(this).is(":checked") ){ // check if the radio is checked
                 
	        	
	        	$("#reccurentTimeRowHost").show();
				$("#FixedTimeRowHost").hide();
				$("#FixedTimeHostFile").prop('checked', false);
	        	
	        	
	        }
	    });
		$("#FixedTimeHostFile") // select the radio by its id
	    .change(function(){ // bind a function to the change event
	        if( $(this).is(":checked") ){ // check if the radio is checked
                 
	        	
	        	$("#FixedTimeRowHost").show();
				$("#reccurentTimeRowHost").hide();
				$("#RecurentHostFile").prop('checked', false);
	        	
	        	
	        }
	    });
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		$("#journalFileBtnConfig").click(function() {
			
			$("#divUploadJournal").toggle({effect: 'slide', duration: 100});
			$("#divUploadHostFile").hide();
		});
		
      $("#HostFileBtnConfig").click(function() {
			
    	  
    	    $("#divUploadJournal").hide();
			$("#divUploadHostFile").toggle({effect: 'slide', duration: 100});
		});
		    
		 
							
		$(function() {
			
			$("#InfoAutomatique").hide();
			 
			$("#ClearFileDive").hide();
			$("#startProsessingDive").hide();
			$("#cardUploadAuto").hide();
			

			$("#AutoUpload").on("change", function()

			{
				
                     //Manuel Uoplaod
                     if(!$(this).is(':checked'))
                	 {
                    	 
                	 $("#cardUpload").toggle();
                	 $('#ManuelUpload').trigger('click');
                	 $('#ManuelUploadDive').css('visibility','visible');
                	 $("#InfoAutomatique").hide(); 
                	 $("#startProsessingDive").hide();
                	 $("#typeProcessingFile").val('manuel');
                	 $("#nbrFileDive").show();
                	 $("#cardUploadAuto").hide();
                	 $("#branchDiv").show();
                     $("#atmDiv").show();
                     $("#typeFileDiv").show();
                	 
                	 
                	 }
                
                     else 
                     {
                    	//Automatique Uplaod 	 
                   	$("#cardUpload").toggle();
                   	$('#ManuelUpload').trigger('click');
                   	$('#ManuelUploadDive').css('visibility','hidden')
                   	$("#InfoAutomatique").show();
                    $("#startProsessingDive").show();
                    $("#nbrFileDive").hide();  
                    $("#branchDiv").hide();
                    $("#atmDiv").hide();
                    $("#typeFileDiv").hide();
                    $("#operationDive").hide();
                    $("#cardUploadAuto").show({effect: 'fade', duration: 250});
                    $("#typeProcessingFile").val('automatique');

                     }
                     
                     
                     var type = $("#typeProcessingFile").val();
                     
                     if (type === 'automatique') {
                    	 
                    	 $("#sbmtbtn").click(function() {

                    		 var idAtm = $("#atm").val();
                    		 var TyepFile = $("#typeFile").val();
                                     
                    		 
                                         $.ajax({
                                             url : 'uploadAuto-'+ idAtm +'-'+TyepFile,
                                             method : 'GET',
                                             contentType: "application/json",
                                             timeout: 600000,
                                             success : function(data) {
                                            	 $('#modalSlideUp').modal('show');
                                            	 
                                                 if (data.status == 200) 
                                                 {
                                                	 $('#modalSlideUp').modal('show');	 
                                                 } 
                                             },

                                             error : function(xhr, status, error) {
                                                 
                                             }
                                         });

                    	 }); 
                     }
                     
                      
                     

			});
			$('#load').select2({
				
				dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
				allowClear : true,
				placeholder : {
			 
					id : "-1",
					text : "  Please select Type of uploading file ",
					selected : 'selected',

				},
				
					data : [ {
						id : -1,
						text : '',
						selected : 'selected',
						search : '',
						hidden : true
					} , 
					 
				]
			});
			
			
			
			$('#atm').select2({});
			$('#typeFile').select2({
				
				dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
				allowClear : true,
				placeholder : {
					id : "-1",
					text : "Please select Type File ",
					selected : 'selected',

				},
				
					data : [ {
						id : -1,
						text : '',
						selected : 'selected',
						search : '',
						hidden : true
					} , 
					{
					id : 1,
					text : 'Journal File',
					search : '',
					hidden : true
				   } , 
				   {
					id : 2,
					text : 'Log File ',
					search : '',
					hidden : true
	      	        } 

				]
			}
			
			);
			
			
			$("#load").on('change', function(e) {  
				
				$("#divTimer").show();
				
				
			});
			
			$("#atm").prop("disabled", true);

			

			$("#branch")
					.select2(
							{
								dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
								allowClear : true,
								placeholder : {
									id : "-1",
									text : "Please select a branch",
									selected : 'selected',

								},
								data : [ {
									id : -1,
									text : '',
									selected : 'selected',
									search : '',
									hidden : true
								} ]
							});

			$("#branch").on('change', function(e) {  

				$("#atm").prop("disabled", false);
				var id = $("#branch").val();

				$('#atm').select2({
					allowClear : true,
					 
					minimumInputLength : 1,
					ajax : {
						url : 'http://localhost:8080/ProCompta/api/atm-' + id,
						dataType : 'json',

						data : function(params) {
							return {
								ad : params.term
							};
						},
						
						
						processResults : function(data) {
							return {
								results : $.map(data, function(obj) {
									return {
										id : obj.idAtm,
										text : obj.nameAtm, 
										
									};
								})
							};
						}
					}
				
				
						  
						 
				});
			});
			
			
			
			$("#typeFile").on('change', function(e) {  

				var id = $("#typeFile").val();
				
				if(id == 2)
					{

					$("#branchDiv").hide();
					$("#atmDiv").hide();
					$("#typeFileDiv").removeClass( "col-md-4" );
					$("#typeFileDiv").addClass( "col-md-12" );

					
					}
				else 
				    {
					
					$("#branchDiv").show();
					$("#atmDiv").show();
					$("#typeFileDiv").removeClass( "col-md-12" );
					$("#typeFileDiv").addClass( "col-md-4" );
					
				    }
			});
			
			var elems = Array.prototype.slice.call(document
					.querySelectorAll('#AutoUpload'));

			elems.forEach(function(html) {
				var switchery = new Switchery(html, {

					size : 'large',
					color : '#6D5CAE',
					 
				     

				});
			});

			var elemX = Array.prototype.slice.call(document
					.querySelectorAll('#ManuelUpload'));

			elemX.forEach(function(html) {
				var switchery = new Switchery(html, {

					size : 'large',
					color : '#6D5CAE',
				});
			});
			
			$('#myCard').card({
				onRefresh : function() {
					// Timeout to simulate AJAX response delay
					setTimeout(function() {
						$('#myCard').card({
							refresh : false
						});
					}, 2000);
				}
			});
			
			$('#myCardX').card({
				onRefresh : function() {
					 
					setTimeout(function() {
						$('#myCardX').card({
							refresh : false
						});
					}, 2000);
				}
			});

			
			
 
			
			
		});