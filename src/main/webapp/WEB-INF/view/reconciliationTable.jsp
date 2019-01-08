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



 <style>
 
.table tbody tr td {
padding :10px;

}
</style>
 
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
														<span class="input-group-text primary"><i class="fa fa-search"></i>
														</span>
														</div>
													
														<input type="text" id="search-table"
															class="form-control pull-right fs-12 input-lg" placeholder="transaction journal">
															</div>
													</div>
													
													 
												 
													 
												</div>
												
												</div>
												<div class="row">
												<div class="col-md-2">
												<div class="pull-left export-options-container ">
													
													</div>
                                                      <div class="pull-right lenght-options-container">
													  
													 </div>
													 </div>
													 
													 
											   </div>
													 
													 
												<div class="row">
												 
                                                <div class="col-md-12">
													 
													 
													 
													<div >
									              <div class="btn-toolbar flex-wrap" role="toolbar">
										<div class="btn-group sm-m-t-10">
											<button type="button" class="btn btn-default">
											<span
													class="fs-11 font-montserrat text-uppercase">LAST Parse</span>
												<i class="fa fa-upload"></i>
											</button>
											<button type="button" class="btn btn-default ">
											<span
													class="fs-11 font-montserrat text-uppercase">LAST DAY</span>
												<i class="fa fa-history"></i>
											</button>
											<button type="button" class="btn btn-default">
											<span
													class="fs-11 font-montserrat text-uppercase">LAST WEEK</span>
												<i class="fa fa-calendar"></i>
											</button>
											<button type="button" class="btn btn-default">
											<span
													class="fs-11 font-montserrat text-uppercase">LAST MONTH</span>
												<i class="fa fa-calendar-o"> </i>
											</button>
										</div>
										 
										 
									</div>
									<br>
									<div class="btn-toolbar flex-wrap" role="toolbar">
										<div class="btn-group sm-m-t-10">
											<button type="button" class="btn btn-default">
											<span
													class="fs-11 font-montserrat text-uppercase">Manuel</span>
												<i class="fa fa-wrench"></i>
											</button>
											<button type="button" class="btn btn-default  ">
											<span
													class="fs-11 font-montserrat text-uppercase">WithDrwael</span>
												<i class="fa fa-money"></i>
											</button>
											<button type="button" class="btn btn-default">
											<span
													class="fs-11 font-montserrat text-uppercase">Only on Journal</span>
												<i class="fa fa-file"></i>
											</button>
											<button type="button" class="btn btn-default">
											<span
													class="fs-11 font-montserrat text-uppercase">Only on Host</span>
												<i class="fa fa-server"> </i>
											</button>
										</div>
										 
										 
									</div>

								</div>
													 
												 
													 
												</div>
												
												</div>
												

					<div class="card card-transparent">
						<div class="card-header ">
							<!-- <div class="card-title">Pages Default Tables Style</div>  -->
						</div>
						<div class="card-body no-margin no-padding">
							<div class="table-responsive no-margin no-padding">
								<table class="table table-hover demo-table-search table-sm " id="basicTable">
									<thead>
										<tr class="text-center">
                                             

                                                                 <th class="v-align-middle text-primary bold fs-18 " colspan="4">
																	<h4 class="text-primary"><i class="fa fa-file-o" aria-hidden="true"></i> Journal</h4> 	 
																 </th> 

																 <th class="v-align-middle text-complete bold fs-18 " colspan="4">
																	 <h4 class="text-complete"><i class="fa fa-server" aria-hidden="true"></i> Host File </h4>
																 </th> 
																
																 <th class="v-align-middle text-success bold  fs-18" colspan="5">
																	 
																  <h4 class="text-success"><i class="fa fa-check-square-o" aria-hidden="true"></i> Reconciliation </h4>
																 </th>

										</tr>
										
										
										
										<tr >
											
											<th   class=" text-primary  ">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											
											<th   class=" text-primary  ">
											<i class="fa fa-credit-card-alt" aria-hidden="true"></i><br>CARD</th>
											
											<th   class="  text-primary  " >
											<i class="fa fa-money" aria-hidden="true"></i><br>AMOUNT</th>
											
											<th   class=" text-primary b-r b-dashed ">
											<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i><br>AUTH</th>
											
											  
											 
											<th   class="  text-complete  ">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											
											<th  class="  text-complete  ">
											<i class="fa fa-credit-card-alt" aria-hidden="true"></i><br>CARD</th>
											
											<th   class=" text-complete  " >
											<i class="fa fa-money" aria-hidden="true"></i><br>AMOUNT</th>
											
											<th  class="  text-complete  b-r b-dashed ">
											<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i><br>AUTH</th>
											
											 
											 
											<th  class="  text-success  ">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											
											<th   class="  text-success  " >
											<i class="fa fa-wrench" aria-hidden="true"></i> <br> TYPE</th>
											 
											  
											
											<th   class=" text-success  " >
											<i class="fa fa-search-plus  " aria-hidden="true"></i></th> 
										    </tr>
										
										
										
										
									</thead>
									<tbody>
										
										
											<c:forEach var="trxPlusTrxHost"
																items="${ListTransactionAndTransactionHostReconcilied}">
																
																
										<tr class="">
											 
											<td class="    text-danger bold">
												<p> ${trxPlusTrxHost[1].transactionDateHost } ${trxPlusTrxHost[1].transactionHostTime } </p>
											</td>
											<td class="   text-complete bold">
												<p> ${trxPlusTrxHost[1].cardNumber}  </p>
											</td>
											<td class="v-align-middle  ">
												<p> ${trxPlusTrxHost[1].transactionHostAmount} </p>
											</td>
											<td class="v-align-middle text-primary b-r b-dashed ">
												<p> ${trxPlusTrxHost[1].UTRNNO} </p>
											</td>
											 
										 
											<td class="v-align-middle  text-danger bold">
												<p>  ${trxPlusTrxHost[2].transactionHostDate}  ${trxPlusTrxHost[2].transactionHostTime}</p>
											</td>
											<td class="v-align-middle text-complete bold">
												<p> ${trxPlusTrxHost[2].transactionHostCradNumber}</p>
											</td>
											<td class="v-align-middle  ">
												<p id="roundAmount"> ${trxPlusTrxHost[2].transactionHostAmount} </p>
											</td>
											<td class="v-align-middle text-complete b-r b-dashed ">
												<p id="roundAuthorization"> ${trxPlusTrxHost[2].transactionHostAuthorization} </p>
											</td>
											 
											 
											<td class="v-align-middle ">
												<p> ${trxPlusTrxHost[0].dateReconciliation} </p>
											</td>
											<td class="v-align-middle  ">
												<p> ${trxPlusTrxHost[0].typeReconciliation}</p>
											</td>
											
											 
											
											
											<td class="v-align-middle  ">
												<p>        <button class="btn btn-success btn-xs" data-toggle="modal"
																  data-target="#modalFillIn"
																   data-id="${trxPlusTrxHost[1].idtransaction}" 
																  data-id3="${trxPlusTrxHost[0].idReconciliation}"
																  data-id1="${trxPlusTrxHost[2].idTransactionHost}"  > 

																	<i class="fa fa-info-circle " aria-hidden="true"></i>
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
 
	<div class="modal  fade slide-up no-margin no-padding" id="modalFillIn" tabindex="-1"
		role="dialog" aria-hidden="true">
		                  
							 
		<div class="modal-dialog modal-lg  ">
			<div class="modal-content">
				<div class="modal-header">
				
				      <button type="button" class="close" data-dismiss="modal" >
							<i class="fa fa-times-circle text-danger" aria-hidden="true" ></i>
						</button>
				
					 
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12 ">
							 
							 <div class="form-group-attached">
							 <h5 class="text-left p-b-5">
				     		<span class="semi-bold text-primary"><i class="fa fa-file-o" aria-hidden="true"></i> Transaction Journal</span> 
					       </h5>
					
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
							 
							 
						</div>
						 
					</div>
					
					
					<h5 class="text-left p-b-5">
						<span class="semi-bold text-complete "><i class="fa fa-server" aria-hidden="true"></i> Transaction Host</span> 
					</h5>
					
					<div class="row">
						<div class="col-lg-12 ">
							 
							 <div class="form-group-attached">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-server text-complete" aria-hidden="true"></i> Host File</label> <input type="email"
												class="form-control text-info bold fs-15" disabled="disabled" id="hostFileName">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-cloud-upload text-complete" aria-hidden="true"></i> Date Uploded</label> <input type="email"
												class="form-control text-info bold fs-15" disabled="disabled" id="hostFileDateUpload">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-calendar-o text-complete"
												aria-hidden="true"></i> TRANSACTION HOST DATE</label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostDate"> 
										</div>
									</div>
									<div class="col-md-6"> 
									
										<div class="form-group form-group-default">
											<label><i class="fa fa-clock-o text-complete" aria-hidden="true"></i> TRANSACTION HOST TIME</label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostTime">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-money text-complete " aria-hidden="true"></i> AMOUNT</label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostAmount">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-sort-numeric-desc text-complete " aria-hidden="true"></i> Authorization</label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostAuthorization">
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-group form-group-default">
											<label><i class="fa fa-exchange text-complete" aria-hidden="true"></i> Transaction TYPE </label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostType">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-2">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-building text-complete " aria-hidden="true"></i>Bank</label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="transactionBankAcquire">
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-group form-group-default">
											<label><i class="fa fa-thumb-tack text-complete " aria-hidden="true"></i> Branch</label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="transactionBranchAcquire">
										</div>
									</div>
									<div class="col-md-5">
										<div class="form-group form-group-default">
											<label><i class="fa fa-credit-card text-complete " aria-hidden="true"></i> Card number </label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="transactionHostCradNumber">
										</div>
									</div>
								</div>
								 
							</div>
							 
							 
						</div>
						 
					</div>
					<h5 class="text-left p-b-5">
						<span class="semi-bold text-success"><i class="fa fa-check-square-o" aria-hidden="true"></i> Reconciliation infos</span> 
					</h5>
					
					<div class="row">
						<div class="col-lg-12 ">
							 
							 <div class="form-group-attached">
								<div class="row">

									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-calendar-o" aria-hidden="true"></i>
												Date and Time</label> <input type="text"
												class="form-control text-success fs-16 bold text-center"
												disabled="disabled" id="dateAndTimeReconciliation">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-calendar-o"
												aria-hidden="true"></i> Type 
											</label> <input type="text"
												class="form-control text-success fs-16 bold text-center"
												disabled="disabled" id="TypeReconciliation">
										</div>
									</div>
								</div>
								<div class="row">

									<div class="col-md-3">
										<div class="form-group form-group-default">
											<label><i class="fa fa-file-o "></i> Jouranl File</label> <input
												type="text" class="form-control text-success fs-16 bold"
												disabled="disabled" id="journalFile">
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-server"></i> Host File</label> <input
												type="text" class="form-control text-success fs-16 bold"
												disabled="disabled" id="hostFile">
										</div>
									</div>

									<div class="col-md-5">
										<div class="form-group form-group-default">
											<label><i class="fa fa-user-o" aria-hidden="true"></i>
												ATM</label> <input type="text"
												class="form-control text-success fs-16 bold"
												disabled="disabled" id="user" data-toggle="tooltip" data-place >
										</div>
									</div>

								</div>
								 

								 

							</div>
							 
							 
						</div>
						 
					</div>
					 
				</div>
				<div class="modal-footer">
				
				
				
				
				
				
				
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
	
	
	
	$('#modalFillIn')
	.modal({
		keyboard : true,
		backdrop : "static",
		show : false,

	})
	.on('shown.bs.modal',
			function(event)

			{    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		         //////////////////////////////////////////////////// Transaction Host ///////////////////////////////////////////////////////
		         ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				var $button = $(event.target);
				var idTransactionHostAjax = event.relatedTarget.getAttribute('data-id1');
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
				
				
				 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		         //////////////////////////////////////////////////// Transaction       ///////////////////////////////////////////////////////
		         ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		                 var $button = $(event.target);
						 var idTransactionAjax = event.relatedTarget.getAttribute('data-id');
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
				 
				 
				 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		         //////////////////////////////////////////////////// Recon       ////////////////////////////////////////////////////////////
		         ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		         
		         
		         
				var $button = $(event.target);
				 var idreconciliationAjax = event.relatedTarget.getAttribute('data-id3');
				  console.log(idreconciliationAjax);
        
		$
		.ajax({
			url : '${pageContext.request.contextPath}/getreconciliation-'
					+ idreconciliationAjax + '',
			method : 'GET',
			contentType : "application/json",
			timeout : 600000,
			success : function(data) 
			{
				var ReconciliationDate = new Date(data.dateReconciliation).toLocaleDateString();
				var FinishDate = new Date(data.finishingDate).toLocaleDateString();

				$('#hostFile').val(data.hostFile );
				$('#journalFile').val(data.jrnFile );
				$('#user').val("ADMIN" );
				$('#TypeReconciliation').val(data.typeReconciliation);
				$('#dateAndTimeReconciliation').val(ReconciliationDate);
				
				 

			 

			},

			error : function(xhr, status, error) {

			}
		});
				
				
			});
	
	
	
	 
 
	
	
	
	
	
	$('#basicTable').DataTable();
	 
 

	var table = $('#basicTable');
 

	var settings = {
		"sDom" : " <'row'<'lenght-options-container'Tl>> <'row'> <'table-responsive't><'row'<p i>>",
		"sPaginationType" : "bootstrap",
		"destroy" : true,
		
		
		"select": {
	        style: 'single'
	    },
		"fixedHeader": {
	        header: true,
	        footer: false
	    },
	    
	    
	     
		
		
		

		"scrollCollapse" : true,
		"oLanguage" : {
			"sLengthMenu" : "_MENU_ ",
			"sInfo" : "Showing <b>_START_ to _END_</b> Transaction reconcilied of _TOTAL_ Transactions"
		},
		"aLengthMenu" : [
				[ 5, 10, 25, 50, -1 ],
				[ "5 Transaction ", "10 Transaction ", "25 Transaction", "50 Transaction",
						"All" ] ],

		"iDisplayLength" : 5,
		"bAutoWidth" : false,

		"oTableTools" : {
			"sSwfPath" : "<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/swf/copy_csv_xls_pdf.swf"/>",
			"aButtons" : [
					{
						"sExtends" : "csv",
						"sButtonText" : "<i class='pg-grid text-primary'></i>",
					},
					{
						"sExtends" : "xls",
						"sButtonText" : "<i class='fa fa-file-excel-o text-primary'></i>",
					},
					{
						"sExtends" : "pdf",
						"sButtonText" : "<i class='fa fa-file-pdf-o text-primary'></i>",
					},
					{
						"sExtends" : "copy",
						"sButtonText" : "<i class='fa fa-copy text-primary'></i>",
					} ]
		},
		fnDrawCallback : function(oSettings) {
			$('.export-options-container').append($('.exportOptions'));
		},
 
		
		 
	};

	table.dataTable(settings);
	
	
	$('#search-table').keyup(function() {
		table.fnFilter($(this).val());
	});
	
	$('.basicTable_length').removeClass('input-sm');
	</script>
	
       </body> 
</html>