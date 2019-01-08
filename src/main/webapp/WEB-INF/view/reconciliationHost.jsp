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
																		class="fa fa fa-link fa-stack-1x"></i>
																</span><br> Date and time
																</th> 
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-link fa-stack-1x"></i>
																</span><br> ATM
																</th> 
																
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-link fa-stack-1x"></i>
																</span><br> Card Number 
																</th> 
																
																
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-link fa-stack-1x"></i>
																</span><br> Amount
																
																</th> 
																
																
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> 
																		<i class="fa fa-check-square-o" aria-hidden="true"></i>
																</span><br> 

																
																</th> 
																
																
															 
								
								                              </tr>
								                              
								                              
								                              
								                              </thead>
								                             <tbody>
								                             
								                             <c:forEach var="transactionHost"
																items="${listTransactionHostNotReconcilied}">
																<tr class="text-center"
																	id="${transactionHost.idTransactionHost}">
																	
																	     
								                            <td class="text-primary font-montserrat v-align-middle">${transactionHost.transactionHostDate}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transactionHost.transactionBranchAcquire}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transactionHost.transactionHostAmount}</td>
								                            <td class="text-primary font-montserrat v-align-middle">${transactionHost.transactionHostCradNumber}</td>
								                             <td class="text-primary font-montserrat v-align-middle"> 
								                             
								                             
								                                               <button class="btn btn-primary btn-xs" data-toggle="modal"
																				data-target="#modalDetailsTransactionHost"> 

																					<i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i>
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
         

   
   <div class="modal fade fill-in disable-scroll"
		id="modalDetailsTransactionHost" tabindex="-1" role="dialog"
		aria-hidden="false">


		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header clearfix text-left">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<i class="pg-close fs-14"></i>
					</button>
					<h5>
						Payment <span class="semi-bold">Information</span>
					</h5>
					 
				</div>
				<div class="modal-body">
					<form role="form">
						<div class="form-group-attached">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group form-group-default">
										<label>Comment</label> <input type="text"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
							 
								<div class="col-md-6">
									<div class="form-group form-group-default">
										<label>Card Number</label> <input type="text"
											class="form-control">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group form-group-default">
										<label>Amount</label> <input type="text"
											class="form-control">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group form-group-default">
										<label>date</label> <input type="text"
											class="form-control">
									</div>
								</div>
							</div>
						</div>
					</form>
					<div class="row">
						<div class="col-md-8">
							<div class="p-t-20 clearfix p-l-10 p-r-10">
								<div class="pull-left">
									<p class="bold font-montserrat text-uppercase">SWITCHY </p>
								</div>
								 
							</div>
						</div>
						<div class="col-md-4 m-t-10 sm-m-t-10">
							<button type="button" class="btn btn-primary btn-block m-t-5">Validate</button>
						</div>
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
 
	
	
       </body> 
</html>