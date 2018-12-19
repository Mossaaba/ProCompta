<%@ page session="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<style>
.exportOptions2 .DTTT.btn-group a {
	display: inline;
}

.dataTables_filter {
	text-align: right !important;
}
</style>






</head>


<body class="fixed-header windows desktop pace-done">

	<jsp:include page="../view/fragments/menu.jsp"></jsp:include>


	<div class="page-container ">
		<jsp:include page="../view/fragments/header.jsp"></jsp:include>


		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">

			<div class="page-content-wrapper">


				<!-- *************** -->
				<!--    container 1  -->
				<!-- *************** -->
				<div class="content">

					<div class=" container-fluid   container-fixed-lg">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active fs-18 "><i
								class="fa fa-exchange fa-3x m-b-20"></i>Searching for a Trasnaction</li>
						</ol>


						<div class="card-body">
							<div class="row">
								<div class="col-lg-12">
									<div id="card-linear" class="card card-default">
										<div class="card-header  ">
											<div class="card-title">
												<h5>
													<span class="semi-bold"> <i
														class="fa fa-filter fa-2x"></i> Transaction
													</span> Filters
												</h5>
											</div>
											<div class="card-controls">
												<ul>
													<li><a href="#" class="card-collapse"
														data-toggle="collapse"><i
															class="card-icon card-icon-collapse"></i></a></li>
													<li><a href="#" class="card-refresh"
														data-toggle="refresh"><i
															class="card-icon card-icon-refresh"></i></a></li>
													<li><a href="#" class="card-close" data-toggle="close"><i
															class="card-icon card-icon-close"></i></a></li>
												</ul>
											</div>
										</div>


										<div class="card-body">

											<div class="card-body">
												<!-- *************** -->
												<!-- Form            -->
												<!-- *************** -->

												<spring:url value="/transaction/find"
													var="formUrlTrnsaction" />

												<form:form action="${formUrlTrnsaction}" method="POST"
													modelAttribute="transaction">

													<form:input type="text" path="transactionDateStarting"
														id="DebuttransactionDate" cssClass="form-control"
														cssStyle=" display: none;" />
													<form:input type="text" path="transactionDateFinishing"
														cssClass="form-control pull-right"
														cssStyle=" display: none;" />
													<form:input type="text" path="transactionTimeStarting"
														cssClass="form-control pull-right"
														cssStyle=" display: none;" />
													<form:input type="text" path="transactionTimeFinishing"
														cssClass="form-control pull-right"
														cssStyle=" display: none;" />



													<div class="form-group-attached">
														<div class="row clearfix">
															<div class="col-md-3">

																<p
																	class="text-primary font-montserrat v-align-middle fs-12 bold">Branch</p>
																<div
																	class="form-group form-group-default form-group-default-select2  required">


																	<select class="full-width" id="branch"
																		data-init-plugin="select2">
																	</select>
																</div>

															</div>
															<div class="col-md-3">

																<p
																	class="text-primary font-montserrat v-align-middle fs-12 bold">ATM</p>
																<div
																	class="form-group form-group-default form-group-default-select2  required">


																	<select class="full-width" id="atm"
																		data-init-plugin="select2">
																	</select>
																</div>

															</div>

															<div class="col-md-6">
																<p
																	class="text-primary font-montserrat v-align-middle fs-12 bold">Date
																	and Time information</p>
																<div class="form-group form-group-default required">

																	<label>Date and time</label><i class="pg-calender"></i>

																	<form:input path="transactionDateHost" type="text"
																		id="dateAndTimeTransaction" cssClass="form-control"
																		autocomplete="off" />

																</div>
																<form:errors path="transactionDateHost"
																	cssClass="alert alert-danger" />

															</div>


														</div>



													</div>
													<br>

													<div class="form-group-attached">
														<br>
														<p>Carte Information</p>
														<div class="row clearfix">
															<div class="col-md-6">
																<div class="form-group form-group-default ">
																	<label>Card number</label><i
																		class="pg-credit_card_line"></i>
																	<form:input path="transaction_host_card" type="text"
																		cssClass=" form-control" maxlength="16"
																		placeholder="8888-8888-8888-8888"
																		onkeypress="return isNumberKey(event)" />
																	<form:errors path="transaction_host_card"
																		cssClass="alert alert-danger" />

																</div>
															</div>


														</div>

													</div>


													<p class="m-t-10">Cache Information</p>
													<div class="form-group-attached">


														<div class="row clearfix">


															<div class="col-md-6">
																<div class="form-group form-group-default ">
																	<label>Montant</label><i class="pg-layouts3"></i> <span
																		class="help">e.x. "DZD 6000.50"</span>
																	<form:input path="transactionHostAmount" type="number"
																		id="montant" data-a-sign="DZD "
																		cssClass="form-control" autocomplete="off" />
																	<form:errors path="transactionHostAmount"
																		cssClass="alert alert-danger" />
																</div>
															</div>


														</div>
														<div class="row">

															<div class="col-md-3">
																<div class="form-group form-group-default input-group">
																	<div class="form-input-group">
																		<label class="inline">Regilateur Prix</label>
																	</div>
																	<div class="input-group-append h-c-50">
																		<span class="input-group-text transparent"> <input
																			type="checkbox" data-init-plugin="switchery"
																			id="AmountHandler" data-size="small" data-color="red" />
																		</span>
																	</div>
																</div>
															</div>

															<div class="col-md-3">
																<div class="form-group form-group-default input-group">
																	<div class="form-input-group">
																		<label>Min</label>
																		<form:input path="transactionHostAmounttMin"
																			type="number" id="montantMin"
																			onkeypress="return isNumberKey(event)"
																			cssClass="form-control usd" disabled="true" />
																	</div>
																	<div class="input-group-append ">
																		<span class="input-group-text">DZD </span>
																	</div>
																</div>
															</div>



															<div class="col-md-3">

																<div class="form-group form-group-default input-group">
																	<div class="form-input-group">
																		<label>Max</label>
																		<form:input path="transactionHostAmountMax"
																			type="number" id="montantMax"
																			onkeypress="return isNumberKey(event)"
																			cssClass="form-control usd" disabled="true" />
																	</div>
																	<div class="input-group-append ">
																		<span class="input-group-text">DZD </span>
																	</div>
																</div>
															</div>



															<div class="col-md-3">

																<div class="irs-wrapper danger">
																	<input type="text" name="montantRange"
																		id="montantRange" value="" />
																</div>
															</div>
														</div>

													</div>
													<br>


													<div class="pull-left">
														<br>
														<form:button class="btn btn-success" type="submit">
															<i class="pg-search" style="font-size: 15px;"></i> Submit</form:button>
														<form:button class="btn btn-danger">
															<i class="pg-close"></i> Clear</form:button>
													</div>


												</form:form>
												<!-- *************** -->
												<!--   fin Form      -->
												<!-- *************** -->
											</div>
										</div>

									</div>
								</div>
								<!-- *************** -->
								<!--   Notification  -->
								<!-- *************** -->
								<c:if test="${!empty msg }">
									<div class="col-lg-4">
										<div class="card card-default bg-${css}" data-pages="card">
											<div class="card-header ">
												<div class="card-title text-white">
													<i class="pg-italic" style="font-size: 15px;"></i> Remarque
													:
												</div>
												<div class="card-controls">
													<ul>
														<li><a href="#" class="card-collapse"
															data-toggle="collapse"><i
																class="card-icon card-icon-collapse"></i></a></li>
														<li><a href="#" class="card-refresh"
															data-toggle="refresh"><i
																class="card-icon card-icon-refresh"></i></a></li>
														<li><a href="#" class="card-close"
															data-toggle="close"><i
																class="card-icon card-icon-close"></i></a></li>
													</ul>
												</div>
												<div class="card-body">
													<h3 class="text-white">
														<span class="semi-bold">${msg}</span>
													</h3>

												</div>

											</div>


										</div>
									</div>
								</c:if>
								<!-- *************** -->
								<!--  Fin : Notification  -->
								<!-- *************** -->




							</div>
						</div>
					</div>

					<!-- *************** -->
					<!--   Fin  container 1  -->
					<!-- *************** -->


					<!-- *************** -->
					<!--    container 2 Resultat  -->
					<!-- *************** -->


					<c:if test="${!empty ListTransactionAfterFiltring}">

						<div class=" container-fluid   container-fixed-lg">
							<div class="row">
								<div class="col-lg-12">

									<div class="card card-transparent">
										<div class="card-header ">
											<ol class="breadcrumb">
												<li class="breadcrumb-item active">Resultat de
													recherche</li>
											</ol>

										</div>
										<div class="card-body">
											<div class="row">
												<div class="col-lg-12">



													<div class="card card-transparent">
														<div class="card-body no-padding">
															<div id="card-advance" class="card card-default">
																<div class="card-header  ">
																	<div class="card-title">
																		<i class="fa fa-exchange" style="font-size: 15px;"></i>
																		Resultat de recherche par filter
																		<h3>
																			<span class="semi-bold">Transaction</span>
																		</h3>
																	</div>


																	<div class="card-controls">
																		<ul>
																			<li>
																				<div class="dropdown">
																					<a id="card-settings" data-target="#" href="#"
																						data-toggle="dropdown" aria-haspopup="true"
																						role="button" aria-expanded="false"> <i
																						class="card-icon card-icon-settings "></i>
																					</a>
																					<div class="dropdown-menu dropdown-menu-right"
																						role="menu" aria-labelledby="card-settings">
																						<a href="#" class="dropdown-item">API</a> <a
																							href="#" class="dropdown-item">Preferences</a> <a
																							href="#" class="dropdown-item">About</a>
																					</div>
																				</div>
																			</li>
																			<li><a href="#" class="card-collapse"
																				data-toggle="collapse"><i
																					class="card-icon card-icon-collapse"></i></a></li>
																			<li><a href="#" class="card-refresh"
																				data-toggle="refresh"><i
																					class="card-icon card-icon-refresh"></i></a></li>
																			<li><a href="#" class="card-maximize"
																				data-toggle="maximize"><i
																					class="card-icon card-icon-maximize"></i></a></li>
																			<li><a href="#" class="card-close"
																				data-toggle="close"><i
																					class="card-icon card-icon-close"></i></a></li>
																		</ul>

																	</div>
																</div>
																<div class="card-body">

																	<table
																		class="table display table-hover demo-table-search table-responsive-block nowrap "
																		id="tableWithSearch2" style="width: 100%">
																		<thead>
																			<tr>
																				<th></th>
																				<th><i class="pg-calender"></i> Date and time</th>
																				<th><i class="pg-credit_card_line"></i> Numero
																					Carte</th>
																				<th><i class="fa fa-eject"></i> Etat carte</th>
																				<th><i class="pg-layouts3"></i> Montant</th>
																				<th><i class="fa fa-hand-lizard-o"></i> Etat
																					cashe</th>
																				<th><i class="fa fa-sort-numeric-desc"></i>
																					Numero <br>authorisation</th>
																				<th><i class="fa fa-info"></i> remarque</th>
																			</tr>

																		</thead>
																		<tbody>


																			<c:forEach items="${ListTransactionAfterFiltring}"
																				var="transaction">
																				<tr data-child-value1="${transaction.cassette1}"
																					data-child-value2="${transaction.cassette2}"
																					data-child-value3="${transaction.cassette3}"
																					data-child-value4="${transaction.cassette4}">

																					<td class="v-align-middle details-control"><c:if
																							test="${transaction.montant != 0}">
																							<i class="fa fa-plus-circle"
																								style="color: green;"></i>
																						</c:if></td>
																					<td class="v-align-middle semi-bold">
																						${transaction.debuttransactionDate}
																						${transaction.heuredebut} <br>
																						${transaction.fintransactionDate}
																						${transaction.heurefin}
																					</td>
																					<td class="v-align-middle">${transaction.numerocarte}</td>
																					<td class="v-align-middle">${transaction.etatcarte}</td>
																					<td class="v-align-middle"><p>${transaction.montant}</p></td>
																					<td class="v-align-middle"><p>${transaction.etatcash}</p></td>
																					<td class="v-align-middle" width="30%">${transaction.nauthorisation}</td>
																					<td class="v-align-middle">${transaction.remarque}</td>

																				</tr>

																			</c:forEach>

																		</tbody>
																		<tfoot>
																			<tr>
																				<th>Total</th>
																				<th></th>
																				<th></th>
																				<th></th>
																				<th>xxxx</th>
																				<th></th>
																				<th></th>
																				<th></th>

																			</tr>


																		</tfoot>


																	</table>
																	<!-- *************** -->
																	<!--    container 2 Resultat  -->
																	<!-- *************** -->


																</div>
															</div>
														</div>


													</div>

												</div>


											</div>
										</div>
									</div>

									<!-- Fin carde  -->


								</div>
							</div>
						</div>
					</c:if>

				</div>

				<jsp:include page="../view/fragments/footer.jsp"></jsp:include>
			</div>





		</div>






	</div>






	<script type="text/javascript">
		$(function() {
			$("#branch").select2();
			$("#atm").select2();
			$("#erreurTransaction").select2();
			/* BOOTSTRAP SLIDER */

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

		$(function() {

			$(document)
					.ready(
							function() {
								$('#tableWithSearch2')
										.DataTable(
												{
													"sDom" : "<'exportOptions2'T><'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>>"
															+ "<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "
															+ "<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "
															+ "<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "
															+ " <'row'<'col-sm-12 col-md-2'l><'col-sm-12 col-md-10'f>> <'table-responsive't>  "
															+ "<'row'<'col-sm-12 col-md-2'i><'col-sm-12 col-md-10'p>>",

													"fixedHeader" : true,

													"sPaginationType" : "bootstrap",
													"destroy" : true,
													"bPaginate" : true,
													"lengthMenu" : [
															[ 5, 10, 25, 50, -1 ],
															[ 5, 10, 25, 50,
																	"All" ] ],
													"oLanguage" : {

														"sInfo" : "transaction resultat "
													},

													"oTableTools" : {
														"sSwfPath" : '<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/swf/copy_csv_xls_pdf.swf"/>',

														"aButtons" : [
																{
																	"sExtends" : "csv",
																	"sButtonText" : "<i class='pg-grid'></i>",
																},
																{
																	"sExtends" : "xls",
																	"sButtonText" : "<i class='fa fa-file-excel-o'></i>",
																},
																{
																	"sExtends" : "pdf",
																	"sButtonText" : "<i class='fa fa-file-pdf-o'></i>",
																},
																{
																	"sExtends" : "copy",
																	"sButtonText" : "<i class='fa fa-copy'></i>",
																} ]
													},

													fnDrawCallback : function(
															oSettings) {

														$(
																'.export-options-container2')
																.append(
																		$('.exportOptions2')); // Append the buttons to container export-options-container2 in the DOM

														// In the DOM you'll find something like: <a id="ToolTables_historyDataTable_XXXXX" class="btn btn-white DTTT_button_csv" data-original-title="" title=">

													}

												});
							});

			var elems = Array.prototype.slice.call(document
					.querySelectorAll('#AmountHandler'));

			elems.forEach(function(html) {
				var switchery = new Switchery(html);
			});

			$('#dateAndTimeTransaction')
					.daterangepicker(
							{
								"showDropdowns" : true,
								"timePicker" : true,
								"timePicker24Hour" : true,
								"timePickerSeconds" : true,

								"autoApply" : false,
								ranges : {

									'<spring:message code="label.yesterday"/>' : [
											moment().subtract(1, 'days'),
											moment().subtract(1, 'days') ],
									'<spring:message code="label.Last7Days"/>' : [
											moment().subtract(6, 'days'),
											moment() ],
									'<spring:message code="label.Last30Days"/>' : [
											moment().subtract(29, 'days'),
											moment() ],
									'<spring:message code="label.ThisMonth"/>' : [
											moment().startOf('month'),
											moment().endOf('month') ],
									'<spring:message code="label.LastMonth"/>' : [
											moment().subtract(1, 'month')
													.startOf('month'),
											moment().subtract(1, 'month')
													.endOf('month') ]
								},
								"locale" : {
									"format" : 'YYYY-MM-DD HH:MM:SS',
									"separator" : " - ",
									"applyLabel" : "Apply",
									"cancelLabel" : "Cancel",
									"fromLabel" : "From",
									"toLabel" : "To",
									"cancelLabel" : 'Clear',
									"customRangeLabel" : "<spring:message code="label.Custom"/>",
									"weekLabel" : "W",
									"daysOfWeek" : [ "Sa", "Su", "Mo", "Tu",
											"We", "Th", "Fr"

									],
									"monthNames" : [
											"<spring:message code="label.January"/>",
											"<spring:message code="label.February"/>",
											"<spring:message code="label.March"/>",
											"<spring:message code="label.April"/>",
											"<spring:message code="label.May"/>",
											"<spring:message code="label.June"/>",
											"<spring:message code="label.July"/>",
											"<spring:message code="label.August"/>",
											"<spring:message code="label.September"/>",
											"<spring:message code="label.October"/>",
											"<spring:message code="label.November"/>",
											"<spring:message code="label.December"/>" ],
									"firstDay" : 1,

								},

								"opens" : "right"
							},
							function(start, end, label) {
								console.log('New date range selected: '
										+ start.format('YYYY-MM-DD hh:mm:ss')
										+ ' to '
										+ end.format('YYYY-MM-DD hh:mm:ss')
										+ ' (predefined range: ' + label + ')');
							});

			$('#dateAndTimeTransaction')
					.on(
							'apply.daterangepicker',
							function(ev, picker) {
								$(this)
										.val(
												picker.startDate
														.format('YYYY-MM-DD HH:MM:SS')
														+ ' - '
														+ picker.endDate
																.format('YYYY-MM-DD HH:MM:SS'));
								$('#DebuttransactionDate').val(
										picker.startDate.format('YYYY-MM-DD'));
								$('#fintransactionDate').val(
										picker.endDate.format('YYYY-MM-DD'));
								$('#heuredebut').val(
										picker.startDate.format('HH:MM:SS'));
								$('#heurefin').val(
										picker.endDate.format('HH:MM:SS'));

							});

			$('#dateAndTimeTransaction').on('cancel.daterangepicker',
					function(ev, picker) {
						$(this).val('');
					});

		});

		function format(value1, value2, value3, value4) {
			return ' <table class="table table-hover table-condensed nowrap no-footer" > <tr> '
					+ '<th>Cassette1</th>'
					+ '<th>Cassette2</th>'
					+ '<th>Cassette3</th>'
					+ '<th>Cassette4</th>'
					+ '</tr>'
					+ '<tr>'
					+ '<td class="v-align-middle">'
					+ value1
					+ '</td>'
					+ '<td class="v-align-middle">'
					+ value2
					+ '</td>'
					+ '<td class="v-align-middle">'
					+ value3
					+ '</td>'
					+ '<td class="v-align-middle">'
					+ value4
					+ '</td>'
					+ '</tr>' + '</table>';
		}

		$(document)
				.ready(
						function() {
							var table = $('#tableWithSearch2').DataTable({});

							// Add event listener for opening and closing details
							$('#tableWithSearch2')
									.on(
											'click',
											'td.details-control',
											function() {
												var tr = $(this).closest('tr');
												var row = table.row(tr);

												if (row.child.isShown()) {
													// This row is already open - close it
													row.child.hide();
													tr.removeClass('shown');
													tr
															.find('i')
															.attr('class',
																	'fa fa-plus-circle');
													tr.find('i').attr('style',
															'color:green; ');

												} else {
													// Open this row
													row
															.child(
																	format(
																			tr
																					.data('child-value1'),
																			tr
																					.data('child-value2'),
																			tr
																					.data('child-value3'),
																			tr
																					.data('child-value4')))
															.show();

													tr.addClass('shown');
													tr
															.find('i')
															.attr('class',
																	'fa fa-minus-circle ');
													tr.find('i').attr('style',
															'color:red; ');

												}
											});

							$('#tableWithSearch2 tbody').on(
									'click',
									'tr',
									function() {
										if ($(this).hasClass('selected')) {
											$(this).removeClass('selected');
										} else {
											table.$('tr.selected').removeClass(
													'selected');
											$(this).addClass('selected');
										}
									});
						});

		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && ((charCode < 48) || (charCode > 57)))
				return false;
			return true;
		};
	</script>

</body>
</html>