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

<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap-tag/bootstrap-tagsinput.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap3-wysihtml5/bootstrap3-wysihtml5.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/dropzone/css/dropzone.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/summernote/css/summernote.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/select2/css/select2.min.css"/>"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/ion-slider/css/ion.rangeSlider.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/ion-slider/css/ion.rangeSlider.skinFlat.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.nouislider.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-datatable/media/css/dataTables.bootstrap.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/FixedColumns/css/dataTables.fixedColumns.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/datatables-responsive/css/datatables.responsive.css"/>"
	type="text/css" />





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
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Chercher une Trasnaction
							</li>
						</ol>
					

					<div class="card-body">
						<div class="row">
							<div class="col-lg-8">
								<div id="card-linear" class="card card-default">
									<div class="card-header  ">
										<div class="card-title"><i class="fa fa-filter" style="font-size :15px;"></i> Filter de recherches</div>
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
										<h3>
											<span class="semi-bold">Transaction</span> Filters
										</h3>
										<div class="card-body">
<!-- *************** -->
<!-- Form            -->
<!-- *************** -->

											<spring:url value="/transaction/find" var="formUrlTrnsaction" />
											<form:form action="${formUrlTrnsaction}" method="POST"
												modelAttribute="transaction">

												<form:input type="text" path="DebuttransactionDate"
													id="DebuttransactionDate" cssClass="form-control"
													cssStyle=" display: none;" />
												<form:input type="text" path="fintransactionDate"
													cssClass="form-control pull-right"
													cssStyle=" display: none;" />
												<form:input type="text" path="heuredebut"
													cssClass="form-control pull-right"
													cssStyle=" display: none;" />
												<form:input type="text" path="heurefin"
													cssClass="form-control pull-right"
													cssStyle=" display: none;" />


												<p>Date and Time information</p>
												<div class="form-group-attached">
													<div class="row clearfix">
														<div class="form-group form-group-default required">

															<label>Date and time</label><i class="pg-calender"></i>

															<form:input path="dateTransaction" type="text"
																id="dateAndTimeTransaction" cssClass="form-control"
																autocomplete="off" />
															
														</div>
														<form:errors path="dateTransaction"
																cssClass="alert alert-danger" />
													</div>



												</div>
												<br>

												<div class="form-group-attached">

													<p>Carte Information</p>
													<div class="row clearfix">
														<div class="col-md-6">
															<div class="form-group form-group-default ">
																<label>Card number</label><i class="pg-credit_card_line"></i>
																<form:input path="numerocarte" type="text"
																	cssClass=" form-control" maxlength="16"
																	placeholder="8888-8888-8888-8888"
																	onkeypress="return isNumberKey(event)" />
																<form:errors path="numerocarte"
																	cssClass="alert alert-danger" />

															</div>
														</div>

														<div class="col-md-6">
															<div
																class="form-group form-group-default form-group-default-select2">
																<label class="">Etat de carte </label>
																<form:select path="etatcarte" cssClass="full-width"
																	id="etatcarte" data-placeholder="Etat de carte"
																	cssStyle="width: 100%;" data-init-plugin="select2"
																	items="${etatscarte}" />
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
																<form:input path="montant" type="number" id="montant"
																	data-a-sign="DZD " cssClass="form-control"
																	autocomplete="off" />
																<form:errors path="montant"
																	cssClass="alert alert-danger" />
															</div>
														</div>

														<div class="col-md-6">
															<div
																class="form-group form-group-default form-group-default-select2 ">
																<label class="">Etat de CASHE</label>
																<form:select path="etatcash" cssClass="full-width"
																	id="CASHESTATE" data-placeholder="Etat de Cash"
																	cssStyle="width: 100%;" data-init-plugin="select2"
																	items="${etatsCash}" />
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
																	<form:input path="montantMin" type="number"
																		id="montantMin" onkeypress="return isNumberKey(event)"
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
																	<form:input path="montantMax" type="number"
																		id="montantMax" onkeypress="return isNumberKey(event)"
																		cssClass="form-control usd" disabled="true" />
																</div>
																<div class="input-group-append ">
																	<span class="input-group-text">DZD </span>
																</div>
															</div>
														</div>



														<div class="col-md-3">

															<div class="irs-wrapper danger">
																<input type="text" name="montantRange" id="montantRange"
																	value="" />
															</div>
														</div>
													</div>

												</div>
												<br>
												<div class="form-group-attached">

													<p>Infos Transaction</p>
													<div class="row clearfix">
														<div class="col-md-6">
															<div class="form-group form-group-default input-group">
																<div class="form-input-group">
																	<label>Numero authorisation</label><i class="fa fa-sort-numeric-desc"></i>
																	<form:input path="nauthorisation" type="text"
																		id="nauthorisation"
																		onkeypress="return isNumberKey(event)"
																		cssClass="form-control" autocomplete="off" />
																	<form:errors path="nauthorisation"
																		cssClass="alert alert-danger" />
																</div>

															</div>

														</div>

														<div class="col-md-6">
															<div
																class="form-group form-group-default form-group-default-select2">
																<label class=""> <i class="pg-minus_circle"></i>
																	Ereures
																</label>
																<form:select path="remarque" cssClass="full-width"
																	id="erreurTransaction"
																	data-placeholder="Error Transaction"
																	cssStyle="width: 100%;" data-init-plugin="select2"
																	items="${errorsTransaction}" />

															</div>

														</div>

													</div>

												</div>

												<div class="pull-left">
													<br>
													<form:button class="btn btn-success" type="submit"><i class="pg-search" style="font-size :15px;"></i> Submit</form:button>
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
											 <div class="card-title text-white"><i class="pg-italic" style="font-size :15px;"></i> Remarque : </div>
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
							<li class="breadcrumb-item active">Resultat de recherche
							</li>
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
																				<i class="fa fa-exchange" style="font-size :15px;" ></i>
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
																		  id="tableWithSearch2"   style="width:100%"   >
																		<thead>
																			<tr>
																			    <th></th>
																				<th><i class="pg-calender"></i> Date and time</th>
																				<th><i class="pg-credit_card_line"></i> Numero Carte </th>
																				<th><i class="fa fa-eject"></i> Etat carte</th>
																				<th><i class="pg-layouts3"></i> Montant</th>
																				<th><i class="fa fa-hand-lizard-o"></i> Etat cashe</th>
																				<th><i class="fa fa-sort-numeric-desc"></i> Numero <br>authorisation</th>
																				<th><i class="fa fa-info"></i> remarque</th>
																			</tr>

																		</thead>
																		<tbody>
																 
                                                                               
																			<c:forEach items="${ListTransactionAfterFiltring}"
																				var="transaction">
																				<tr data-child-value1="${transaction.cassette1}" data-child-value2="${transaction.cassette2}" 
																				data-child-value3="${transaction.cassette3}" data-child-value4="${transaction.cassette4}">
																				    
																				    <td class="v-align-middle details-control"> <c:if test="${transaction.montant != 0}"><i class="fa fa-plus-circle"  style="color:green;"></i></c:if></td>
																					<td class="v-align-middle semi-bold"> ${transaction.debuttransactionDate} ${transaction.heuredebut} <br>  ${transaction.fintransactionDate} ${transaction.heurefin} </td>
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
																				<th> </th>
																				<th> </th>
																				<th> </th>
																				<th>xxxx</th>
																				<th> </th>
																				<th> </th>
																				<th> </th>
																				 
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

	<script
		src="<spring:url value="/resources/assets/plugins/jquery-validation/js/jquery.validate.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-inputmask/jquery.inputmask.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-form-wizard/js/jquery.bootstrap.wizard.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/moment/moment.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-autonumeric/autoNumeric.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/dropzone/dropzone.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-tag/bootstrap-tagsinput.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/summernote/js/summernote.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-typehead/typeahead.bundle.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-typehead/typeahead.jquery.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/handlebars/handlebars-v4.0.5.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/select2/js/select2.full.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/ion-slider/js/ion.rangeSlider.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.nouislider.min.js"/>"></script>
	

	
	
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.liblink.js"/>"></script>
	<script src="<spring:url value="/resources/assets/js/slider.js"/>"></script>
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
	



	<script type="text/javascript">






