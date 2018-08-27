

/* BOOTSTRAP SLIDER FOR AMOUTN  */
/* BOOTSTRAP SLIDER FOR AMOUTN  */
/* BOOTSTRAP SLIDER FOR AMOUTN  */
/* BOOTSTRAP SLIDER FOR AMOUTN  */
$(function() {

	/* BOOTSTRAP SLIDER FOR AMOUTN  */
	var $range = $("#montantRange"), $resultMin = $("#montantMin"), $resultMax = $("#montantMax"),

	from = 0, to = 0;

	var saveResult = function(data) {
		from = data.from;
		to = data.to;
	};

	var writeResult = function() {
		var resultMinum = from;
		var resultMaxim = to;

		$resultMin.val(resultMinum);
		$resultMax.val(resultMaxim)
	};

	/* ION SLIDER */
	$("#montantRange").ionRangeSlider({
		type : "double",
		grid : true,
		min : 0,
		max : 50000,
		from : 0,
		to : 50000,
		step : 500,
		prefix : "DZD",
		prettify : false,

		hasGrid : true,
		disable : true,
		onStart : function(data) {
			saveResult(data);
			writeResult();
		},
		onChange : saveResult,
		onFinish : saveResult

	});

	$range.on("change", writeResult);

});

$("#AmountHandler").on("change", function()

{

	var isDisabled = $('#montantMax').prop('disabled');

	if (isDisabled == true) {

		$("#montantMax").removeAttr("disabled");
		$("#montantMin").removeAttr("disabled");
		$("#montant").prop('disabled', true);
		$("#montantRange").data("ionRangeSlider").update({
			disable : false,
		});

	}

	else {
		$("#montant").removeAttr('disabled');
		$("#montantMax").prop('disabled', true);
		$("#montantMin").prop('disabled', true);
		$("#montantRange").data("ionRangeSlider").update({
			disable : true,
		});

	}

});
/* END  SLIDER FOR AMOUTN  */
/* END  SLIDER FOR AMOUTN  */
/* END  SLIDER FOR AMOUTN  */


/* ONLY NUMBER INPUT  */
/* ONLY NUMBER INPUT  */
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && ((charCode < 48) || (charCode > 57)))
        return false;
    return true;
}

/* ONLY NUMBER INPUT  */
/* ONLY NUMBER INPUT */
/* ONLY NUMBER INPUT  */




