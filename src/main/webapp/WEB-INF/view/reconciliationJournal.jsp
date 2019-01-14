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
			
			
			<div class="page-content-wrapper">
						<div class="content">
						
								<div class=" container-fluid   container-fixed-lg">
											<ul class="breadcrumb p-l-0">
											<li class="breadcrumb-item"><a href="#">
											<span class="fa-stack fa-lg">
											  <i class="fa fa-check-square-o fa-stack-1x"></i>
											  <i class="fa fa-ban fa-stack-2x text-danger"></i>
											</span> reconciliation</a>
											</li>
											<li class="breadcrumb-item active"> <i class="fa fa-chain-broken" aria-hidden="true"></i> Only in Journal File
											</li>
											</ul>
								
								            <h3 class="page-title text-primary"><i class="fa fa-exchange" aria-hidden="true"></i> Unreconciled transaction table retrived only in journal file  </h3>
								</div>
								
								
								<div class=" container-fluid   container-fixed-lg">
								
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
												
												<br>
												<br>
												
								<div class="card-body">
													<table
														class="table table-hover demo-table-search table-responsive-block table-sm"
														id="tableWithSearch">
														<thead>
															<tr class="text-center">
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-calendar-o fa-stack-1x"></i>
																</span><br> Date And Times
																
																</th> 
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <img
																		width="25" height="22"
																		src="<spring:url value="/resources/assets/img/atm.svg"/>">
																</span><br> ATM
																</th>  
																
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i>
                                                                     <i class="fa fa-credit-card text-primary " aria-hidden="true"></i>
																</span><br> Card Number 
																</th> 
																
																
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-money fa-stack-1x"></i>
																</span><br> Amount
																
																</th> 
																
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i>
                                                                     <i class="fa fa-sort-numeric-desc text-primary " aria-hidden="true"></i>
																</span><br> Authorization 
																</th> 
																
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i>
																		 <i class="fa fa-cog" aria-hidden="true"></i>
																</span><br> 
																
																</th>
																
															 
								
								                              </tr>
								                              
								                              
								                              
								                              </thead>
								                             <tbody>
								                             
								                            <c:forEach var="transaction"
																items="${listTransactionJrnNotReconcilied}">
																<tr class="text-center"
																	id="${transaction.idtransaction}">
																	
																	 
								                            <td class="text-primary font-montserrat v-align-middle"><i class="fa fa-calendar" aria-hidden="true"></i> ${transaction.transactionDateHost} <i class="fa fa-clock-o" aria-hidden="true"></i> ${transaction.transactionHostTime}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.transactionHostATM}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.cardNumber}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.transactionHostAmount}</td> 
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.UTRNNO}</td> 
								                            
								                            <td class="btn-group">
								                            <button class="btn btn-primary btn-xs" data-toggle="modal"
																				data-target="#modalReguleTransaction" data-id="${transaction.idtransaction}"> 

																					<i class="fa fa-wrench" aria-hidden="true"></i>
														    </button> 
														    <button class="btn btn-primary btn-xs" data-toggle="modal"
																				data-target="#modalReguleDetailTransaction" data-id="${transaction.idtransaction}"> 
																					<i class="fa fa-eye" aria-hidden="true"></i>
														    </button> 
								                            </td>   
								                            
								                             </tr>
								                             
								                             </c:forEach>
								                             
								                             
								                             
								                             </tbody>
								                             
								                             <tfoot>
								                             
								                             
								                               <tr>
								                             <td></td>
								                              <td></td>
								                               <td></td>
								                                <td></td>
								                                <td></td>
								                                <td></td>
								                             
								                             
								                             
								                             
								                             
								                             </tr>
								                             
								                             
								                             </tfoot>
								                             
								                             </table>
								                             
								
								
								
								</div>
						</div>
			
			
			
			
			</div>
			<jsp:include page="../view/fragments/footer.jsp"></jsp:include>  
			</div>
			
			
			 
			     
			
			</div>
			
			   
			</div>

	


