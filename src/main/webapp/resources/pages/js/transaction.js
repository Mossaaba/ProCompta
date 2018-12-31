 




$('#card-advanceWincor').card();
$('#card-advance-resultat').card();



$('#transactionTimeStarting').timepicker({
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
$('#transactionTimeFinishing').timepicker({
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



$('#transactionDateStarting').datepicker({

    weekStart: 1,
    format : 'yyyy-mm-dd',
    startDate: '01/01/2000',
    endDate: FromEndDate, 
    autoclose: true
}).on('changeDate', function(selected)
		{
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
        $('#transactionDateFinishing').datepicker('setStartDate', startDate);
    });


$('#transactionDateFinishing').datepicker({

        weekStart: 1,
        format : 'yyyy-mm-dd',
        startDate: startDate,
        endDate: ToEndDate,
        autoclose: true
    })
    .on('changeDate', function(selected){
        FromEndDate = new Date(selected.date.valueOf());
        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
        $('#transactionDateStarting').datepicker('setEndDate', FromEndDate);
    });


/*********************************
 ********************************* 
 ********************************* 
 END : D A T E           R A N G E  
 ********************************* 
 *********************************
 *********************************
 *********************************/






 

/*********************************
 ********************************* 
 ********************************* 
 F O R M     V  A  L I D A T I O N 
 ********************************* 
 *********************************
 *********************************
 *********************************/

$("#TransactionFilterForm")
		.submit(
				function(e) {

					var startingDateX = $("#transactionDateStarting").val();
					var finshingDateY = $("#transactionDateFinishing").val();

					var date1 = new Date(startingDateX);
					var date2 = new Date(finshingDateY);
					var timeDiff = Math.abs(date2.getTime() - date1.getTime());
					var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

					var cardPartOne = $("#cardNumberP1").val();
					var cardPartTwo = $("#cardNumberP2").val();

					if (!(cardPartOne === '')) {

						if ((cardPartTwo === '') || (cardPartTwo.length < 4)
								|| (cardPartOne.length < 6)) {
							$
									.confirm({
										title : 'CARD NUMBER IS RONG  !',
										content : 'You should enter a valid card number . ',
										type : 'red',
										animation : 'left',
										icon : 'fa fa-exclamation-circle fa-spin',
										typeAnimated : true,
										buttons : {

											close : {
												text : 'Close',
												btnClass : 'btn-red',
												action : function() {

													$('#partTwoCard')
															.addClass(
																	'b-danger b-dashed');
													$("#partOneCard")
															.addClass(
																	'b-danger b-dashed');
												}

											}
										}
									});

							return false;

						}

					}

					if (diffDays > 93) {

						$
								.confirm({
									title : 'Date range is too big !',
									content : 'You should select a date range less than or equal to two months. ',
									type : 'red',
									animation : 'left',
									icon : 'fa fa-exclamation-circle fa-spin',
									typeAnimated : true,
									buttons : {

										close : {
											text : 'Close',
											btnClass : 'btn-red',
											action : function() {
												$('#divStartingDate').addClass(
														'b-danger b-dashed');
												$("#divFinishingDate")
														.addClass(
																'b-danger b-dashed');
											}

										}
									}
								});

						return false;

					}

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
												$('#divStartingDate').addClass(
														'b-danger b-dashed');
												$("#divFinishingDate")
														.addClass(
																'b-danger b-dashed');
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

$("#ATM").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select an ATM",
		selected : 'selected',
	},
	data : [ {
		id : -1,
		text : '',
		selected : 'selected',
		search : '',
		hidden : true
	} ]
}); 

$("#vendor").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select a vendor",
		selected : 'selected',
	},
	data : [ {
		id : -1,
		text : '',
		selected : 'selected',
		search : '',
		hidden : true
	} ]
});

$("#vendor").on('change', function(e) {

	var vendorName = $("#vendor").val();

	if (vendorName === 'Diebold-nixdorf') {
		$('#WincorDive').show();

	} else {

		$('#WincorDive').hide();

	}
})

$("#transactionType").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select a type of transaction",
		selected : 'selected',
	},
	data : [ {
		id : -1,
		text : '',
		selected : 'selected',
		search : '',
		hidden : true
	} ]
});

$("#transactionError").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select an error of transaction",
		selected : 'selected',
	},
	data : [ {
		id : -1,
		text : '',
		selected : 'selected',
		search : '',
		hidden : true
	} ]
});

$("#cardStatus").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select yes or non for card status",
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

$("#cashStatus").select2({
	dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
	allowClear : true,
	placeholder : {
		id : "-1",
		text : "Please select yes or non for cash status",
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



$("#clearTransactionForm").click(function() {
      $(this).closest('form').find("input[type=text], textarea").val("");
      $("#ATM").val('').trigger('change');
      $("#vendor").val('').trigger('change');
      $("#transactionType").val('').trigger('change');
      $("#transactionError").val('').trigger('change');
      $("#cardStatus").val('').trigger('change');
      $("#cashStatus").val('').trigger('change');
     
});
