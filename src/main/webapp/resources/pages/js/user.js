

$(function () {
	
	
	$(document).ready(function() {
	    $('#addUserForm').validate();
	});
	
	
	
	
	$('a.delete').confirm({
	    content: "",
	    type: 'red',
	    typeAnimated: true,
	         buttons: {
	        	 
	             Delete: {
	                       text: 'Delete user',
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
	
	$('#show-modal').click(function(){$('#addNewAppModal').modal('show');});
	$('#delete').click(function()
			{
		    $('#modalSlideUpSmall').modal('show');
});
	
	$("#creationDate").val(new Date().toISOString());
	$("#userProfiles").select2();
	$("#TyepHost").select2();
	$("#TyepAtmUpdate").select2();
	$("#TyepHostUpdate").select2();
	
	 
	
	
var elems = Array.prototype.slice.call(document.querySelectorAll('#ConnexionHandler'));

elems.forEach(function(html) {
    var switchery = new Switchery(html);
});
 
 
 
 
 
$("#ConnexionHandler").on("change",function()
		
		{
	
	     var isDisabled = $('#typeConnexion').prop('disabled');
	     
	    if (isDisabled == true)
		{	 
		    $("#typeConnexion").removeAttr("disabled");
		    $("#AdressIp").removeAttr("disabled");
		    $("#readingDisuqeLetter").removeAttr("disabled");
		}
	    
	    else 
	    {
	     
	    	$("#typeConnexion").prop('disabled', true);
		    $("#AdressIp").prop('disabled', true);
		    $("#readingDisuqeLetter").prop('disabled', true);
		}
	
 });
 
} );
 
 
 
 
 
 