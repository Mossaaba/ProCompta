uplaod = function()
	
	{
		
		var data = new FormData();
		jQuery.each(jQuery('#file')[0].files, function(i, file) {
		    data.append('file-'+i, file);
		});
		
		
		$.ajax({
			url:'imageUpload',
			data: data,
		    cache: false,
		    contentType: false,
		    processData: false,
		    headers: {"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")},
			type:'POST',
			success: function(response){
				if(response.Status == 200){
					alert(response.SucessfulList);
				}else{
					alert('Error');
				}	
			}				
		});
		
	
	}
	
	
	
	$(document).ready(function() {
		
		
		$("#bin").mask("999999");
		
	    $('#addBankForm').validate({
	    	rules : {
	    		bin : {
	                required : true                 
	            }, 
	            namBank : {
	            	required : true
	            },
	            
	            abbreviation : {
	            	required : true
	            }
	        },
	        messages: {    	
	        	bin : "le bin doit pas etre vide ou inférieure a 6 digit",
	        	namBank : "Le nom de la banque ne peut pas être une chaîne vide "  , 
	        	abbreviation : "Le champs ne peut pas être une chaîne vide "
	        }
	    	
	    	
	    	
	    }); 
	    
	    
	    
	 
	    
	    
	});
	
		$(function() {

			
			
			
			$('a.delete').confirm({
				content : "",
				type : 'red',
				typeAnimated : true,
				buttons : {

					Delete : {
						text : 'Delete Bank',
						btnClass : 'btn-red',
						action : function() {
							location.href = this.$target.attr('href');
						}
					},

					close : function() {
					}
				}
			});

			$('a.delete').confirm({
				buttons : {
					hey : function() {
						location.href = this.$target.attr('href');
					}
				}
			});

			$('#show-modal').click(function() {
				$('#addNewAppModal').modal('show');
			});
			$('#delete').click(function() {
				$('#modalSlideUpSmall').modal('show');
			});

			$("#creationDate").val(new Date().toISOString());
			$("#userProfiles").select2();
			$("#TyepHost").select2();
			$("#TyepAtmUpdate").select2();
			$("#TyepHostUpdate").select2();

			var elems = Array.prototype.slice.call(document
					.querySelectorAll('#ConnexionHandler'));

			elems.forEach(function(html) {
				var switchery = new Switchery(html);
			});

			$("#ConnexionHandler").on("change", function()

			{

				var isDisabled = $('#typeConnexion').prop('disabled');

				if (isDisabled == true) {
					$("#typeConnexion").removeAttr("disabled");
					$("#AdressIp").removeAttr("disabled");
					$("#readingDisuqeLetter").removeAttr("disabled");
				}

				else {

					$("#typeConnexion").prop('disabled', true);
					$("#AdressIp").prop('disabled', true);
					$("#readingDisuqeLetter").prop('disabled', true);
				}

			});

		});
		
		
		
		function isNumberKey(evt){
		    var charCode = (evt.which) ? evt.which : event.keyCode
		    if (charCode > 31 && ((charCode < 48) || (charCode > 57)))
		        return false;
		    return true;
		};
		
		
		$( "#ClearForm" ).click(function() {


			document.getElementById('namBank').value = '';
			document.getElementById('adressBank').value = '';
			document.getElementById('file').value = '';
			document.getElementById('abbreviation').value = '';
			document.getElementById('bin').value = '';
			document.getElementById('phoneBank').value = '';
			
			
			 
			
		});
		