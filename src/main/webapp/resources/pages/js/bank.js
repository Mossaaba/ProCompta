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
					
					
					 
					
					document.getElementById("new_Btn").innerHTML = "response.SucessfulList";
					
					
				}else{
					document.getElementById("new_Btn").innerHTML = "Errore !";
					 
				}	
			}				
		});
		
	
	}
	
	
	
	$(document).ready(function() {
		
		
		
		
		$('.new_Btn').bind("click" , function () {
	        $('#file').click();
	        $("#UplaodLogo").show();
	    });
		
		
		
		
		
		
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
		