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
<title>ProCompta | INCIDENTS</title>
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"  
    href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"  
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"  
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="icon"  
	href="<spring:url value="/resources/pages/logo.png"/>" />

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
        <br>
		<br>
		<br>

		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">


			<div class="page-content-wrapper">



				<div class="content">

					<ul class="nav nav-tabs nav-tabs-linetriangle   nav-stack-sm"
						role="tablist" data-init-reponsive-tabs="dropdownfx">
						<li class="nav-item"><a id="listeAtm"
							class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold"
							data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
								<span> <spring:message code="label.space"></spring:message>
							</span><span> </span><span> </span><i class="fa fa-flash fa-4x"></i> <span>Incident</span>
						</a></li>
					</ul>
					<br>
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					<!-- BLOC FILTER  -->
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					
					
					<c:if test="${empty Filter }">
					<div class="col-lg-12 sm-no-padding">
						<div class="card card-transparent">
							<div class="card-body no-padding">
								<div id="card-advance" class="card card-default">
									<div class="card-header  ">
										<div class="card-title">

											<h5>
												<span class="semi-bold text-primary"> <i
													class="fa fa-filter fa-2x"></i> Incident
												</span> Filter
											</h5>
										</div>
										<div class="card-controls">
											<ul>
												<li>
													<div class="dropdown">
														<a id="card-settings" data-target="#" href="#"
															data-toggle="dropdown" aria-haspopup="true" role="button"
															aria-expanded="false"> <i
															class="card-icon card-icon-settings "></i>
														</a>
														<div class="dropdown-menu dropdown-menu-right" role="menu"
															aria-labelledby="card-settings">
															<a href="#" class="dropdown-item">How to filter </a> <a
																href="#" class="dropdown-item">Resultat</a> <a href="#"
																class="dropdown-item">About</a>
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

											</ul>
										</div>
									</div>



									<spring:url value="/incident/find" var="formUrlIncident" />

									<form:form action="${formUrlIncident}" method="POST"
										modelAttribute="incident" id="incidentFilterForm">
										<div class="card-body">

											<div class="row">
												<div class="col-md-4">

													<div
														class="form-group form-group-default form-group-default-select2 ">
														<label class="">ATM</label>
														<form:select path="idAtm" cssClass="full-width"
															data-placeholder="Select an ATM"
															data-init-plugin="select2" id="ATM">


															<c:forEach var="atm" items="${listATM}">
																<form:option value="${atm.idAtm}">${atm.nameAtm} </form:option>
															</c:forEach>
														</form:select>
													</div>

												</div>
												<div class="col-md-8">
													<div class="row">

														<div class="col-md-6">

															<div class="form-group form-group-default input-group required" id="startingDateDive">

																<div class="form-input-group"> 
																	<label>Start Date</label>
																	<form:input path="startingDateFilterIncident"
																		type="text" id="incidentDateStarting"
																		class="form-control date" placeholder="Pick a date" autocomplete="off"  />
																</div>

																<div class="input-group-append ">
																	<span class="input-group-text"><i
																		class="fa fa-calendar"></i></span>
																</div>
															</div>

														</div> 

														<div class="col-md-6">   

															<div class="form-group form-group-default input-group  required " id="finishingDateDive">

																<div class="form-input-group">
																	<label>Finising Date</label>
																	<form:input path="finishingDateFilterIncident"
																		type="text" id="incidentDateFinishing"
																		class="form-control date" placeholder="Pick a date" autocomplete="off"  />
																</div>

																<div class="input-group-append ">
																	<span class="input-group-text"><i
																		class="fa fa-calendar"></i></span>
																</div>
															</div>

														</div>


													</div>


												</div>
											</div>

											<div class="row">
												<div class="col-md-4">

													<div
														class="form-group form-group-default form-group-default-select2 ">
														<label class="">Type of incident</label>
														<form:select path="detailsincidents" cssClass="full-width"
															data-placeholder="Select an ATM"
															data-init-plugin="select2" id="IncidentATM"
															items="${listIncident}" />
													</div>

												</div>
												<div class="col-md-8">
													<div class="row">

														<div class="col-md-6">
															<div class="form-group form-group-default input-group  ">

																<div class="form-input-group">
																	<label>Start Time</label>
																	<form:input path="startingTimeFilterIncident"
																		type="text" class="form-control time"
																		placeholder="Pick a time"  autocomplete="off"  />
																</div>

																<div class="input-group-append ">
																	<span class="input-group-text"><i
																		class="fa fa-clock-o"></i></span>
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group form-group-default input-group  ">

																<div class="form-input-group">
																	<label>Finishing Time</label>
																	<form:input path="finisingTimeFilterIncident"
																		type="text" class="form-control time endTime "
																		placeholder="Pick a time"  autocomplete="off" />
																</div>

																<div class="input-group-append ">
																	<span class="input-group-text"><i
																		class="fa fa-calendar"></i></span>
																</div>
															</div>
														</div>

													</div>
												</div>
											</div>
											<br>
											<div class="row b-grey no-margin ">
												<div class="col-md-12 text-center">
													<button class="btn btn-primary bold" type="submit">
														<i class="fa fa-search fa-3x"></i> Submit
													</button>
													<button class="btn btn-danger bold" id="clearFormIncident"  >
														<i class="fa fa-eraser fa-3x"></i> Clear
													</button>
												</div>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>


                    </c:if>

                          <c:if test="${!empty Filter }">
					<div class="col-lg-12 sm-no-padding text-center">
						<div class="card card-transparent">
							<div class="card-body no-padding">
								<div id="card-advance-resultat" class="card card-default">
									<div class="card-header  ">
										<div class="card-title">

											<h5>
												<span class="semi-bold text-primary bold"> <i
													class="fa fa-flash fa-2x m-b-5"></i> Incident Resultat
												</span>
											</h5>
											<br>
											
											
											<c:if test="${!empty Filter }">
													<span
														class="   p-t-5 m-l-5 p-b-5 inline fs-12 text-primary bold">
														<i class="fa fa-filter fa-2x"></i> Filter :
													</span>
       
                                                     <c:if
														test="${!empty incidentFilter.startingDateFilterIncident  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<i class="fa fa-calendar-o" aria-hidden="true"></i> 
															DATE START : ${incidentFilter.startingDateFilterIncident}</span>
													</c:if>
													<c:if
														test="${!empty incidentFilter.finishingDateFilterIncident  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<i class="fa fa-calendar-o" aria-hidden="true"></i> 
															DATE FINISH :
															${incidentFilter.finishingDateFilterIncident}</span>
													</c:if>

													<c:if
														test="${!empty incidentFilter.startingTimeFilterIncident  }">
														
														<span
														
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<i class="fa fa-clock-o" aria-hidden="true"></i>
															TIME START : ${incidentFilter.startingTimeFilterIncident}
														</span>
													</c:if>

													<c:if
														test="${!empty incidentFilter.finisingTimeFilterIncident  }">
														
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<i class="fa fa-clock-o" aria-hidden="true"></i> 
															TIME FINISH :
															${incidentFilter.finisingTimeFilterIncident} </span>
													</c:if>
													
													<c:if test="${incidentFilter.detailsincidents ne '-1' }">
														<span
															class=" label label-warning p-t-5 m-l-5 p-b-5 inline fs-12">
															<i class="fa fa-flash" aria-hidden="true"></i> 
															Type Of Incident : ${incidentFilter.detailsincidents}
														</span>
														
													</c:if>

													<br>
													<br>
													<button class="btn btn-sm btn-primary "
														onclick="window.location.href='<spring:url value="/incident"/>'">
														<i class="fa fa-filter fa-2x"></i> New Filter
													</button> 
										  </c:if>

													 
											
													 
													 
													 
											
											
											
										</div>
										<div class="card-controls">
											<ul>
												<li>
													<div class="dropdown">
														<a id="card-settings" data-target="#" href="#"
															data-toggle="dropdown" aria-haspopup="true" role="button"
															aria-expanded="false"> <i
															class="card-icon card-icon-settings "></i>
														</a>
														<div class="dropdown-menu dropdown-menu-right" role="menu"
															aria-labelledby="card-settings">
															<a href="#" class="dropdown-item">How to filter </a> <a
																href="#" class="dropdown-item">Resultat</a> <a href="#"
																class="dropdown-item">About</a>
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

											</ul>
										</div>
									</div>
									<div class="card-body">


										<div class="card card-transparent">
											<div class="card-header ">

												<div class="pull-right">
													<input type="text" id="search-table"
														class="form-control pull-right" placeholder="Search">
												</div>
												<div class="pull-left export-options-container "></div>
												<div class="clearfix"></div>
											</div>
											<div class="card-body">
												<table
													class="table table-hover demo-table-search table-responsive-block"
													id="tableWithSearch" >
													<thead>
														<tr class="text-center">
															<th class="v-align-middle text-primary bold fs-12"> <span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-calendar fa-stack-1x"></i>
																</span> <br> Date</th>
																
															<th class="v-align-middle text-primary bold fs-12"> <span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-clock-o fa-stack-1x"></i>
																</span> <br> Time </th>
															<th class="v-align-middle text-primary bold fs-12"> <span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-info fa-stack-1x"></i>
																</span> <br> Description</th>
															 
														</tr>
													</thead>
													<tbody>
													<c:forEach var="incident"
																items="${listIncidentAfterFilter}">
														<tr class="text-center" >
															<td class="text-primary font-montserrat v-align-middle" >${incident.incident_date}</td>
															<td class="text-primary font-montserrat v-align-middle" >${incident.incident_time}</td>
															<td class="text-primary font-montserrat v-align-middle" >${incident.detailsincidents}</td>
															 
															
															</tr>
													</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

                   </c:if>
				</div>

				<jsp:include page="../view/fragments/footer.jsp"></jsp:include>
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
	<script src="<spring:url value="/resources/pages/js/incident.js"/>"></script>
	<script type="text/javascript">
	 
 
		
		
		
		
		
		
		
		$('#tableWithSearch').DataTable();
	    
	    
	    var table = $('#tableWithSearch');
	    
	    var settings = {
	    	    "sDom": "<'exportOptions'T><'table-responsive't><'row'<p i>>",
	    	    "sPaginationType": "bootstrap",
	    	    "destroy": true,
	    	    "scrollCollapse": true,
	    	    "oLanguage": {
	    	        "sLengthMenu": "_MENU_ ",
	    	        "sInfo": "Showing <b>_START_ to _END_</b> Inciendt of _TOTAL_ Incidnets"
	    	    },
	    	    "iDisplayLength": 5,
	    	    "oTableTools": {
	    	        "sSwfPath": "<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/swf/copy_csv_xls_pdf.swf"/>",
	    	        "aButtons": [{
	    	            "sExtends": "csv",
	    	            "sButtonText": "<i class='pg-grid text-primary'></i>",
	    	        }, {
	    	            "sExtends": "xls",
	    	            "sButtonText": "<i class='fa fa-file-excel-o text-primary'></i>",
	    	        }, {
	    	            "sExtends": "pdf",
	    	            "sButtonText": "<i class='fa fa-file-pdf-o text-primary'></i>",
	    	        }, {
	    	            "sExtends": "copy",
	    	            "sButtonText": "<i class='fa fa-copy text-primary'></i>",
	    	        }]
	    	    },
	    	    fnDrawCallback: function(oSettings) {
	    	        $('.export-options-container').append($('.exportOptions'));
	    	    }
	    	};
	    
	    table.dataTable(settings);
	    
		
	    $('#search-table').keyup(function() {
	        table.fnFilter($(this).val());
	    });
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>