$(function () {
	$("#etatcarte").select2();
    $("#CASHESTATE").select2();
    $("#erreurTransaction").select2(); 
    /* BOOTSTRAP SLIDER */
    
    
    var $range = $("#montantRange"),
    $resultMin = $("#montantMin"),
    $resultMax = $("#montantMax"),
	
   
   
    from = 0,
    to = 0;

    var saveResult = function (data) 
    {
    from = data.from;
    to = data.to;
    };

    var writeResult = function () 
    {
	     var resultMinum =   from ;
	     var resultMaxim =  to;

	    $resultMin.val(resultMinum);
	    $resultMax.val(resultMaxim)
	    
	    
	  
	    
     };

 

    /* ION SLIDER */
    $("#montantRange").ionRangeSlider({
      type: "double",
      grid: true,
      min: 0,
      max: 50000,
      from: 0,
      to: 50000,
      step: 500,
      prefix: "DZD",
      prettify: false,
      
      hasGrid: true , 
      disable: true, 
      onStart: function (data) 
      {
          saveResult(data);
           writeResult();
      },
      onChange: saveResult,
      onFinish: saveResult
 
    });
     
    $range.on("change", writeResult);

    
    
  });

 


$("#AmountHandler").on("change",function()
		
		{
	
	     var isDisabled = $('#montantMax').prop('disabled');
	      
	    
	    if (isDisabled == true)
		{
	  
	    $("#montantMax").removeAttr("disabled");
	    $("#montantMin").removeAttr("disabled");
	    $("#montant").prop('disabled', true);
	    $("#montantRange").data("ionRangeSlider").update({ disable: false,});
	    
		}
	    
	    else 
	    {
	    	$("#montant").removeAttr('disabled');
	    	$("#montantMax").prop('disabled', true);
		    $("#montantMin").prop('disabled', true);
		    $("#montantRange").data("ionRangeSlider").update({ disable: true,});

	    }
	
 });
 
 
 
  





