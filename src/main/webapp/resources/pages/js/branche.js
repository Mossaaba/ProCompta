$(function() {
			  
			
			$('#addbranchForm').validate({
		    	rules : {
		    		codeBranche : {
		                required : true                 
		            }
		             
		        },
		        messages: {    	
		        	 
		        	codeBranche : "Le champs ne peut pas être une chaîne vide "
		        }
		    	
		    	
		    	
		    }); 
			
			
			 
			
			
			
			$('a.delete').confirm({
				content : "",
				type : 'red',
				typeAnimated : true,
				buttons : {

					Delete : {
						text : 'Delete Branch',
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


			
			
			
			
			
			
			$( "#ClearForm" ).click(function() {


				document.getElementById('codeBranche').value = '';
				document.getElementById('nomBranch').value = '';
				document.getElementById('adressBranch').value = '';
				document.getElementById('phoneBranch').value = '';
				document.getElementById('nbrStation').value = '';
				
				
			});
			
			
			
			
		 });
		function isNumberKey(evt){
		    var charCode = (evt.which) ? evt.which : event.keyCode
		    if (charCode > 31 && ((charCode < 48) || (charCode > 57)))
		        return false;
		    return true;
		};