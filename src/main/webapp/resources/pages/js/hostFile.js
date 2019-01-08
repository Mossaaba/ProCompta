$('#card-advance-resultat').card();

$('#startingTimeFilterIncident').timepicker({
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
$('#finisingTimeFilterIncident').timepicker({
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


$('#incidentDateStarting').datepicker({

    weekStart: 1,
    format : 'yyyy-mm-dd',
    startDate: '01/01/2000',
    endDate: FromEndDate, 
    autoclose: true
}).on('changeDate', function(selected)
		{
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
        $('#incidentDateFinishing').datepicker('setStartDate', startDate);
    });


$('#incidentDateFinishing').datepicker({

        weekStart: 1,
        format : 'yyyy-mm-dd',
        startDate: startDate,
        endDate: ToEndDate,
        autoclose: true
    })
    .on('changeDate', function(selected){
        FromEndDate = new Date(selected.date.valueOf());
        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
        $('#incidentDateStarting').datepicker('setEndDate', FromEndDate);
    });


/*********************************
 ********************************* 
 ********************************* 
 END : D A T E           R A N G E  
 ********************************* 
 *********************************
 *********************************
 *********************************/

$("#IncidentATM").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select a type of incident ",
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

  


/*********************************
 ********************************* 
 ********************************* 
 F O R M     V  A  L I D A T I O N 
 ********************************* 
 *********************************
 *********************************
 *********************************/

$("#incidentFilterForm")
		.submit(
				function(e) {
					
					   
					
					var startingDateX = $("#incidentDateStarting").val();
					var finshingDateY = $("#incidentDateFinishing").val();

					
					if (!startingDateX || !finshingDateY) 
					{

						$.confirm({
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
												$('#startingDateDive').addClass(
														'b-danger b-dashed');
												$("#finishingDateDive")
														.addClass(
																'b-danger b-dashed');
											}

										}
									}
								});

						return false;
					}
					 
					
				});

 

$("#clearFormIncident").click(function() {
    $(this).closest('form').find("input[type=text], textarea").val("");
    $("#ATM").val('').trigger('change');
	$("#IncidentATM").val('').trigger('change');
});

 