$(function() {
	
	
	     
	 
	 $(document).ready( function () {
		    $('#tableWithSearch2').DataTable({
									"sDom": "<'exportOptions2'T><'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>>"+
									"<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "+
									"<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "+
									"<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "+
									" <'row'<'col-sm-12 col-md-2'l><'col-sm-12 col-md-10'f>> <'table-responsive't>  "+
									"<'row'<'col-sm-12 col-md-2'i><'col-sm-12 col-md-10'p>>",
		    	 
		    	 "fixedHeader": true,
		    	 
	            "sPaginationType": "bootstrap",
	            "destroy": true,
	            "bPaginate": true,
	            "lengthMenu": [[5,10, 25, 50, -1], [5, 10, 25, 50, "All"]] ,
	            "oLanguage": 
			               {   
	            	         
			                   "sInfo": "transaction resultat "
			               },
			              
			               "oTableTools": {
			            	   "sSwfPath": '<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/swf/copy_csv_xls_pdf.swf"/>',
			            	   
                  "aButtons": [{
                      "sExtends": "csv",
                      "sButtonText": "<i class='pg-grid'></i>",
                  }, {
                      "sExtends": "xls",
                      "sButtonText": "<i class='fa fa-file-excel-o'></i>",
                  }, {
                      "sExtends": "pdf",
                      "sButtonText": "<i class='fa fa-file-pdf-o'></i>",
                  }, {
                      "sExtends": "copy",
                      "sButtonText": "<i class='fa fa-copy'></i>",
                  }] 
			               },
			               
			               fnDrawCallback: function(oSettings) {
			               	
			                   $('.export-options-container2').append($('.exportOptions2')); // Append the buttons to container export-options-container2 in the DOM

			                   // In the DOM you'll find something like: <a id="ToolTables_historyDataTable_XXXXX" class="btn btn-white DTTT_button_csv" data-original-title="" title=">
			                   
			               }
              
		    
		    

	         
		} );
	    } );
	 
	 
	    
	
	    
	    
	    
	    
	    
	    
	    
	    
	    
	var elems = Array.prototype.slice.call(document.querySelectorAll('#AmountHandler'));

	elems.forEach(function(html) {
	  var switchery = new Switchery(html);
	});
	
	
	   $('#dateAndTimeTransaction').daterangepicker({
		   "showDropdowns": true,
		    "timePicker": true,
		    "timePicker24Hour": true,
		    "timePickerSeconds": true,
		     
		    "autoApply": false,
		    ranges: {
		         
		        '<spring:message code="label.yesterday"/>': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		        '<spring:message code="label.Last7Days"/>': [moment().subtract(6, 'days'), moment()],
		        '<spring:message code="label.Last30Days"/>': [moment().subtract(29, 'days'), moment()],
		        '<spring:message code="label.ThisMonth"/>': [moment().startOf('month'), moment().endOf('month')],
		        '<spring:message code="label.LastMonth"/>': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		    },
		    "locale": {
		    	"format" : 'YYYY-MM-DD HH:MM:SS',
		        "separator": " - ",
		        "applyLabel": "Apply",
		        "cancelLabel": "Cancel",
		        "fromLabel": "From",
		        "toLabel": "To",
		        "cancelLabel": 'Clear',
		        "customRangeLabel": "<spring:message code="label.Custom"/>",
		        "weekLabel": "W",
		        "daysOfWeek": [
                    "Sa",
		            "Su",
		            "Mo",
		            "Tu",
		            "We",
		            "Th",
		            "Fr"
		            
		        ],
		        "monthNames": [
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
		            "<spring:message code="label.December"/>"
		        ],
		        "firstDay": 1, 
		        
		    },
		    
		    "opens": "right"
		}, function(start, end, label) {
		  console.log('New date range selected: ' + start.format('YYYY-MM-DD hh:mm:ss') + ' to ' + end.format('YYYY-MM-DD hh:mm:ss') + ' (predefined range: ' + label + ')');
		});
	  
	   $('#dateAndTimeTransaction').on('apply.daterangepicker', function(ev, picker) {
		      $(this).val(picker.startDate.format('YYYY-MM-DD HH:MM:SS') + ' - ' + picker.endDate.format('YYYY-MM-DD HH:MM:SS'));
		      $('#DebuttransactionDate').val(picker.startDate.format('YYYY-MM-DD'));
		      $('#fintransactionDate').val(picker.endDate.format('YYYY-MM-DD'));
		      $('#heuredebut').val(picker.startDate.format('HH:MM:SS'));
		      $('#heurefin').val(picker.endDate.format('HH:MM:SS'));
		      
		  });

		  $('#dateAndTimeTransaction').on('cancel.daterangepicker', function(ev, picker) {
		      $(this).val('');
		  });
		  
		  
		  
		 });
		 
		 
       function format(value1,value2,value3,value4) 
       {
            return ' <table class="table table-hover table-condensed nowrap no-footer" > <tr> '+
                   '<th>Cassette1</th>'+
        	       '<th>Cassette2</th>'+
        	       '<th>Cassette3</th>'+
        	       '<th>Cassette4</th>'+
                   '</tr>'+
                    '<tr>'+
                       '<td class="v-align-middle">'+value1+'</td>'+
                       '<td class="v-align-middle">'+value2+'</td>'+
        	           '<td class="v-align-middle">'+value3+'</td>'+
        	           '<td class="v-align-middle">'+value4+'</td>'+
                   '</tr>'+
                   '</table>';
         }
       
    $(document).ready(function () 
 {
    var table = $('#tableWithSearch2').DataTable({});

    // Add event listener for opening and closing details
    $('#tableWithSearch2').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);

        if (row.child.isShown()) 
        {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
            tr.find('i').attr('class', 'fa fa-plus-circle'); 
            tr.find('i').attr('style', 'color:green; ');
            
             
        } else 
        {
            // Open this row
            row.child(format(tr.data('child-value1'), tr.data('child-value2') ,tr.data('child-value3'), tr.data('child-value4'))).show();
             
            tr.addClass('shown');
            tr.find('i').attr('class', 'fa fa-minus-circle ');
            tr.find('i').attr('style', 'color:red; ');
            
        }
    });
    
    
    
    $('#tableWithSearch2 tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } );
});
		 
		 
		 
		 
		 
		 

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && ((charCode < 48) || (charCode > 57)))
        return false;
    return true;
};

</script>

</body>
</html>