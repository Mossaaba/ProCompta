			
							
		$(function() {
			
			$("#InfoAutomatique").hide();
			$("#testConexion").hide();
			$("#ClearFileDive").hide();
			$("#startProsessingDive").hide();

			$("#AutoUpload").on("change", function()

			{
				
                     //Manuel Uoplaod
                     if(!$(this).is(':checked'))
                	 {
                	 $("#cardUpload").toggle();
                	 $('#ManuelUpload').trigger('click');
                	 $('#ManuelUploadDive').css('visibility','visible');
                	 $("#InfoAutomatique").hide();
                	 $("#testConexion").hide();
                	 $("#startProsessingDive").hide();
                	 $("#typeProcessingFile").val('manuel');
                	 $("#nbrFileDive").show();
                	 
                	 
                	 }
                
                     else 
                     {
                    	//Automatique Uplaod 	 
                   	$("#cardUpload").toggle();
                   	$('#ManuelUpload').trigger('click');
                   	$('#ManuelUploadDive').css('visibility','hidden')
                   	$("#InfoAutomatique").show();
                    $("#testConexion").show();
                    $("#startProsessingDive").show();
                    $("#nbrFileDive").hide();
                    
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