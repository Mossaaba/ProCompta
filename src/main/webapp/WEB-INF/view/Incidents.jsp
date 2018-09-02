<%@ page session="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
 

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
							<li class="breadcrumb-item"><a href="#"><spring:message code="label.title"></spring:message></a></li>
							<li class="breadcrumb-item active">Dashbord
							</li>
						</ol>
					

					<div class="card-body">
						<div class="row">
							<div class="col-lg-12">
								<div id="card-linear" class="card card-default">
									<div class="card-header  ">
										<div class="card-title"><i class="fa fa-bolt " style="font-size :15px;" aria-hidden="true"></i>Indicents</div>
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
											<span class="semi-bold">Incidents </span> Informations
										</h3>
										
										
										<c:if test="${!empty msg }">
										    <div class="col-lg-3 pull-right">
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
																	  <h3 class="text-white"><span class="semi-bold">${msg}</span></h3>			 
																	</div>
																	
														  </div>
													</div>
							                </div>
										</c:if>
	
										<div class="card-body">
										<spring:url value="/incident/find" var="formUrlIncident" />
											<form:form action="${formUrlIncident}" method="POST"
												modelAttribute="incident">
												<form:input type="text" path="DebutIncidentDate"
													id="DebutIncidentDate" cssClass="form-control"
													cssStyle=" display: none;" />
												<form:input type="text" path="finIncidentDate"
													cssClass="form-control pull-right"
													cssStyle=" display: none;" />
												<form:input type="text" path="heuredebutIncident"
													cssClass="form-control pull-right"
													cssStyle=" display: none;" />
												<form:input type="text" path="heurefinIncident"
													cssClass="form-control pull-right"
													cssStyle=" display: none;" />
												<p>Date and Time information</p>
												 <form:errors path="DateIncident" cssClass="alert alert-danger" />
												<div class="form-group-attached">
													<div class="row clearfix">
													<div class="col-lg-6">
													
														<div class="form-group form-group-default required">

															<label>Date and time</label><i class="pg-calender"></i>
                                                           
															<form:input path="DateIncident" type="text"
																id="DateIncident" cssClass="form-control"
																autocomplete="off" />
															
														</div>
														
														</div>
														<div class="col-lg-6">
														
														    <div
																class="form-group form-group-default form-group-default-select2">
																<label class=""> <i class="pg-minus_circle"></i>
																	Ereures
																</label>
																<form:select path="detailsincidents" cssClass="full-width"
																	id="detailsincidents"
																	data-placeholder="Error Transaction"
																	cssStyle="width: 100%;" data-init-plugin="select2"
																	items="${TypeIncident}" />

															</div>
														 
														</div>
													</div>
												</div>
												<br>
												<div class="pull-left">
													<br>
													<form:button class="btn btn-success" type="submit"><i class="pg-search" style="font-size :15px;"></i> Submit</form:button>
													<form:button class="btn btn-danger">
														<i class="pg-close"></i> Clear</form:button>
												</div>
											</form:form>
										</div>
									</div>

								</div>
							</div>
 



						</div>
					</div>
					
					
					
					
					
					
					
					
					
					<c:if test="${!empty ListIncidentAfterFiltring}">
					<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><spring:message code="label.title"></spring:message></a></li>
							<li class="breadcrumb-item active">Incident
							</li>
						</ol>
					
					
					
					<div class="card-body">
						<div class="row">
							<div class="col-lg-12">
								<div id="card-advance" class="card card-default">
									<div class="card-header  ">
										<div class="card-title"><i class="fa fa-bolt" style="font-size :15px;" aria-hidden="true"></i>Indicents</div>
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
										<h3>
											<span class="semi-bold">Incidents </span> Informations
										</h3>
									 
										
				                                 <table class="table display table-hover demo-table-search table-responsive-block nowrap "
																		  id="tableWithSearch2"   >
																		<thead>
																			<tr>
																			    
																				<th><i class="pg-calender"></i> Date </th>
																				<th><i class="fa fa-bolt"></i> Incident </th>
																				 
																			</tr>

																		</thead>
																		<tbody>
     
																			<c:forEach items="${ListIncidentAfterFiltring}"
																				var="incident">
																				<tr>
																				    
																				     
																					<td class="v-align-middle semi-bold"> ${incident.debutIncidentDate}    ${incident.heuredebutIncident}   </td>
																					<td class="v-align-middle">${incident.detailsincidents}</td>
																					 

																				</tr>

																			</c:forEach>

																		</tbody>
																		<tfoot>
																			<tr>
																				 
																				<th> </th>
																				<th> </th>
																				 
																				 
																			</tr>


																		</tfoot>


																	</table>
									 
									</div>

								</div>
							</div>
 



						</div>
					</div>
					</c:if>
					
					
			
					
					
</div>

 
                     
					

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
$(function() {
	
	
	$(document).ready( function () {
		
		
		
		 $("#detailsincidents").select2();
		 
		 
		 
	    $('#tableWithSearch2').DataTable({
								"sDom": "<'row'<'col-sm-12 col-md-2'l><'col-sm-12 col-md-10'f>>  "+
								" <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'table-responsive't>  "+
								"<'row'<'col-sm-12 '<'exportOptions2'T>p><'col-sm-6 '>>",
	    	 
	    	"fixedHeader": true,
            "sPaginationType": "bootstrap",
            "destroy": true,
            "bPaginate": true,
            "lengthMenu": [[5,10, 25, 50, -1], [5, 10, 25, 50, "All"]] ,
            "oLanguage": 
		               {   
            	         
		                   "sInfo": "Incident resultat "
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
	
	
	
	
	
	$("#detailsincidents").select2();
	
	  $('#DateIncident').daterangepicker({
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
	 
	  $('#DateIncident').on('apply.daterangepicker', function(ev, picker) {
	      $(this).val(picker.startDate.format('YYYY-MM-DD HH:MM:SS') + ' - ' + picker.endDate.format('YYYY-MM-DD HH:MM:SS'));
	      $('#DebutIncidentDate').val(picker.startDate.format('YYYY-MM-DD'));
	      $('#finIncidentDate').val(picker.endDate.format('YYYY-MM-DD'));
	      $('#heuredebutIncident').val(picker.startDate.format('HH:MM:SS'));
	      $('#heurefinIncident').val(picker.endDate.format('HH:MM:SS'));
	      
	  });
	
	  $('#DateIncident').on('cancel.daterangepicker', function(ev, picker) {
	      $(this).val('');
	  });
								  
								  
								  
});
		 
		 
    
     
       
</script>

</body>
</html>