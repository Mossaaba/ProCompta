         //---------------------------------------------------------------------------------------------------------------------------------------------------//
		//---------------------------------------------------------------------------------------------------------------------------------------------------//
		// ---------------------------------------------------------------- Start DropZone --------------------------------------------------------------------//
		//---------------------------------------------------------------------------------------------------------------------------------------------------//
		//---------------------------------------------------------------------------------------------------------------------------------------------------//


Dropzone.autoDiscover = false;
		Dropzone.options.mydropzone = false;
		$(document)
				.ready(
						function() {

							myDropzone = new Dropzone(
									'#mydropzone',

									{

										url : "upload?${_csrf.parameterName}=${_csrf.token}",

										maxFiles : null,

										uploadMultiple : true,

										parallelUploads : 100,

										maxFilesize : 256, // MB

										timeout : 60000,

										autoProcessQueue : false,

										addRemoveLinks : true,

										acceptedFiles : '.jrn,.log',

										ignoreHiddenFiles : true,

										dictDefaultMessage : "Please drop journal or  log file here to be uploaded",
										dictFallbackMessage : "Your browser does not support drag'n'drop file uploads.",
										dictFallbackText : "Please use the fallback form below to upload your files like in the olden days.",
										dictFileTooBig : "File is too big ({{filesize}}MiB). Max filesize: {{maxFilesize}}MiB.",
										dictInvalidFileType : "You can't upload files of this type.",
										dictResponseError : "Server responded with {{statusCode}} code.",
										dictCancelUpload : "Cancel upload",
										dictCancelUploadConfirmation : "Are you sure you want to cancel this upload?",
										dictRemoveFile : "Remove file",
										dictMaxFilesExceeded : "You can not upload any more files. thank ",

										headers : {
											'X-CSRFToken' : $(
													'meta[name="token"]').attr(
													'content')
										},
										accept : function(file, done) {
											console.log("uploaded");
											$('.dz-message').remove();
											done();
										},
										error : function(file, msg) {
											$('#modalSlideUpErrore').modal(
													'show');
											$("#infosError").html(msg);
											myDropzone.removeAllFiles();
										},

										init : function() {

											var myDropzone = this;
											var stillSending = false;
											var nbrFile = 0;
											this.on("addedfile",
													function(file) {
														nbrFile++;
														$("#nbrFiles").val(
																nbrFile);
														$("#ClearFileDive").show();
														$("#startProsessingDive").show();

													});

											this.on("sendingmultiple",
													function(file, progress) {
														stillSending = true;

													});

											this.on("processingmultiple",
													function(file, progress) {

													});

											this
													.on(
															"totaluploadprogress",
															function(
																	uploadProgress) {

																document
																		.querySelector("#progresUpload").style.width = uploadProgress
																		+ "%";
																document
																		.querySelector("#pourcentage").value = uploadProgress
																		+ "%";

																if (uploadProgress != 100) {
																	$(
																			'#CloseResponse')
																			.hide();

																} else

																{

																	$(
																			'#progressing')
																			.html(
																					"<span class='pull-right' id='progressing'><i class='fa fa-check-circle fa-3x text-primary'></i> </span>");
																	$('#status')
																			.text(
																					"Done");
																	$(
																			'#CloseResponse')
																			.show();

																}

															});

											this.on("completemultiple",
													function(file) {

														this.removeAllFiles();
														stillSending = false;

													});

											this.on('resetFiles', function() {
												this.removeAllFiles();
											});

											this.on("queuecomplete", function(
													progress) {

											});

											this
													.on(
															"successmultiple",
															function(files,
																	serverResponse) {
																showInformationDialog(
																		files,
																		serverResponse);
															});

											$("#ClearAllFiles")
													.on(
															"click",
															function() {
																myDropzone.removeAllFiles();
																nbrFile = 0;
																$("#nbrFiles")
																		.val(
																				"0");
																$("#ClearFileDive").hide();
																$("#startProsessingDive").hide();
																$('#dz-messageDiv').show();
																
															});

											document.getElementById("sbmtbtn").onclick = function(
													e) {
												e.preventDefault();
												var files = myDropzone
														.getQueuedFiles();
												files.forEach(function(file) {
													myDropzone
															.processFile(file);
												});

											};

											function showInformationDialog(
													files, objectArray) {

												var responseContent = "";

												for (var i = 0; i < objectArray.length; i++) {

													var infoObject = objectArray[i];

													for ( var infoKey in infoObject) {
														if (infoObject
																.hasOwnProperty(infoKey)) {
															responseContent = responseContent
																	+ " "
																	+ infoKey
																	+ " -> "
																	+ infoObject[infoKey]
																	+ "<br>";
														}
													}
													responseContent = responseContent
															+ "<hr>";
												}

												$('#modalSlideUp')
														.modal('show');
												$("#infos").append(
														responseContent);

											}

										}

									});
						 
						 
						});

		
		
		
		
		//---------------------------------------------------------------------------------------------------------------------------------------------------//
		//---------------------------------------------------------------------------------------------------------------------------------------------------//
		// ---------------------------------------------------------------- Fin DropZone --------------------------------------------------------------------//
		//---------------------------------------------------------------------------------------------------------------------------------------------------//
		//---------------------------------------------------------------------------------------------------------------------------------------------------//
		
		
		
		// Fin Drop Zzone 
		
		
		
		$(function() {
			
			
	 
			
			
			
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
										text : obj.nameAtm
									};
								})
							};
						}

					}

				});
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

			$("#InfoAutomatique").hide();
			$("#testConexion").hide();
			$("#ClearFileDive").hide();
			$("#startProsessingDive").hide();
			
			
			$("#AutoUpload").on("change", function()

			{
				
				 
				 
           
                 
                     if(!$(this).is(':checked'))
                	 {
                	 $("#cardUpload").toggle();
                	 $('#ManuelUpload').trigger('click');
                	 $('#ManuelUploadDive').css('visibility','visible');
                	 $("#InfoAutomatique").hide();
                	 $("#testConexion").hide();
                	 $("#startProsessingDive").hide();
                	 
                	 
                	 //$('#').hide();
                	 
                	 }
                
                     else 
                     {
                    	 
                   	$("#cardUpload").toggle();
                   	$('#ManuelUpload').trigger('click');
                   	$('#ManuelUploadDive').css('visibility','hidden')
                   	$("#InfoAutomatique").show();
                    $("#testConexion").show();
                    $("#startProsessingDive").show();

                 
                
                   
                    
                     }

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

			$('#myCardX2').card({
				onRefresh : function() {
					 
					setTimeout(function() {
						$('#myCardX2').card({
							refresh : false
						});
					}, 2000);
				}
			});
			
			
		});