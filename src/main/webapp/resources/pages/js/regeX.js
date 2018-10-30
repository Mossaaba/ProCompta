

$(function () {
	
	
	    
	 
	$('#addRegeXForm').validate({
    	rules : {
    		
    		nameRegex : {
                required : true                 
            }, 
            valueRegex : {
            	required : true
            },
            index_X : {
            	required : true
            },
            index_Y : {
            	required : true
            },
            detailsRegex : {
            	required : true
            }
        },
        messages: {    	
        	nameRegex : "Le champs ne peut pas être une chaîne vide " , 
        	valueRegex : "Le champs ne peut pas être une chaîne vide " , 
        	index_X : "Le champs ne peut pas être une chaîne vide " , 
        	index_Y : "Le champs ne peut pas être une chaîne vide " , 
        	detailsRegex : "Le champs ne peut pas être une chaîne vide " 
        	
        }
    	
    	
    	
    }); 

	
	
	$( "#ClearForm" ).click(function() {


		document.getElementById('nameRegex').value = '';
		document.getElementById('valueRegex').value = '';
		document.getElementById('index_X').value = '';
		document.getElementById('index_Y').value = '';
		document.getElementById('detailsRegex').value = '';
		 
		
	});
	
	
	
	
	$('a.delete').confirm({
	    content: "",
	    type: 'red',
	    typeAnimated: true,
	         buttons: {
	        	 
	             Delete: {
	                       text: 'Delete RegeX',
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