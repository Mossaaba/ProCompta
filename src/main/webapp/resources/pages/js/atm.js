$(document).ready(function() 
				{
							
							jQuery.validator.addMethod("notEqual", function(value, element, param) {
								  return this.optional(element) || value != param;
								});

							
						 
							
							$('#addAtmForm').validate(
											
											{  
												
												
												rules : {
													Vendor : { 
														notEqual : "-1",  
													},
													"host.idHost" : {
														notEqual : "-1",
													},
													"branch.idBranch" : {
														notEqual : "-1",
													},
													nameAtm : {
														required : true
													},
													repositoryFile : {
														required : true
													},
													readingDisuqeLetter : {
														required : true
													},
													AdressIp : {
														required : true
													} 

												},
												messages : {
													Vendor : {
														
														required:	"Le champs ne peut pas etre une chaine vide",
														notEqual: "You must select a vendor"
														
													}, 
													"host.idHost" : {
														 
														required:	"Le champs ne peut pas etre une chaine vide",
														notEqual: "You must select a host server ", 
														
													},
													"branch.idBranch" : {
														 
														required:	"Le champs ne peut pas etre une chaine vide",
														notEqual: "You must associate this atm with a branch", 
														
													},

													nameAtm : "Le champs ne peut pas etre une chaine vide",
													repositoryFile : "Le champs ne peut pas etre une chaine vide",
													readingDisuqeLetter : "Le champs ne peut pas etre une chaine vide",
													AdressIp : "Le champs ne peut pas etre une chaine vide"
													 
												}
											});

							$('#dataTableAtm tbody').on(
									'click',
									'tr',
									function() {
										if ($(this).hasClass('selected')) {
											$(this).removeClass('selected');
										} else {
											table.$('tr.selected').removeClass(
													'selected');
											$(this).addClass('selected');
										}
									});

							
						});

		$(function() {

			$("#Vendor")
					.select2(
							{
								dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
								allowClear : true,
								placeholder : {
									id : "-1",
									text : "Please select a Vendor",
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

			$("#branch")
					.select2(
							{
								dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
								allowClear : true,
								placeholder : {
									id : "-1",
									text : "Please select a Branch",
									selected : 'selected'
								},
								data : [ {
									id : -1,
									text : '',
									selected : 'selected',
									search : '',
									hidden : true
								} ]

							});

			$("#host")
					.select2(
							{
								dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
								allowClear : true,
								placeholder : {
									id : "-1",
									text : "Please select a host",
									selected : 'selected'
								},
								data : [ {
									id : -1,
									text : '',
									selected : 'selected',
									search : '',
									hidden : true
								} ]

							});

			$('#show-modal').click(function() {
				$('#addNewAppModal').modal('show');
			});

			$('a.delete').confirm({
				content : "",
				type : 'red',
				typeAnimated : true,
				buttons : {

					Delete : {
						text : 'Delete Atm',
						btnClass : 'btn-red',
						action : function() {
							location.href = this.$target.attr('href');
						}
					},

					close : function() {
					}
				}
			});

			var countries = new Bloodhound({
				datumTokenizer : Bloodhound.tokenizers.whitespace,
				queryTokenizer : Bloodhound.tokenizers.whitespace,
				prefetch : "${pageContext.request.contextPath}/api/disque"
			});

			$('#readingDisuqeLetter').typeahead(null, {
				name : 'countries',
				source : countries
			});

			var elems = Array.prototype.slice.call(document
					.querySelectorAll('#ConnexionLocalHandler'));
			var elems2 = Array.prototype.slice.call(document
					.querySelectorAll('#ConnexionRemotHandler'));

			elems.forEach(function(html) {
				var switchery = new Switchery(html);
			});

			elems2.forEach(function(html) {
				var switchery = new Switchery(html);
			});

			$("#ConnexionRemotHandler").on("change", function()

			{

				var isDisabled = $('#AdressIp').prop('disabled');

				if (isDisabled == true) {

					$("#AdressIp").removeAttr("disabled");
					$("#readingDisuqeLetter").removeAttr("disabled");
					$("#typeConnexion").val("remote");
					$("#localDive").hide();

				}

				else {

					$("#AdressIp").prop('disabled', true);
					$("#readingDisuqeLetter").prop('disabled', true);
					$("#localDive").show();
				}

			});

			$("#ConnexionLocalHandler").on("change", function()

			{

				var isDisabled = $('#repositoryFile').prop('disabled');
				var x = document.getElementById("remotDive");
				if (isDisabled == true) {

					$("#repositoryFile").removeAttr("disabled");
					$("#typeConnexion").val("local");
					$("#remotDive").hide();
					$("#windowsDiv").hide();

				}

				else {

					$("#repositoryFile").prop('disabled', true);

					$("#remotDive").show();
					$("#windowsDiv").show();

				}

			});

		});