<div class="modal fade slide-up disable-scroll"
		id="modalReguleTransaction" tabindex="-1" role="dialog"
		aria-hidden="false">
		<div class="modal-dialog modal-lg ">
			<div class="modal-content-wrapper">
				<div class="modal-content">
					<div class="modal-header clearfix text-center ">
						<button type="button" class="close" data-dismiss="modal" data-toggle="tooltip" data-placement="left" title="Close"
							aria-hidden="true">
							<i class="fa fa-times-circle text-danger" aria-hidden="true" ></i>
						</button>
						<h5 class="text-primary bold">
							<i class="fa fa-check-circle-o" aria-hidden="true"></i>  Transaction <span
								class="semi-bold text-primary">Regule</span>
						</h5>

					</div>

					<div class="modal-body">
					
					
						 <form:form modelAttribute="reconciliation" method="POST" id="reconciliationTable">
						 
						 
							 <label class="text-primary bold"><i class="fa fa-info-circle fa-pulse fa-fw"></i> Transaction Infos</label>
								<div class="row">
								
								<div class="col-md-3">
										<div class="form-group form-group-default">
											<label><i class="fa fa-calendar-o"
												aria-hidden="true"></i> Date&Time</label> <input type="text"
												disabled="disabled" class="form-control text-primary fs-12" id="dateAndTime">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-credit-card-alt "></i> Card Number</label> <input type="text"
												disabled="disabled" class="form-control text-primary fs-12" id="cardNumber"> 
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group form-group-default">
											<label><i class="fa fa-money "></i> Amount</label> <input type="text"
												disabled="disabled" class="form-control text-primary fs-12" id="amount"> 
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group form-group-default">
											<label><i class="fa fa-money "></i> Auth</label> <input type="text"
												disabled="disabled" class="form-control text-primary fs-12" id="authorizationNumber"> 
										</div>
									</div>
								</div>
                             <label class="text-primary bold"> 
                             <i class="fa fa-quote-left   fa-pull-left fa-border" aria-hidden="true"></i> 
                             Handel the transaction manuely </label>
                             
								<div class="row">
									<div class="col-md-11">
										<div class="form-group form-group-default">
											<label><i class="fa fa-commenting" aria-hidden="true"></i> Comment </label> 
											 <form:textarea path="comment" class="form-control" rows="5" id="comment"></form:textarea>
											 <form:hidden path="idTransaction" id="idTransaction"/>
											 
										</div>
									</div>
									
									<div class="col-md-1">
									<div class="btn-group btn-group-vertical">
									<button class="btn btn-xs   btn-danger "><i class="fa fa-eraser"></i>
									</button>
									<button class="btn btn-xs   btn-default "><i class="fa fa-pencil"></i>
									</button>
									 
									 
									</div>
									</div>
									 
									 
								</div>
						 
						
						<div class="row">
							<div class="col-md-8">
								
							</div>
							<div class="col-md-4 m-t-10 sm-m-t-10">
							<br>
								<form:button class="btn btn-primary btn-block m-t-5" 
								id="formReguleSubmit"><i class="fa fa-check" aria-hidden="true"></i> Regule</form:button>
							</div>
						</div>
						
						</form:form>
					
						
					</div>
				</div>
			</div>

		</div>
		<c:if test="${!empty msgResultat }">
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('body')
										.pgNotification(
												{
											 
													style : 'circle',
													title : "<span class='fs-10' > <i class='fa fa-check-square-o' aria-hidden='true'></i> Reconciliation Done </span>",
													message : "<span class=' fs-10 bold' ><i class='fa fa-exchange' aria-hidden='true'></i> ${DateTrx} |${cardNumber}|${Amount} DZD</span>  ",
													position : 'top-right',
													timeout : 200000,
													type : "${style}"
												}).show();
							});
		</script>
	</c:if>
	</div>


<div class="modal fade fill-in" id="modalReguleDetailTransaction" tabindex="-1"
		role="dialog" aria-hidden="true">
		               
							 
		<div class="modal-dialog modal-lg  ">
			<div class="modal-content">
				<div class="modal-header ">
				        <div class="pull-left">
				           <h5 class="text-left p-b-5">
				     		<span class="semi-bold text-primary"><i class="fa fa-file-o" aria-hidden="true"></i> Transaction Journal</span> 
					       </h5> 
					       </div>
					       
					       <div class="pull-right">       
						
						</div>
						
						
						
						
						
						 
				
					</div> 
					
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12 ">
							 
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
							 
							 
						</div>
						 
					</div>
					 
					 
				</div>
				<div class="modal-footer">
				 <div class="pull-right">
				
				      <button type="button" class="btn  btn-danger text-white" data-dismiss="modal"  
							 >
							 
							Close  
						</button>  
				
				
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
	var elems = Array.prototype.slice.call(document
			.querySelectorAll('#reguleTransaction'));
	
	elems.forEach(function(html) {
		var switchery = new Switchery(html, {color: '#6d5eac' , size: 'larg'});
	});
	
	
	$("#reguleTransaction").on("change", function()

			{
		
		
		
		
			});
		
		 
	 
	
	
	$('#tableWithSearch').DataTable();
	 
	 

	var table = $('#tableWithSearch');
 

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
			"sInfo" : "Showing <b>_START_ to _END_</b> Transaction non reconcilied of _TOTAL_ Transactions"
		},
		"aLengthMenu" : [
				[ 5, 10, 25, 50, -1 ],
				[ "5 Transactions ", "10 Transactions ", "25 Transactions", "50 Transactions",
						"All Transactions" ] ],

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
	
	
	$('.div.dataTables_wrapper div.dataTables_length select').removeClass('input-sm');
	
	
	
	
	
	
	$('#modalReguleTransaction')
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
				          var idTransactionAjax = event.relatedTarget.getAttribute('data-id');
				              console.log(idTransactionAjax);
				
				    var idTransactionToSend  =   event.relatedTarget.getAttribute('data-id');
			        $('#idTransaction').val(idTransactionToSend);

				$
						.ajax({
							url : '${pageContext.request.contextPath}/gettransactionJrn-'
									+ idTransactionAjax + '',
							method : 'GET',
							contentType : "application/json",
							timeout : 600000,
							success : function(data) {
								var StartDate = new Date(data.startingDate).toLocaleDateString();
								var FinishDate = new Date(data.finishingDate).toLocaleDateString();
								$('#dateAndTime').val(StartDate+ '   '+ data.startingTime );
								$('#cardNumber').val(data.cardNumber);
								$('#authorizationNumber').val(data.utrnno);
								$('#amount').val(data.transactionHostAmount);

								console.log(data);

							},

							error : function(xhr, status, error) {

							}
						});
			

			});
	
	
	
	
	
	
	$('#modalReguleDetailTransaction')
	.modal({
		keyboard : true,
		backdrop : "static",
		show : false,

	})
	.on('shown.bs.modal',
			function(event)

			{     
				 
				
				 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		         //////////////////////////////////////////////////// Transaction       ///////////////////////////////////////////////////////
		         ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		                 var $button = $(event.target);
						 var idTransactionAjax = event.relatedTarget.getAttribute('data-id');
						  console.log(idTransactionAjax);
		         
				$
				.ajax({
					url : '${pageContext.request.contextPath}/gettransactionJrn-'
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
	
</script>
       </body> 
</html>