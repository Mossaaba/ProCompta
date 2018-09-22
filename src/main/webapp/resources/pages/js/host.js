

$(function () {
	
	
	
	 
	$('#addhostForm').validate({
    	rules : {
    		
    		nomHost : {
                required : true                 
            }, 
            configCassette1 : {
            	required : true
            },
            configCassette2 : {
            	required : true
            },
            configCassette3 : {
            	required : true
            },
            
            configCassette4 : {
            	required : true
            }
        },
        messages: {    	
        	nomHost : "Le champs ne peut pas être une chaîne vide " , 
        	configCassette1 : "Eentrer une valeur pour la cassettes N1" , 
        	configCassette2 : "Eentrer une valeur pour la cassettes N2" , 
        	configCassette3 : "Eentrer une valeur pour la cassettes N3" , 
        	configCassette4 : "Eentrer une valeur pour la cassettes N4" 
        	
        }
    	
    	
    	
    }); 

	
	
	$( "#ClearForm" ).click(function() {


		document.getElementById('nomHost').value = '';
		document.getElementById('configCassette1').value = '';
		document.getElementById('configCassette2').value = '';
		document.getElementById('configCassette3').value = '';
		document.getElementById('configCassette4').value = '';
		 
		
	});
	
	
	
	
	$('a.delete').confirm({
	    content: "",
	    type: 'red',
	    typeAnimated: true,
	         buttons: {
	        	 
	             Delete: {
	                       text: 'Delete Host',
	                       btnClass: 'btn-red',
	                       action : function()
	                       {
             	            location.href = this.$target.attr('href');
                           }
	                     },
	             
	        close: function () {
	        }
	    }
	});
	
	
	$('a.delete').confirm({
	    buttons: {
	        hey: function(){
	            location.href = this.$target.attr('href');
	        }
	    }
	});
	
	
	

} );