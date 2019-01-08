<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/jquery-confirm.min.css"/>" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-datatable/media/css/dataTables.bootstrap.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/FixedColumns/css/dataTables.fixedColumns.min.css"/>"
	type="text/css" />
<link media="screen" rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/datatables-responsive/css/datatables.responsive.css"/>"
	type="text/css" />



 
 
</head>

 
     
    
    
    <body class="fixed-header windows desktop pace-done">
     
    <jsp:include page="../view/fragments/menu.jsp"></jsp:include>    
    
         
     <div class="page-container ">
         <jsp:include page="../view/fragments/header.jsp"></jsp:include> 


			<div class="page-content-wrapper content-builder active full-height" id="plainContent">
			<div class="page-content-wrapper ">
						<div class="content">
						
								<div class=" container-fluid   container-fixed-lg">
											<ul class="breadcrumb p-l-0">
											<li class="breadcrumb-item"><a href="#">
                                            <i class="fa fa-check-square-o" aria-hidden="true"></i> reconciliation</a>
											</li>
											<li class="breadcrumb-item active"> <i class="fa fa-exchange" aria-hidden="true"></i> Transaction Reconcilied
											</li>
											</ul>
								
								            <h3 class="page-title text-primary"><i class="fa fa-flag-checkered" aria-hidden="true"></i> Reconcilied transaction table </h3>
								</div>




				<div class=" container-fluid   container-fixed-lg bg-white">
				                               
				                               <br>
				 
				                               <div class="row">

                                                <div class="col-md-12">
													<div class="pull-right">
													<div class="input-group transparent">
													<div class="input-group-prepend">
														<span class="input-group-text primary"><i class="fa fa-server"></i>
														</span>
														</div>
													
														<input type="text" id="search-table"
															class="form-control pull-right fs-12 input-lg" placeholder="transaction journal">
															</div>
													</div>
													 
												 
													<div class="clearfix"></div>
												</div>
												
												</div>
												

					<div class="card card-transparent">
						<div class="card-header ">
							<div class="card-title">Pages Default Tables Style</div>
						</div>
						<div class="card-body no-margin no-padding">
							<div class="table-responsive no-margin no-padding">
								<table class="table table-hover no-margin no-padding" id="basicTable">
									<thead>
										<tr class="text-center">
                                             

                                                                 <th class="v-align-middle text-primary bold fs-18 " colspan="6">
																	<h4 class="text-primary"><i class="fa fa-file-o" aria-hidden="true"></i> Journal</h4> 	 
																 </th> 

																 <th class="v-align-middle text-complete bold fs-18 " colspan="6">
																	 <h4 class="text-complete"><i class="fa fa-server" aria-hidden="true"></i> Host File </h4>
																 </th> 
																
																 <th class="v-align-middle text-success bold  fs-18" colspan="3">
																	 
																  <h4 class="text-success"><i class="fa fa-check-square-o" aria-hidden="true"></i> Reconciliation </h4>
																 </th>

										</tr>
									</thead>
									<tbody>
										<tr class="text-center">
											<th style="width: 10%" class="text-center text-primary">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											<th style="width: 10%" class="text-center text-primary">
											<i class="fa fa-credit-card-alt" aria-hidden="true"></i><br>CARD</th>
											<th style="width: 10%" class="text-center text-primary" >
											<i class="fa fa-money" aria-hidden="true"></i><br>AMOUNT</th>
											<th style="width: 10%" class="text-center text-primary">
											<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i><br>AUTH</th>
											<th style="width: 5%" class="text-center text-primary">
											<i class="fa fa-eye fa-3x " aria-hidden="true"></i></th>
											<th class="bg-primary" style="width: 0.1% ; padding :-0.25rem"></th>
											<th style="width: 10%" class="text-center text-complete">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											<th style="width: 10%" class="text-center text-complete">
											<i class="fa fa-credit-card-alt" aria-hidden="true"></i><br>CARD</th>
											<th style="width: 10%" class="text-center text-complete" >
											<i class="fa fa-money" aria-hidden="true"></i><br>AMOUNT</th>
											<th style="width: 10%" class="text-center text-complete">
											<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i><br>AUTH</th>
											<th style="width: 5%" class="text-center text-complete">
											<i class="fa fa-eye fa-3x " aria-hidden="true"></i></th>
											<th class="bg-complete" style="width: 0.1%"></th>
											<th style="width: 10%" class="text-center text-success">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											<th style="width: 10%" class="text-center text-success" >
											<i class="fa fa-wrench" aria-hidden="true"></i> <br> TYPE</th>
											<th style="width: 5%" class="text-center text-success" >
											<i class="fa fa-search-plus fa-3x " aria-hidden="true"></i></th> 
										</tr>
										
											<c:forEach var="trxPlusTrxHost"
																items="${ListTransactionAndTransactionHostReconcilied}">
																
																
										<tr class="text-center">
											 
											<td class="v-align-middle ">
												<p> ${trxPlusTrxHost[1].transactionDateHost } ${trxPlusTrxHost[1].transactionHostTime } </p>
											</td>
											<td class="v-align-middle ">
												<p> ${trxPlusTrxHost[1].cardNumber}  </p>
											</td>
											<td class="v-align-middle ">
												<p> ${trxPlusTrxHost[1].transactionHostAmount} </p>
											</td>
											<td class="v-align-middle ">
												<p> ${trxPlusTrxHost[1].UTRNNO} </p>
											</td>
											<td class="v-align-middle ">
												<p> 
												 <button class="btn btn-primary btn-xs" data-toggle="modal"
																				data-target="#modalDetailsTransaction" data-id="${trxPlusTrxHost[1].idtransaction}"> 

																					<i class="fa fa-exchange fa-2x" aria-hidden="true"></i>
												</button>
												
												
												</p>
											</td>
											<th class="bg-primary" style="width: 0.1%"></th>
											<td class="v-align-middle ">
												<p>  ${trxPlusTrxHost[2].transactionHostDate}  ${trxPlusTrxHost[2].transactionHostTime}</p>
											</td>
											<td class="v-align-middle ">
												<p> ${trxPlusTrxHost[2].transactionHostCradNumber}</p>
											</td>
											<td class="v-align-middle ">
												<p id="roundAmount"> ${trxPlusTrxHost[2].transactionHostAmount} </p>
											</td>
											<td class="v-align-middle ">
												<p id="roundAuthorization"> ${trxPlusTrxHost[2].transactionHostAuthorization} </p>
											</td>
											<td class="v-align-middle ">
												        <p>   <button class="btn btn-primary btn-xs" data-toggle="modal"
																  data-target="#modalHostInfos" data-id="${trxPlusTrxHost[2].idTransactionHost}"> 

																	<i class="fa fa-server fa-2x" aria-hidden="true"></i>
																</button>  </p>
											</td>
											<th class="bg-complete" style="width: 0.1% "></th>
											<td class="v-align-middle ">
												<p> ${trxPlusTrxHost[0].dateReconciliation} </p>
											</td>
											<td class="v-align-middle ">
												<p> ${trxPlusTrxHost[0].typeReconciliation}</p>
											</td>
											<td class="v-align-middle ">
												<p>        <button class="btn btn-success btn-xs" data-toggle="modal"
																  data-target="#modalReconInfos" data-id="${trxPlusTrxHost[0].idReconciliation}"> 

																	<i class="fa fa-info-circle fa-2x" aria-hidden="true"></i>
																</button>
																
																 </p>
											</td>
											 
											 
											 
											 
										</tr>
										 
										 </c:forEach>
										 
										 
									</tbody>
								</table>
								<br>
							</div>
							<br>
						</div>
						<br>
					</div>



				</div>




				
			</div>	
			<jsp:include page="../view/fragments/footer.jsp"></jsp:include> 
			</div>
			
			</div>
			
			
			
			
			    
			   
			</div>
 
    
    <div class="modal fade slide-up disable-scroll" id="modalHostInfos"
		tabindex="-1" role="dialog" aria-hidden="false">
		<div class="modal-dialog ">
			<div class="modal-content-wrapper">
				<div class="modal-content">
					<div class="modal-header clearfix text-left">
						<button type="button" class="close" data-dismiss="modal" data-toggle="tooltip" data-placement="left" title="Tooltip on left"
							aria-hidden="true">
							<i class="fa fa-times-circle text-danger" aria-hidden="true" ></i>
						</button>
						<h5 class="text-primary bold">
							<i class="fa fa-server" aria-hidden="true"></i> TRANSACTION HOST <span class="semi-bold">DETAILS</span>
						</h5>

					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group-attached">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-server text-primary" aria-hidden="true"></i> Host File</label> <input type="email"
												class="form-control text-info bold fs-15" disabled="disabled" id="hostFileName">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-cloud-upload text-primary" aria-hidden="true"></i> Date Uploded</label> <input type="email"
												class="form-control text-info bold fs-15" disabled="disabled" id="hostFileDateUpload">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-calendar-o text-primary"
												aria-hidden="true"></i> TRANSACTION HOST DATE</label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostDate"> 
										</div>
									</div>
									<div class="col-md-6"> 
									
										<div class="form-group form-group-default">
											<label><i class="fa fa-clock-o text-primary" aria-hidden="true"></i> TRANSACTION HOST TIME</label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostTime">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-money text-primary " aria-hidden="true"></i> AMOUNT</label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostAmount">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-sort-numeric-desc text-primary " aria-hidden="true"></i> Authorization</label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostAuthorization">
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-group form-group-default">
											<label><i class="fa fa-exchange text-primary" aria-hidden="true"></i> Transaction TYPE </label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostType">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-building text-primary " aria-hidden="true"></i>Bank</label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="transactionBankAcquire">
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-group form-group-default">
											<label><i class="fa fa-thumb-tack text-primary " aria-hidden="true"></i> Branch</label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="transactionBranchAcquire">
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-group form-group-default">
											<label><i class="fa fa-credit-card text-primary " aria-hidden="true"></i> Card number </label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostCradNumber">
										</div>
									</div>
								</div>
								 
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
    
    
    
    
    
    <div class="modal fade slide-up disable-scroll"
		id="modalDetailsTransaction" tabindex="-1" role="dialog"
		aria-hidden="false">
		<div class="modal-dialog ">
			<div class="modal-content-wrapper">
				<div class="modal-content">
					<div class="modal-header clearfix text-center ">
						<button type="button" class="close" data-dismiss="modal" data-toggle="tooltip" data-placement="left" title="Close"
							aria-hidden="true">
							<i class="fa fa-times-circle text-danger" aria-hidden="true" ></i>
						</button>
						<h5 class="text-primary bold">
							<i class='fa fa-exchange' aria-hidden='true'></i> Transaction journal <span
								class="semi-bold text-primary">Details</span>
						</h5>

					</div>

					<div class="modal-body">
						<form role="form">
							<div class="form-group-attached">
								<div class="row">

									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-calendar-o" aria-hidden="true"></i>
												Starting Date and Time</label> <input type="text"
												class="form-control text-primary fs-16 bold text-center"
												disabled="disabled" id="startingDateAndTimeModal">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-calendar-o"
												aria-hidden="true"></i> Finishing date and time
											</label> <input type="text"
												class="form-control text-primary fs-16 bold text-center"
												disabled="disabled" id="finishingDateAndTimeModal">
										</div>
									</div>
								</div>
								<div class="row">

									<div class="col-md-3">
										<div class="form-group form-group-default">
											<label><i class="fa fa fa-link "></i>Vendor</label> <input
												type="text" class="form-control text-primary fs-16 bold"
												disabled="disabled" id="vendorModal">
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-thumb-tack"></i> Branch</label> <input
												type="text" class="form-control text-primary fs-16 bold"
												disabled="disabled" id="branchModal">
										</div>
									</div>

									<div class="col-md-5">
										<div class="form-group form-group-default">
											<label><i class="fa fa-microchip" aria-hidden="true"></i>
												ATM</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="atmModal" data-toggle="tooltip" data-place >
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-8">
										<div class="form-group form-group-default">
											<label><i class="fa fa-credit-card-alt "></i> Card
												Number</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="cardNumberModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-info" aria-hidden="true"></i>
												Card status</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="cardStatusModal">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-money "></i> Amount</label> <input
												type="text" class="form-control text-primary fs-16 bold"
												disabled="disabled" id="amountModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-info" aria-hidden="true"></i>
												Cash presented</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="cashPresentedModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-hand-lizard-o"
												aria-hidden="true"></i> Cash Taken
											</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="cashTakenModal">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-info-circle"
												aria-hidden="true"></i> Infos </label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="infosModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-exchange" aria-hidden="true"></i>
												Type
											</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="typeTransactionModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-exclamation-triangle"
												aria-hidden="true"></i> Error </label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="errorTransactionModal">
										</div>
									</div>
								</div>

							</div>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
    
    
    
    
    
    
    
    
    
    
    <script src="<spring:url value="/resources/assets/js/card.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-datatable/media/js/jquery.dataTables.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/js/dataTables.tableTools.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-datatable/media/js/dataTables.bootstrap.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/Bootstrap/jquery-datatable-bootstrap.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/datatables-responsive/js/datatables.responsive.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/datatables-responsive/js/lodash.min.js"/>"></script>
	<script src="<spring:url value="/resources/assets/js/tables.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/jquery-confirm.min.js"/>"></script>
	<script src="<spring:url value="/resources/pages/js/Datepair.js"/>"></script>
 
	<script type="text/javascript">
	
	
	
	$('#modalHostInfos')
	.modal({
		keyboard : true,
		backdrop : "static",
		show : false,

	})
	.on('shown.bs.modal',
			function(event)

			{
				var $button = $(event.target);
				var idTransactionHostAjax = event.relatedTarget.getAttribute('data-id');
				console.log(idTransactionHostAjax);

				$.ajax({
							url : '${pageContext.request.contextPath}/gettransactionHost-'
									+ idTransactionHostAjax + '',
							method : 'GET',
							contentType : "application/json",
							timeout : 600000,
							success : function(data) {
								
								var dateHost = new Date(data.transactionHostDate).toLocaleDateString();
								
								$('#hostFileName').val(data.hostFile.nameHostFile);
								var dateHostFileUpload = new Date(data.hostFile.dateUplaoded).toLocaleDateString();
								$('#hostFileDateUpload').val(dateHostFileUpload);
								
								$('#transactionHostDate').val( dateHost);
								$('#transactionHostTime').val(data.transactionHostTime);
							    var amount  = 	data.transactionHostAmount.replace(/^0+/, '')
								$('#transactionHostAmount').val(amount);
							    var authorization  = 	data.transactionHostAuthorization.replace(/^0+/, '')
								$('#transactionHostAuthorization').val(authorization);
								$('#transactionHostType').val(data.transactionHostType);
								$('#transactionBankAcquire').val(data.transactionBankAcquire);
								$('#transactionBranchAcquire').val(data.transactionBranchAcquire);
								$('#transactionHostCradNumber').val(data.transactionHostCradNumber);
							},

							error : function(xhr, status, error) {

							}
						});
			});
	
	
	
	 
	$('#modalDetailsTransaction')
			.modal({
				keyboard : true,
				backdrop : "static",
				show : false,

			})
			.on(
					'shown.bs.modal',
					function(event)

					{
						var $button = $(event.target);
						var idTransactionAjax = event.relatedTarget
								.getAttribute('data-id');
						console.log(idTransactionAjax);

						$
								.ajax({
									url : '${pageContext.request.contextPath}/gettransaction-'
											+ idTransactionAjax + '',
									method : 'GET',
									contentType : "application/json",
									timeout : 600000,
									success : function(data) {
										var StartDate = new Date(data.startingDate).toLocaleDateString();
										var FinishDate = new Date(data.finishingDate).toLocaleDateString();

										$('#startingDateAndTimeModal').val(StartDate+ '   '+ data.startingTime);
										$('#finishingDateAndTimeModal').val(FinishDate+ '   '+ data.finishingTime);
										$('#vendorModal').val();
										$('#branchModal').val();
										
										$('#atmModal').val(data.transactionHostATM);
										$('#cardNumberModal').val(data.cardNumber);

										if (data.cardTaken) {$('#cardStatusModal').val("TAKEN");

										} else {

											$('#cardStatusModal').val("no");

										}

										$('#amountModal').val(data.transactionHostAmount);

										if (data.cashPresented) {

											$('#cashPresentedModal').val("YES");

										} else {

											$('#cashPresentedModal').val("Not presented");

										}
										if (data.cashTaken) {
											$('#cashTakenModal').val("YES");

										} else {

											$('#cashTakenModal').val("not taken");

										}

										$('#infosModal').val(data.infosTransaction);
										$('#typeTransactionModal').val(data.transactionType);
										$('#errorTransactionModal').val(data.errorTransaction);

										console.log(data);

									},

									error : function(xhr, status, error) {

									}
								});
					});
	
	
	
	
	
	$('.demo-table-search').DataTable();
	 
 

	var table = $('.demo-table-search');
	var table2 = $('#tableWithSearch2');

	var settings = {
		"sDom" : " <'row'<l>>  <'table-responsive't><'row'<p i>>",
		"sPaginationType" : "bootstrap",
		"destroy" : true,

		"scrollCollapse" : true,
		"oLanguage" : {
			"sLengthMenu" : "_MENU_ ",
			"sInfo" : "Showing <b>_START_ to _END_</b> Transaction reconcilied of _TOTAL_ Transactions"
		},
		"aLengthMenu" : [
				[ 5, 10, 25, 50, -1 ],
				[ "5 entreis ", "10 entreis ", "25 entreis", "50 entreis",
						"All" ] ],

		"iDisplayLength" : 5,
		"bAutoWidth" : false,
		aoColumns : [ {
			sWidth : '10%'
		}, {
			sWidth : '5%'
		}, {
			sWidth : '10%'
		},{
			sWidth : '10%'
		}, {
			sWidth : '5%'
		},, {
			sWidth : '10%'
		}, {
			sWidth : '10%'
		}, {
			sWidth : '10%'
		}, {
			sWidth : '10%'
		}, {
			sWidth : '5%'
		}, {
			sWidth : '10%'
		}, {
			sWidth : '5%'
		}, {
			sWidth : '5%'
		} ]

		 
	};

	table.dataTable(settings);
	table2.dataTable(settings);
	$('#search-table2').keyup(function() {
		table.fnFilter($(this).val());
	});
	
	$('#search-table').keyup(function() {
		table2.fnFilter($(this).val());
	});
	
	
	</script>
	
       </body> 
</html>