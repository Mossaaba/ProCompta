$('#card-advance-resultat').card();
$("#cardBodyDateTable").hide();
$('#startingTimeFilterReplenishment').timepicker({
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
$('#finisingTimeFilterReplenishment').timepicker({
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

 
$('#StartingDateFilterReplenishment').datepicker({

    weekStart: 1,
    format : 'yyyy-mm-dd',
    startDate: '01/01/2000',
    endDate: FromEndDate, 
    autoclose: true
}).on('changeDate', function(selected)
		{
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
        $('#FinishingDateFilterReplenishment').datepicker('setStartDate', startDate);
    });


$('#FinishingDateFilterReplenishment').datepicker({

        weekStart: 1,
        format : 'yyyy-mm-dd',
        startDate: startDate,
        endDate: ToEndDate,
        autoclose: true
    })
    .on('changeDate', function(selected){
        FromEndDate = new Date(selected.date.valueOf());
        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
        $('#StartingDateFilterReplenishment').datepicker('setEndDate', FromEndDate);
    });


/*********************************
 ********************************* 
 ********************************* 
 END : D A T E           R A N G E  
 ********************************* 
 *********************************
 *********************************
 *********************************/


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
  
$("#clearFormReplenishment").click(function(){
	
	$("#StartingDateFilterReplenishment").val("");
	$("#FinishingDateFilterReplenishment").val("");
	$("#startingTimeFilterReplenishment").val("");
	$("#finisingTimeFilterReplenishment").val("");
	$("#ATM").val('').trigger('change');
	 
	 
	
	
	
});



$("#replenishmentFilterForm")
		.submit(
				function(e) {

					var startingDateX = $("#StartingDateFilterReplenishment").val();
					var finshingDateY = $("#FinishingDateFilterReplenishment").val();

					var date1 = new Date(startingDateX);
					var date2 = new Date(finshingDateY);
					var timeDiff = Math.abs(date2.getTime() - date1.getTime());
					var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

				 
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
												$('#startDate').addClass(
														'b-danger b-dashed  ');
												$("#finishDate")
														.addClass(
																'b-danger b-dashed b-transparent');
											}

										}
									}
								});

						return false;
					}
				});

/*********************************
 ********************************* 
 ********************************* 
 E N D     F O R M     V  A  L I D A T I O N 
 ********************************* 
 *********************************
 *********************************
 *********************************/
$("#viewTable").click(function(){
	

	$("#cardBodyOneByOne").hide();
	$("#cardBodyDateTable").show();
	$("#collapseBtn").click();
	
});

$("#oneByOne").click(function(){
	
	$("#cardBodyDateTable").hide();
	$("#cardBodyOneByOne").show();
	$("#cardBodyOneByOnex").show();
});









