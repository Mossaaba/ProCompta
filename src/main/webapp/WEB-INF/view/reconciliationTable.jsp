<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
                                                <div class="pull-left">
													<div class="input-group transparent">
													 
													
														 <button class="btn btn-primary " id="FilterBtn"><i class="fa fa-filter" aria-hidden="true"></i> Filter </button> 
												  </div>
													</div>
													<div class="pull-right">
													<div class="input-group transparent">
													<div class="input-group-prepend">
														<span class="input-group-text primary"><i class="fa fa-search"></i>
														</span>
														</div>
													
														<input type="text" id="search-table"
															class="form-control pull-right fs-12 input-lg " placeholder="Search a transaction">
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
											   <br>
											   	   <br>
													 
													 <div id="FilterFormDive"> 
													 <spring:url value="/reconciliationTable" var="formUrlReconciliation" />
													 
													<form:form action="${formUrlReconciliation}" method="POST" modelAttribute="reconciliation" id="reconciliationFilterForm">
													 
												<div class="row"> 
													 <div class="col-md-3 form-group-attached">
													 
													 <div class="form-group form-group-default input-group col-md-10">
													                <div class="input-group-append ">
																	<span class="input-group-text"><i class="fa fa-calendar"></i></span>
																	</div>
																	<div class="form-input-group">
																	<label>Date from</label>
																	<form:input path="startingDateReconciliation" id="startingDateReconciliation" 
																	type="text" cssClass="form-control" placeholder="Pick a starting date"  
																	autocomplete="off"/>
																	</div>
																	
																	</div>
																	 
																	
															 
															</div>

                                                  <div class="col-md-3 form-group-attached">
															         
															         
															         <div class="form-group form-group-default input-group col-md-10">
																	<div class="form-input-group">
																	<label>Date to</label>
																	<form:input path="finishingDateReconciliation" id="finishingDateReconciliation" 
																	type="text" cssClass="form-control" placeholder="Pick a finshing date"  
																	autocomplete="off"/>
																	</div>
																	<div class="input-group-append ">
																	<span class="input-group-text"><i class="fa fa-calendar"></i></span>
																	</div>
																	</div>
															          
													</div>
													<div class="col-md-3 form-group-attached">
                                                                             <div
																					class="form-group form-group-default form-group-default-select2 required">
																					<label class=""><i class="fa fa-file"></i> Type of file</label>
 
																					<form:select path="indicatorHostorJrn" 
																						cssClass="full-width"
																						data-placeholder="Select Country"
																						data-init-plugin="select2"  id="indicatorHostorJrn">

																						<option value="0">Only in journal</option>
																						<option value="1">Only in Host file</option>
																					</form:select>
 
																				</div>													</div>
													<div class="col-md-3 form-group-attached">
															                      <div
																					class="form-group form-group-default form-group-default-select2 required">
																					<label class=""> <i class="fa fa-link"></i> Type of reconciliation</label>
 
																					<form:select path="typeReconciliation"
																						cssClass="full-width"
																						data-placeholder="Select Country"
																						data-init-plugin="select2" id="typeReconciliation">

																						<option value="Automatique">Automatique</option>
																						<option value="Manuel">Manuel</option>
																					</form:select>
 
																				</div>
													</div>
													 
													 
											 
									              
									<br>
									

								</div>
									   <br>
									   	   <br>
									   	   
								
								           <div class="row b-grey no-margin ">
													<div class="col-md-12 text-center">
 
														<button class="btn btn-sm btn-primary bold" type="submit" id="subFormReconciliation">
															<i class="fa fa-search fa-2x"></i> SEARCH
														</button>
														<button class="btn btn-sm btn-danger bold" id="clearReconciliationForm" >
															<i class="fa fa-eraser fa-2x"></i> CLEAR
														</button>
 
													</div>
												</div>
												<hr>
 
 
 
										</form:form>			 
												 
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
										
										
										
										<tr class="text-center">
											
											<th   class="v-align-middle text-primary  ">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											
											<th   class="v-align-middle text-primary  ">
											<i class="fa fa-credit-card-alt" aria-hidden="true"></i><br>CARD</th>
											
											<th   class="v-align-middle  text-primary  " >
											<i class="fa fa-money" aria-hidden="true"></i><br>AMOUNT</th>
											
											<th   class="v-align-middle text-primary b-r b-dashed ">
											<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i><br>AUTH</th>
											
											  
											 
											<th   class="v-align-middle  text-complete  ">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											
											<th  class="v-align-middle  text-complete  ">
											<i class="fa fa-credit-card-alt" aria-hidden="true"></i><br>CARD</th>
											
											<th   class=" text-complete  " >
											<i class="fa fa-money" aria-hidden="true"></i><br>AMOUNT</th>
											
											<th  class="v-align-middle  text-complete  b-r b-dashed ">
											<i class="fa fa-sort-numeric-asc" aria-hidden="true"></i><br>AUTH</th>
											
											 
											 
											<th  class="v-align-middle  text-success  ">
											<i class="fa fa-calendar-check-o" aria-hidden="true"></i><br>DATE</th>
											
											<th   class="v-align-middle  text-success  " >
											<i class="fa fa-wrench" aria-hidden="true"></i> <br> TYPE</th>
											 
											  
											
											<th   class="v-align-middle text-success  " >
											<i class="fa fa-search-plus  " aria-hidden="true"></i></th> 
										    </tr>
										
										
										
										
									</thead>
									<tbody>
										
										
											<c:forEach var="trxPlusTrxHost"
																items="${ListTransactionAndTransactionHostReconcilied}">
																
																
										<tr class="">
											 
											<td class="v-align-middle text-danger bold">
											
											 <c:choose>
         
										      <c:when test = "${empty  trxPlusTrxHost[1].transactionDateHost}">
										         <span class="fa-stack fa-lg">
												  <i class="fa fa-calendar-check-o fa-stack-1x"></i>
												  <i class="fa fa-ban fa-stack-2x text-danger"></i>
												</span>      
										      </c:when>
										      
										      <c:when test = "${!empty trxPlusTrxHost[1].transactionDateHost}">
										   
                                             <p> ${trxPlusTrxHost[1].transactionDateHost } ${trxPlusTrxHost[1].transactionHostTime } </p>
										         
										      </c:when>
										   </c:choose>
											
											</td>
											
											
											
											<td class="v-align-middle    text-complete bold">
											
											<c:choose>
         
										      <c:when test = "${empty  trxPlusTrxHost[1].cardNumber}">
										         <span class="fa-stack fa-lg">
												  <i class="fa fa-credit-card-alt fa-stack-1x"></i>
												  <i class="fa fa-ban fa-stack-2x text-danger"></i>
												</span>
										        
										         
										      </c:when>
										      
										      <c:when test = "${!empty trxPlusTrxHost[1].cardNumber}">
										   
                                            <p> ${trxPlusTrxHost[1].cardNumber}  </p>
										         
										      </c:when>
										      
										       
										   </c:choose>
										   
										   
												
											</td>
											<td class="v-align-middle  ">
											
											<c:choose>
         
										      <c:when test = "${empty  trxPlusTrxHost[1].transactionHostAmount}">
										         <span class="fa-stack fa-lg">
												  <i class="fa fa fa-money fa-stack-1x"></i>
												  <i class="fa fa-ban fa-stack-2x text-danger"></i>
												</span>
										        
										         
										      </c:when>
										      
										      <c:when test = "${!empty trxPlusTrxHost[1].transactionHostAmount}">
										   
                                            <p> ${trxPlusTrxHost[1].transactionHostAmount} </p>
										         
										      </c:when>
										      
										       
										   </c:choose>
												
											</td>
											<td class="v-align-middle text-primary b-r b-dashed ">
											<c:choose>
         
										      <c:when test = "${empty  trxPlusTrxHost[1].UTRNNO}">
										         <span class="fa-stack fa-lg">
												  <i class="fa fa-sort-numeric-asc fa-stack-1x"></i>
												  <i class="fa fa-ban fa-stack-2x text-danger"></i>
												</span>
										        
										         
										      </c:when>
										      
										      <c:when test = "${!empty trxPlusTrxHost[1].UTRNNO}">
										   
                                           <p> ${trxPlusTrxHost[1].UTRNNO} </p>
										         
										      </c:when>
										      
										       
										   </c:choose>
												
											</td>
											 
										 
											<td class="v-align-middle  text-danger bold">
											
											 <c:choose>
         
										      <c:when test = "${empty  trxPlusTrxHost[2].transactionHostDate}">
										         <span class="fa-stack fa-lg">
												  <i class="fa fa-calendar-check-o fa-stack-1x"></i>
												  <i class="fa fa-ban fa-stack-2x text-danger"></i>
												</span>
										        
										         
										      </c:when>
										      
										      <c:when test = "${!empty trxPlusTrxHost[2].transactionHostDate}">
										   
                                               <p>  ${trxPlusTrxHost[2].transactionHostDate}  ${trxPlusTrxHost[2].transactionHostTime}</p>
										         
										      </c:when>
										      
										       
										   </c:choose>
										   
										   
												 
											</td>
											
											
											
											<td class="v-align-middle text-complete bold">
											
											<c:choose>
         
										      <c:when test = "${empty  trxPlusTrxHost[2].transactionHostCradNumber}">
										         <span class="fa-stack fa-lg">
												  <i class="fa fa-credit-card-alt fa-stack-1x"></i>
												  <i class="fa fa-ban fa-stack-2x text-danger"></i>
												</span>
										        
										         
										      </c:when>
										      
										      <c:when test = "${!empty trxPlusTrxHost[2].transactionHostCradNumber}">
										   
                                          <p> ${trxPlusTrxHost[2].transactionHostCradNumber}</p>
										         
										      </c:when>
										      
										       
										   </c:choose>
												
											</td>
											<td class="v-align-middle  ">
											<c:choose>
         
										      <c:when test = "${empty  trxPlusTrxHost[2].transactionHostAmount}">
										         <span class="fa-stack fa-lg">
												  <i class="fa fa-money fa-stack-1x"></i>
												  <i class="fa fa-ban fa-stack-2x text-danger"></i>
												</span>
										        
										         
										      </c:when>
										      
										      <c:when test = "${!empty trxPlusTrxHost[2].transactionHostAmount}">
										   
                                         <p> ${trxPlusTrxHost[2].transactionHostAmount} </p>
										         
										      </c:when>
										      
										       
										   </c:choose>
											
                                            
                                              
                                            
                                              
                                              
												 
											</td>
											<td class="v-align-middle text-complete b-r b-dashed ">
											<c:choose>
         
										      <c:when test = "${empty  trxPlusTrxHost[2].transactionHostAuthorization}">
										         <span class="fa-stack fa-lg">
												  <i class="fa fa-sort-numeric-asc fa-stack-1x"></i>
												  <i class="fa fa-ban fa-stack-2x text-danger"></i>
												 </span>   
										      </c:when>
										      
										      <c:when test = "${!empty trxPlusTrxHost[2].transactionHostAuthorization}">
										   
                                            <p id="roundAuthorization"> ${trxPlusTrxHost[2].transactionHostAuthorization} </p>
										         
										      </c:when>
										      
										       
										   </c:choose>
												
											</td>
											 
											 
											<td class="v-align-middle ">
 
										      <c:set var = "dateComeFromServer" value = "${trxPlusTrxHost[0].dateReconciliation}"/>
                                              <c:set var = "dateToShow" value = "${fn:substring(dateComeFromServer, 0, 10)}" />
                                               <p class="text-danger"><c:out value = "${dateToShow}" /> ${trxPlusTrxHost[0].timeReconciliation} </p> 
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
	  
	
	$("#clearReconciliationForm").click(function() {
	      $(this).closest('form').find("input[type=text], textarea").val("");
	      
	      $("#typeReconciliation").val('').trigger('change');
	      $("#indicatorHostorJrn").val('').trigger('change');
	      
	      return false;
	    
	     
	})
	
	 
	$('#FilterFormDive').hide();
	
	
	$("#FilterBtn").click(function() {
		$('#FilterFormDive').toggle();
	});
 
	
	
	
	
	
	
	var startDate = new Date('01/01/2012');
	var FromEndDate = new Date();
	var ToEndDate = new Date();
	ToEndDate.setDate(ToEndDate.getDate()+365);

	 
	$('#startingDateReconciliation').datepicker({

	    weekStart: 1,
	    format : 'yyyy-mm-dd',
	    startDate: '01/01/2000',
	    endDate: FromEndDate, 
	    autoclose: true
	}).on('changeDate', function(selected)
			{
	        startDate = new Date(selected.date.valueOf());
	        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
	        $('#finishingDateReconciliation').datepicker('setStartDate', startDate);
	    });


	$('#finishingDateReconciliation').datepicker({

	        weekStart: 1,
	        format : 'yyyy-mm-dd',
	        startDate: startDate,
	        endDate: ToEndDate,
	        autoclose: true
	    })
	    .on('changeDate', function(selected){
	        FromEndDate = new Date(selected.date.valueOf());
	        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
	        $('#startingDateReconciliation').datepicker('setEndDate', FromEndDate);
	    });
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$("#typeReconciliation")
	.select2(
			{
				dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
				allowClear : true,
				placeholder : {
					id : "-1",
					text : "Please select a type of reconciliation",
					selected : 'selected'
				},
				data : [ {
					id : -1,
					text : '',
					selected : 'selected',
					search : '',
					hidden : true
				} ]

			});
	
	
	$("#indicatorHostorJrn")
	.select2(
			{
				dropdownCssClass : "font-montserrat blod text-primary bold fs-12",
				allowClear : true,
				placeholder : {
					id : "-1",
					text : "Please select type of file",
					selected : 'selected'
				},
				data : [ {
					id : -1,
					text : '',
					selected : 'selected',
					search : '',
					hidden : true
				} ]

			});
	 
	
	
	
	
	
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