
$('#card-advance-resultat').card();

$('#startingTimeFilterErrorATM').timepicker({
	'defaultTime' : false,
	'showDuration' : true,
	'minuteStep' : 1,
	timeFormat : 'hh:mm:ss tt',
	showSecond : true,
	icons : {
		up : "fa fa-chevron-circle-up",
		down : "fa fa-chevron-circle-down",
		next : 'fa fa-chevron-circle-right',
		previous : 'fa fa-chevron-circle-left'
	}
});  

$('#finisingTimeFilterErrorATM').timepicker({
	'defaultTime' : false,
	'showDuration' : true,
	'minuteStep' : 1,
	timeFormat : 'hh:mm:ss tt',
	showSecond : true,
	icons : {
		up : "fa fa-chevron-circle-up",
		down : "fa fa-chevron-circle-down",
		next : 'fa fa-chevron-circle-right',
		previous : 'fa fa-chevron-circle-left'
	}
});


/*********************************
 ********************************* 
 ********************************* 
 start:D A T E           R A N G E  
 ********************************* 
 *********************************
 *********************************
 *********************************/


var startDate = new Date('01/01/2012');
var FromEndDate = new Date();
var ToEndDate = new Date();
ToEndDate.setDate(ToEndDate.getDate()+365);

 
$('#startingDateFilterErrorATM').datepicker({

    weekStart: 1,
    format : 'yyyy-mm-dd',
    startDate: '01/01/2000',
    endDate: FromEndDate, 
    autoclose: true
}).on('changeDate', function(selected)
		{
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
        $('#finishingDateFilterErrorATM').datepicker('setStartDate', startDate);
    });


$('#finishingDateFilterErrorATM').datepicker({

        weekStart: 1,
        format : 'yyyy-mm-dd',
        startDate: startDate,
        endDate: ToEndDate,
        autoclose: true
    })
    .on('changeDate', function(selected){
        FromEndDate = new Date(selected.date.valueOf());
        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
        $('#startingDateFilterErrorATM').datepicker('setEndDate', FromEndDate);
    });


/*********************************
 ********************************* 
 ********************************* 
 END : D A T E           R A N G E  
 ********************************* 
 *********************************
 *********************************
 *********************************/

$("#ErrorAtm").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select an incident ",
		selected : 'selected',
	},
	data : [ {
		id : -1,
		text : 'null',
		selected : 'selected',
		search : '',
		hidden : true
	} ]
});


$("#ATM").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select an atm",
		selected : 'selected',
	},
	data : [ {
		id : -1,
		text : 'null',
		selected : 'selected',
		search : '',
		hidden : true
	} ]
});



$("#errorATMFilterForm")
.submit(
		function(e) {
			
			
			
			var startingDateX = $("#startingDateFilterErrorATM").val();
			var finshingDateY = $("#finishingDateFilterErrorATM").val();

			
			if (!startingDateX || !finshingDateY) {

				$
						.confirm({
							title : 'Date range is mandatory!',
							content : 'You should select a date range (starting date and finishing date). ',
							type : 'red',
							animation : 'left',
							icon : 'fa fa-exclamation-circle fa-spin',
							typeAnimated : true,
							buttons : {
								  
								close : {
									text : 'Close',
									btnClass : 'btn-red',
									action : function() {
										$('#finishingDateDiv').addClass(
												'b-danger b-dashed');
										$("#startingDateDiv")
												.addClass(
														'b-danger b-dashed');
									}

								}
							}
						});

				return false;
			}
			
			
		});

  
$("#ClearErrorForm").click(function() {
    $(this).closest('form').find("input[type=text], textarea").val("");
    $("#ATM").val('').trigger('change');
	$("#ErrorAtm").val('').trigger('change');
});



