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
											<li class="breadcrumb-item"><a href="#">Home</a>
											</li>
											<li class="breadcrumb-item active">Plain template
											</li>
											</ul>
								
								            <h3 class="page-title">Reconcilied</h3>
								</div>
								
								
								<div class=" container-fluid   container-fixed-lg">
								
								
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
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-link fa-stack-1x"></i>
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
                                                                     <i class="fa fa-credit-card text-primary " aria-hidden="true"></i>
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
																	
																	 
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.transactionDateHost}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.transactionHostATM}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.cardNumber}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.transactionHostAmount}</td> 
								                            <td class="text-primary font-montserrat v-align-middle">${transaction.UTRNNO}</td> 
								                            
								                            <td>
								                            <button class="btn btn-primary btn-xs" data-toggle="modal"
																				data-target="#modalRegule" data-id="${transaction.idtransaction}"> 

																					<i class="fa fa-wrench" aria-hidden="true"></i>
														    </button> 
														    <button class="btn btn-primary btn-xs" data-toggle="modal"
																				data-target="#modalReguleDetails" data-id="${transaction.idtransaction}"> 
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
		id="modalRegule" tabindex="-1" role="dialog"
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
							<i class="fa fa-check-circle-o" aria-hidden="true"></i>  Transaction <span
								class="semi-bold text-primary">Regule</span>
						</h5>

					</div>

					<div class="modal-body">
					
					
						 <form:form modelAttribute="reconciliation" method="POST" id="reconciliationTable">
						 
						 
							 <label class="text-primary bold"><i class="fa fa-info-circle fa-pulse fa-fw"></i> Transaction Infos</label>
								<div class="row">
								
								<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-calendar-o"
												aria-hidden="true"></i> Date and Time</label> <input type="text"
												disabled="disabled" class="form-control text-primary fs-12" id="dateAndTime">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-credit-card-alt "></i> Card Number</label> <input type="text"
												disabled="disabled" class="form-control text-primary fs-12" id="cardNumber"> 
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-money "></i> Amount</label> <input type="text"
												disabled="disabled" class="form-control text-primary fs-12" id="amount"> 
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
								<div class="p-t-10 clearfix p-l-10 p-r-10">
									<div class="pull-left text-primary bold">
									Valider transaction
									<br>
										 <span class="input-group-text transparent">  <input
											type="checkbox" data-init-plugin="switchery"
											id="reguleTransaction" data-size="small" data-color="red" />
										</span>
									</div>
									 
								</div>
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
		
		 
	
	
	$('#modalRegule')
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
							url : '${pageContext.request.contextPath}/gettransaction-'
									+ idTransactionAjax + '',
							method : 'GET',
							contentType : "application/json",
							timeout : 600000,
							success : function(data) {
								var StartDate = new Date(data.startingDate).toLocaleDateString();
								var FinishDate = new Date(data.finishingDate).toLocaleDateString();
								$('#dateAndTime').val(StartDate+ '   '+ data.startingTime );
								$('#cardNumber').val(data.cardNumber);
								$('#amount').val(data.transactionHostAmount);

								console.log(data);

							},

							error : function(xhr, status, error) {

							}
						});
			
			
			
			
				 
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			});
	
	
</script>
       </body> 
</html>