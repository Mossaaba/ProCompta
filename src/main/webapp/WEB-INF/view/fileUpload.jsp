<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<title>ProCompta - DN | File</title>
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="icon" href="<spring:url value="/resources/pages/logo.png"/>" />
</head>

<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/dropzone/css/dropzone.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/jquery-confirm.min.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/pages/css/hover.css"/>" />
<body class="fixed-header windows desktop pace-done">
	<jsp:include page="../view/fragments/menu.jsp"></jsp:include>
	<div class="page-container">
		<jsp:include page="../view/fragments/header.jsp"></jsp:include>
		<br>
		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">
			<div class="page-content-wrapper">
				<div class="content ">
					<div class=" container-fluid container-fixed-lg ">
						<div class="row center">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<ul class="nav nav-tabs nav-tabs-linetriangle  nav-stack-sm"
									role="tablist" data-init-reponsive-tabs="dropdownfx">
									<li class="nav-item text-center"><a id="listeAtm"
										class=" title text-uppercase card-title bold  fs-16  text-primary font-montserrat all-caps small   bold text-center "
										data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
											<span><i class="fa fa-cloud-upload fa-3x "
												aria-hidden="true"></i> <spring:message code="label.space"></spring:message></span>
											<span> </span><span> </span> <span> <spring:message code="label.uploadingFile"></spring:message>    </span>
									</a></li>
								</ul>
								<br>
							</div>
							<div class="col-md-3"></div>

						</div>


						<form:form modelAttribute="fileUpload" method="POST"
							enctype="multipart/form-data" id="UploadingForm" role="form">

							<div class="row">
								<div class="col-lg-9">
									<div id="myCard" class="card card-default">
										<div class="card-header ">
											<div class="card-title bold text-primary fs-16 ">
												<i class="fa fa-upload fa-2x" aria-hidden="true"></i>
												<spring:message code="label.uploadingFile"></spring:message> <spring:message code="label.menu"></spring:message>
											</div>
											<div class="card-controls  ">
												<ul>

													<li>
														<div class="dropup show">
															<a class="btn  dropdown-toggle b-dashed b-rad-lg "
																href="#" role="button" id="dropdownMenuLink"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"> <i class="fa fa-history"
																aria-hidden="true"></i> <spring:message code="label.history"></spring:message> 
															</a>

															<div class="dropdown-menu"
																aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item text-primary " data-target="#HostFileHistory"
																	data-toggle="modal" >
																	<label class="text-primary bold "> <i class="fa fa-server" aria-hidden="true"></i>
																	 <spring:message code="label.hostFile"></spring:message> </label>  </a> <a
																	class="dropdown-item text-primary bold" data-target="#JournalHistory"
																	data-toggle="modal"><label class="text-primary bold ">
																	<i class="fa fa-file-o" aria-hidden="true"></i> <spring:message code="label.journal"></spring:message>
																	</label>
																	 </a> 

															</div>
														</div>
													</li>
													<li><a href="#" class="card-collapse"
														id="colpaseAreaUplod" data-toggle="collapse"><i
															class="card-icon card-icon-collapse"></i></a></li>
													 
													<li><a href="#" class="card-maximize"
														data-toggle="maximize"><i
															class="card-icon card-icon-maximize"></i></a></li>

												</ul>
											</div>

										</div>
										<div class="card-header ">
											<br>
											<div class="row">
												<div class="col-md-12 ">
													<div class="row">

														<div class="col-md-5" id="AutolUploadDive">
															<div
																class="form-group form-group-default input-group hvr-grow">
																<div class="form-input-group">
																	<label class="inline"><spring:message code="label.automatic"></spring:message>&nbsp;&nbsp;</label>
																</div>
																<div class="input-group-append h-c-50 ">
																	<span class="input-group-text transparent"> <input
																		type="checkbox" data-init-plugin="switchery"
																		id="AutoUpload" data-size="large" data-color="primary" />

																	</span>
																</div>
															</div>
														</div>
														<div class="col-md-5" id="ManuelUploadDive">
															<div
																class="form-group form-group-default input-group hvr-grow ">
																<div class="form-input-group">
																	<label class="inline"><spring:message code="label.manual"></spring:message></label>
																</div>
																<div class="input-group-append h-c-50">
																	<span class="input-group-text transparent"> <input
																		type="checkbox" data-init-plugin="switchery"
																		id="ManuelUpload" data-size="large"
																		data-color="primary" checked="checked" />
																	</span>
																</div>
															</div>
														</div>
														<div class="col-md-2 pull-left m-t-5" id="nbrFileDive">
															<div class="form-group form-group-default input-group">
																<div class="form-input-group  ">

																	<input type="number"
																		class="form-control usd text-primary bold p-t-15 p-l-5 fs-16 "
																		disabled id="nbrFiles"> <br> <br>

																</div>
																<div
																	class="input-group-append font-montserrat bold text-uppercase ">
																	<br> <span
																		class="input-group-text text-primary font-montserrat bold text-uppercase "><i
																		class="fa fa-file-text-o fa-2x" aria-hidden="true">
																	</i> </span>
																</div>
															</div>
														</div>

														<input id="typeProcessingFile" name="typeProcessingFile"
															type="hidden" value="manuel">

													</div>
												</div>
											</div>


											<div class="row">

												<div class="col-md-4" id="branchDiv">
													<div
														class="form-group form-group-default form-group-default-select2 input-group hvr-grow required">
														<label class=""><spring:message code="label.branchs"></spring:message> </label>
														<form:select path="atm.branch.idBranch"
															cssClass="full-width" id="branch" style="width: 100%;"
															data-init-plugin="select2" items="${listBranches}"
															itemValue="idBranch" itemLabel="nomBranch" />
													</div>
												</div>
												<div class="col-md-4" id="atmDiv">
													<div
														class="form-group form-group-default form-group-default-select2  hvr-grow required"
														id="divATM">
														<label><spring:message code="label.atms"></spring:message></label>
														<form:select path="atm" cssClass="full-width" id="atm"
															data-placeholder="Select an atm here"
															cssStyle="width: 100%;" data-init-plugin="select2" />
													</div>
												</div>

												<div class="col-md-4" id="typeFileDiv">
													<div
														class="form-group form-group-default form-group-default-select2  hvr-grow required"
														id="divTypeFile">
														<label class=""><spring:message code="label.TypeOfFile"></spring:message> </label>
														<form:select path="typeFile" cssClass="full-width"
															id="typeFile" data-placeholder="Select a type of file "
															cssStyle="width: 100%;" data-init-plugin="select2" />
													</div>
												</div>
											</div>
										</div>


										<div class="card-block" id="cardUpload">
											<div class="card-body no-scroll no-padding">

												<div id="mydropzone" class="dropzone">

													<div class="dz-message text-center" data-dz-message
														id="dz-messageDiv">
														<br> <br> <br> <br> <br> <br>

														<span
															class=" center title text-uppercase text-primary  font-montserrat all-caps small bold fs-16">
															<spring:message code="label.instructionToUpload"></spring:message> <br>
															<i class="fa fa-upload  fa-4x hvr-grow-shadow center"
															aria-hidden="true"></i>
														</span>
													</div>
													<div id="dropzonePreview"></div>

												</div>

											</div>
										</div>

									</div>
								</div>

								<div class="col-xl-3 col-lg-12 text-center" id="operationDive">


									<div class="card card-default" id="startProsessingDive">
										<div class="card-header ">
											<div class="card-title text-center bold text-primary fs-16 "><spring:message code="label.startParsingFiles"></spring:message>
											</div>
										</div>
										<div class="card-body">
											<p><spring:message code="label.makeSurForBranchAndAtm"></spring:message>
											</p>


											<button
												class="btn btn-block btn-primary hvr-grow-shadow btn-rounded"
												id="sbmtbtn" type="submit">
												<span class="font-montserrat bold fs-16 m-t-2"><spring:message code="label.start"></spring:message> </span> <span class="m-r-20 m-b-2"><i
													class="fa fa-play-circle fa-2x " aria-hidden="true"></i> </span>
											</button>
										</div>
									</div>



									<div class="card card-default" id="ClearFileDive">
										<div class="card-header ">
											<div class="card-title text-center bold text-primary fs-16  "><spring:message code="label.clearAllFiles"></spring:message> 
											</div>
										</div>
										<div class="card-body">
											<p>
												<spring:message code="label.clearAllFilesAdded"></spring:message> <br>
											</p>
											<button type="button"
												class="btn btn-block btn-warning hvr-grow-shadow btn-rounded"
												id="ClearAllFiles">
												<span class="pull-right"><i
													class="fa fa-eraser  fa-2x" aria-hidden="true"></i> </span> <span
													class="font-montserrat bold fs-16 m-t-2"> <spring:message code="label.clear"></spring:message> </span>
											</button>
										</div>
									</div>


                                   
									 


								</div>
							</div>
						</form:form>


						<!-- ------------------------------------------------------------------------ --->
						<!-----------------------   PARAMETTERS UPLOAD  AUTOMATIQUE    ------------------>
						<!-- ------------------------------------------------------------------------- -->


						<div class="row" id="cardUploadAuto">


							<div
								class="col-md-6 text-primary title text-uppercase font-montserrat bold fs-14">

								<i class="fa fa-chevron-right" aria-hidden="true"></i><spring:message code="label.chooseTypeOfFile"></spring:message>   :  
								 <a href="<spring:url value="/config"/>" class="bold fs-12 b-b "> 
								    <i class="fa fa-cogs" aria-hidden="true"></i> <spring:message code="label.changeConfig"></spring:message>  </a> <br> <br>

								<div class="text-white" role="toolbar">


									<div class="">
										<button type="button"
											class="btn btn-lg btn-primary b-l b-dashed"
											id="journalFileBtnConfig">
											<i class="fa fa-file-o" aria-hidden="true"></i> <spring:message code="label.journal"></spring:message>
										</button>
										<button type="button"
											class="btn btn-lg btn-primary b-l b-dashed "
											id="HostFileBtnConfig">
											<i class="fa fa-server" aria-hidden="true"></i> <spring:message code="label.hostFile"></spring:message>
										</button>

									</div>
								</div>
							</div>

						</div>

						<div class="row" id="cardUploadAuto">


							<div class="col-md-12">

								<br>

								<div class="row card-body" id="rowUplaodParametter">




									<div class="card-block" id="cardUploadAuto">
										<div class="card-body no-scroll ">

											<div class=" container-fluid   container-fixed-lg">



												<!-- ------------------------------------------------------------------------ --->
												<!-----------------------  host file ---------------------     ------------------>
												<!-- ------------------------------------------------------------------------- -->


												<div class="card card-transparent" id="divUploadHostFile">
													<div class="card-header ">
														<div class="card-title text-primary bold">
															<i class="fa fa-sliders fa-2x" aria-hidden="true"></i>
															<spring:message code="label.UploadinghostFileParam"></spring:message> :  
														</div>
													</div>
													<div class="card-body">
													<span class="bold"> <spring:message code="label.type"></spring:message> : <label class="text-primary bold"> ${typeUploadHost} </label></span><br>
													<span  class="bold" > <spring:message code="label.time"></spring:message> : <label class="text-primary bold">${HostHour} <spring:message code="label.hour"></spring:message></label> : 
													<label class="text-primary bold">${HostMin} <spring:message code="label.minutes"></spring:message> </label> </span>

													</div>
												</div>

												<!-- ------------------------------------------------------------------------ --->
												<!-----------------------  JRN     ------------------>
												<!-- ------------------------------------------------------------------------- -->

												<div class="card card-transparent" id="divUploadJournal">
													<div class="card-header ">
														<div class="card-title text-primary bold">
															<i class="fa fa-sliders fa-2x" aria-hidden="true"></i>
															<spring:message code="label.UploadingJournalFileParam"></spring:message> 
														</div>
													</div>
													<div class="card-body">
													<span class="bold"> <spring:message code="label.type"></spring:message> : <label class="text-primary bold"> ${typeUpload} </label></span><br>
													<span  class="bold" > <spring:message code="label.time"></spring:message> : <label class="text-primary bold">${jrnHour} <spring:message code="label.hour"></spring:message></label> : 
													<label class="text-primary bold">${jrnMin} <spring:message code="label.minutes"></spring:message></label> </span>

													</div>
												</div>

											</div>



										</div>
									</div>


								</div>

							</div>

						</div>


					</div>



				</div>
			</div>
		</div>
	</div>






	<div class="modal fade slide-up disable-scroll" id="modalSlideUp"
		tabindex="-1" role="dialog" aria-hidden="false" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-lg ">
			<div class="modal-content-wrapper">
				<div class="modal-content">

					<div
						class="modal-header clearfix bg-primary text-white text-center">
						<h5>
							<span
								class="text-white title text-uppercase font-montserrat all-caps small bold"><i
								class="fa fa-info-circle" aria-hidden="true"></i> <spring:message code="label.parsingResult"></spring:message>  </span>
						</h5>
						 
					</div>

					<div class="modal-body">

						<br>
						<div class="row">

							<div class="col-md-12 ">

								<div class="card card-default hover-stroke">
									<div class="card-body no-padding">
										<div class="container-sm-height">
											<div class="row row-sm-height  b-grey  b-dashed ">
												<div class="col-md-12 ">
													<br>
													<p class="font-montserrat bold text-uppercase ">
														<i class="fa fa-tasks" aria-hidden="true"></i> <spring:message code="label.progression"></spring:message>
													</p>
													<div class="row">
														<div class="col-md-8  ">
															<div style="width: 100%">
																<div class="progress m-t-15" id="progresUploadBarre">
																	<div class="progress-bar progress-bar-primary"
																		style="width: 0; hight: 100%;" id="progresUpload"></div>
																</div>
															</div>
														</div>

														<div class="col-md-2 ">
															<div class="input-group  m-b-15">
																<div class="input-group ">

																	<input type="text" value=""
																		class="form-control text-primary bold fs-10" disabled
																		id="pourcentage">


																</div>
															</div>
														</div>

														<div class="col-md-2 ">
															<div class="input-group transparent m-b-15">
																<div class="input-group m-b-15">


																	<span class="pull-right" id="progressing"> <i
																		class="fa fa-spinner fa-pulse fa-3x fa-fw text-primary "></i>
																	</span> <span id="status"
																		class="font-montserrat bold fs-10 m-t-2"> <spring:message code="label.inProgress"></spring:message>  </span>

																</div>
															</div>
														</div>


													</div>

												</div>

											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

						<br>
						<div class="row">

							<div class="col-md-12">


								<div id="myCardX" class="card card-default ">
									<div class="card-header ">
										<div
											class="card-title titel font-montserrat bold text-uppercase fs-14 ">
											<i class="fa fa-info-circle" aria-hidden="true"></i> <spring:message code="label.infosFilesParsed"></spring:message>  
										</div>

									</div>

									<div class="card-block">
										<div class="row">

											<div class="col-lg-12">

												<div class="card card-transparent scrollable">
													<div class="demo-card-scrollable">
														<div class="card-body" id="infos"></div>

													</div>

												</div>

											</div>
										</div>
									</div>
								</div>

							</div>


						</div>

					</div>
					<div class="modal-footer   clearfix   text-center">


						<div class="col-sm-3">
							<button type="button"
								class="btn btn-primary btn-lg btn-large btn-block"
								data-dismiss="modal">
								<i class="fa fa-close" aria-hidden="true"></i> <spring:message code="label.close"></spring:message>
							</button>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>



	<div class="modal   fade slide-up disable-scroll"
		id="modalSlideUpErrore" tabindex="-1" role="dialog"
		aria-hidden="false" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-sm">
			<div class="modal-content-wrapper">
				<div class="modal-content">
					<div class="modal-header clearfix text-left">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<i class="pg-close fs-14"></i>
						</button>
						<h5>
							<span class="semi-bold text-danger"> <i
								class="fa fa-exclamation-triangle" aria-hidden="true"></i>
								<spring:message code="label.uploadingFile"></spring:message> 
							</span>
						</h5>

					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group-attached">
								<div class="row scrollable ">
									<div class="col-md-12 scrollable">
										<div class="form-group form-group-default text-danger">
											<label id="infosError"> </label>

										</div>
									</div>
								</div>

							</div>
						</form>
						<div class="row">
							<div class="col-md-4 m-t-10 sm-m-t-10 pull-right">
								<button type="button"
									class="btn btn-sm btn-danger btn-block m-t-5"
									data-dismiss="modal" aria-hidden="true"> <spring:message code="label.close"></spring:message> </button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<div class="modal fade slide-right" id="JournalHistory" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content-wrapper">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<i class="pg-close fs-14"></i>
					</button>
					<div class="container-xs-height full-height">
						<div class="row-xs-height">
							<div class="modal-body col-xs-height col-middle text-center   ">
								<h5 class="text-primary ">
									<i class="fa fa-file-text-o" aria-hidden="true"></i><spring:message code="label.journal"></spring:message>  <spring:message code="label.history"></spring:message> 
									 
								</h5>
								<br>

								<div class="table-responsive">
									<table class="table table-hover table-condensed table-detailed"
										id="detailedTable">
										<thead>
											<tr>
												<th style="width: 25%"><spring:message code="label.dateAndTime"></spring:message></th>
												<th style="width: 25%"><spring:message code="label.atmName"></spring:message></th>

											</tr>
										</thead>
										<tbody>
										
										<c:forEach var="journal" items="${listJournal}">
										
										
										
											<tr id="${journal.idjournal}">
                                                   <c:set var = "dateToShow" value = "${fn:substring(journal.dateJournal, 0, 10)}" />
												<td class="v-align-middle semi-bold">${dateToShow} ${journal.timeUploadJournal}</td>
												<td class="v-align-middle">${journal.atm.nameAtm}</td>
											</tr>
											 
										</c:forEach>	 
											 
										</tbody>
									</table>
								</div>
								<button type="button" class="btn btn-danger btn-block"
									data-dismiss="modal"><spring:message code="label.close"></spring:message></button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>


	<div class="modal fade slide-right" id="HostFileHistory" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content-wrapper">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<i class="pg-close fs-14"></i>
					</button>
					<div class="container-xs-height full-height">
						<div class="row-xs-height">
							<div class="modal-body col-xs-height col-middle text-center   ">
								<h5 class="text-primary "><spring:message code="label.hostFile"></spring:message>  <spring:message code="label.history"></spring:message></h5>
								<br>

								<div class="table-responsive">
									<table class="table table-hover table-condensed "
										id="HostFiledetailedTable">
										<thead>
											<tr>
												<th style="width: 25%"><spring:message code="label.dateAndTime"></spring:message></th>
												<th style="width: 25%"><spring:message code="label.hostFileName"></spring:message></th>
											 

											</tr>
										</thead> 
										<tbody>
										<c:forEach var="hostFile" items="${listHostFile}">
											<tr>
                                                 <c:set var = "dateHostFileToShow" value = "${fn:substring(hostFile.dateUplaodHostFile, 0, 10)}" />
                                                 <td class="v-align-middle">${dateHostFileToShow} ${hostFile.timeUploadHostFile}</td>
												<td class="v-align-middle semi-bold">${hostFile.nameHostFile}</td>
												
											 
											</tr>
											 </c:forEach>
										</tbody>
									</table>
								</div>





								<button type="button" class="btn btn-danger btn-block"
									data-dismiss="modal"><spring:message code="label.close"></spring:message></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

 
	
	

	<script
		src="<spring:url value="/resources/assets/plugins/dropzone/dropzone.min.js"/>"></script>
	<script src="<spring:url value="/resources/pages/js/upload.js"/>"></script>

	<script type="text/javascript">
		(function($) {
			'use strict';
			var initBasicTable = function()
			{
				var table = $('#basicTable');
				var settings = {
					"sDom" : "t",
					"destroy" : true,
					"paging" : false,
					"scrollCollapse" : true,
					"aoColumnDefs" : [ {
						'bSortable' : false,
						'aTargets' : [ 0 ]
					} ],
					"order" : [ [ 1, "desc" ] ]
				};
				table.dataTable(settings);
				$('#basicTable input[type=checkbox]').click(function() 
				{
					if ($(this).is(':checked')) {
						$(this).closest('tr').addClass('selected');
					} else {
						$(this).closest('tr').removeClass('selected');
					}
				});
			}
			var initStripedTable = function() {
				var table = $('#stripedTable');
				var settings = {
					"sDom" : "t",
					"destroy" : true,
					"paging" : false,
					"scrollCollapse" : true
				};
				table.dataTable(settings);
			}
			
			
			var initDetailedViewTable = function() {
				
				
				
				var _format = function(d) 
				{
					return '<table class="table table-inline">'
							+ '<tr>'
							+ '<td> <spring:message code="label.transaction"></spring:message> </td>'
							+ '<td><span class="label label-info">'+d.nbrTransactions+'</span></td>'
							+ '</tr>'
							+ '<tr>'
							+ '<td> <spring:message code="label.incident"></spring:message> </td>'
							+ '<td><span class="label label-info">'+d.nbrIncidents+'</span></td>'
							+ '</tr>'
							+ '<tr>'
							+ '<td> <spring:message code="label.replanishment"></spring:message> </td>'
							+ '<td><span class="label label-info">'+d.nbrReplenishements+'</span></td>'
							+ '</tr>'
							+ '<tr>'
							+ '<td> <spring:message code="label.errorsATM"></spring:message> </td>'
							+ '<td><span class="label label-info">'+d.nbrErrorsATM+'</span></td>'
							+ '</tr>' + '</table>';
				}
				var table2 = $('#HostFiledetailedTable'); 
				table2.DataTable({
					"sDom" : "ltip",
					"scrollCollapse" : true,
					"paging" : true,
					"bSort" : false
				});
				var table = $('#detailedTable');
				table.DataTable({
					"sDom" : "ltip",
					"scrollCollapse" : true,
					"paging" : true,
					"bSort" : false
				});
				$('#detailedTable tbody').on(
						'click',
						'tr',
						function() {
							if ($(this).hasClass('shown')&& $(this).next().hasClass('row-details')) 
							{
								$(this).removeClass('shown');
								$(this).next().remove();
								return;
							}
							
							
							var tr = $(this).closest('tr');
							var row = table.DataTable().row(tr);
							
							$(this).parents('tbody').find('.shown').removeClass('shown');
							$(this).parents('tbody').find('.row-details').remove();
							
							var idJournal = $(this).closest('tr').attr('id');
							$
							.ajax({
								url : '${pageContext.request.contextPath}/getjournal-'
										+idJournal+'',
								method : 'GET',
								contentType : "application/json",
								timeout : 600000,
								success : function(data) 
								{

									row.child(_format(data)).show();
									tr.addClass('shown');
									tr.next().addClass('row-details');

								},

								error : function(xhr, status, error) {

								}
							});
							
							
							
							
						});
			}
			var initCondensedTable = function() {
				var table = $('#condensedTable');
				var settings = {
					"sDom" : "t",
					"destroy" : true,
					"paging" : false,
					"scrollCollapse" : true
				};
				table.dataTable(settings);
			}
			initBasicTable();
			initStripedTable();
			initDetailedViewTable();
			initCondensedTable();
		})(window.jQuery);

		
		
		
		
		
		Dropzone.autoDiscover = false;
		Dropzone.options.mydropzone = false;
		$(document)
				.ready(
						function() {

							myDropzone = new Dropzone(
									'#mydropzone',

									{

										url : "upload?${_csrf.parameterName}=${_csrf.token}",

										maxFiles : null,

										uploadMultiple : true,

										parallelUploads : 100,

										maxFilesize : 256, // MB

										timeout : 60000,

										autoProcessQueue : false,

										addRemoveLinks : true,

										acceptedFiles : '.jrn,.LOG,.txt',

										ignoreHiddenFiles : true,
										dictDefaultMessage : "Please drop journal or  log file here to be uploaded",
										dictFallbackMessage : "Your browser does not support drag'n'drop file uploads.",
										dictFallbackText : "Please use the fallback form below to upload your files like in the olden days.",
										dictFileTooBig : "File is too big ({{filesize}}MiB). Max filesize: {{maxFilesize}}MiB.",
										dictInvalidFileType : "You can't upload files of this type.",
										dictResponseError : "Server responded with {{statusCode}} code.",
										dictCancelUpload : "Cancel upload",
										dictCancelUploadConfirmation : "Are you sure you want to cancel this upload?",
										dictRemoveFile : "<span class='text-danger hvr-grow-shadow'> <i class='fa fa-trash-o' aria-hidden='true'></i>  Remove file</span> ",
										dictMaxFilesExceeded : "You can not upload any more files. thank ",

										headers : {
											'X-CSRFToken' : $(
													'meta[name="token"]').attr(
													'content')
										},
										accept : function(file, done) {
											console.log("uploaded");
											$('.dz-message').hide();
											done();
										},
										error : function(file, msg) {
											$('#modalSlideUpErrore').modal(
													'show');
											$("#infosError").html(msg);
											myDropzone.removeAllFiles();
										},

										init : function() {

											var myDropzone = this;
											var stillSending = false;
											var nbrFile = 0;
											this
													.on(
															"addedfile",
															function(file) {
																nbrFile++;
																$("#nbrFiles")
																		.val(
																				nbrFile);
																$(
																		"#ClearFileDive")
																		.show();
																$(
																		"#startProsessingDive")
																		.show();
															});

											this.on("removedfile", function(
													file) {
												nbrFile--;
												$("#nbrFiles").val(nbrFile);

												if (nbrFile == '0') {

													$("#ClearFileDive").hide();
													$("#startProsessingDive")
															.hide();
													$('.dz-message').show();

												}

											});

											this
													.on(
															"sendingmultiple",
															function(file, xhr,
																	formData) {
																var type = $(
																		'#typeFile')
																		.val();
																var atm = $(
																		'#atm')
																		.val();
																var typeProcessingFile = $(
																		'#typeProcessingFile')
																		.val();

																if (atm === null) {

																	atm = 000;

																}
																formData
																		.append(
																				"typeFile",
																				type);
																formData
																		.append(
																				"idAtm",
																				atm);
																formData
																		.append(
																				"typeProcessingFile",
																				typeProcessingFile);

															});

											this.on("processingmultiple",
													function(file, progress)

													{

													});

											this
													.on(
															"totaluploadprogress",
															function(
																	uploadProgress) {

																document
																		.querySelector("#progresUpload").style.width = uploadProgress
																		+ "%";
																document
																		.querySelector("#pourcentage").value = uploadProgress
																		+ "%";

																if (uploadProgress != '100') {

																	$(
																			'#CloseResponse')
																			.hide();

																} else

																{

																	$(
																			'#progressing')
																			.html(
																					"<span class='pull-right' id='progressing'><i class='fa fa-check-circle fa-3x text-primary'></i> </span>");
																	$('#status')
																			.text(
																					"Done");
																	$(
																			'#CloseResponse')
																			.show();

																}

															});

											this.on("completemultiple",
													function(file) {

														this.removeAllFiles();
														stillSending = false;

													});

											this.on('resetFiles', function() {
												this.removeAllFiles();

											});
											this.on('resetFiles', function() {
												this.removeAllFiles();
											});

											this.on("queuecomplete", function(
													progress) {

											});

											this
													.on(
															"successmultiple",
															function(files,
																	serverResponse) {
																showInformationDialog(
																		files,
																		serverResponse);
															});

											$("#ClearAllFiles")
													.on(
															"click",
															function() {

																myDropzone
																		.emit("resetFiles");
																nbrFile = 0;
																$("#nbrFiles")
																		.val(
																				"0");
																$(
																		"#ClearFileDive")
																		.hide();
																$(
																		"#startProsessingDive")
																		.hide();
																$(
																		"#dz-messageDiv")
																		.show();

															});

											document.getElementById("sbmtbtn").onclick = function(
													e) {
												e.preventDefault();
												var files = myDropzone
														.getQueuedFiles();

												var atmValue = $("#atm").val();
												var typeFileValue = $(
														"#typeFile").val()
														.trim();
												var TypeProcessingFile = $(
														"#atm").val();

												if ((atmValue == null && typeFileValue === '1')
														|| (atmValue == null && typeFileValue === '-1')

												) {

													console.log(atmValue);
													$
															.confirm({ 
																title : '<spring:message code="label.titleError"></spring:message> !',
																content : '<spring:message code="label.selectAtmAndTypeFile"></spring:message>',
																type : 'red',
																animation : 'left',
																icon : 'fa fa-exclamation-circle fa-spin',
																typeAnimated : true,
																buttons : {

																	close : {
																		text : 'Close',
																		btnClass : 'btn-red',
																		action : function() {
																			$(
																					'#divTypeFile')
																					.addClass(
																							'bg-danger');
																			$(
																					'#divATM ')
																					.addClass(
																							'bg-danger');
																		}

																	}
																}
															});

													return false;

												}

												console.log(atmValue);
												console.log(typeFileValue);

												files.forEach(function(file) {
													myDropzone
															.processFile(file);
												});

											};

											function showInformationDialog(
													files, objectArray) {

												var responseContent = "";

												for (var i = 0; i < objectArray.length; i++) {

													var infoObject = objectArray[i];

													for ( var infoKey in infoObject) 
													{
														if ( (new String(infoKey).valueOf() == new String('id').valueOf())  || 
															 (new String(infoKey).valueOf() == new String('fileDateUploaded').valueOf()) ||
															 (new String(infoKey).valueOf() == new String('location').valueOf()) || 
															 (new String(infoKey).valueOf() == new String('size').valueOf()) )
														{
															
															
															
															responseContent = responseContent + ""; 
															
															
														}
														else if (new String(infoKey).valueOf() == new String('infos').valueOf()) 
							                            {
															responseContent = responseContent + " " +"<span class='font-montserrat   text-primary bold fs-16'> <i class='fa fa-file-code-o' aria-hidden='true'></i> "  +  "<spring:message code='label.infos'></spring:message> " 
							                                 +" : " +  " </span>" + "<span class='bold fs-16 text-danger'>  "  + infoObject[infoKey] +  " </span>" +" <br> ";
															
														}
														
														else if (new String(infoKey).valueOf() == new String('name').valueOf()) 
							                            {
															responseContent = responseContent + " " +"<span class='font-montserrat   text-primary bold fs-16'> <i class='fa fa-file-code-o' aria-hidden='true'></i> "  +  "<spring:message code='label.fileName'></spring:message> " 
							                                 +" : " +  " </span>" + "<span class='bold fs-16'>  "  + infoObject[infoKey] +  " </span>" +" <br> ";
															
														}
														else if (new String(infoKey).valueOf() == new String('type').valueOf()) 
							                            {
															responseContent = responseContent + " " +"<span class='font-montserrat   text-primary bold fs-16'> <i class='fa fa-file' aria-hidden='true'></i> "  +  "<spring:message code='label.TypeOfFile'></spring:message> " 
							                                 +" : " +  " </span>" + "<span class='bold fs-16'>  "  + infoObject[infoKey] +  " </span>" +" <br> ";
															
														}
														else if (new String(infoKey).valueOf() == new String('nbrTransactions').valueOf()) 
							                            {
															responseContent = responseContent + " " +"<span class='font-montserrat   text-primary bold fs-16'> <i class='fa fa-exchange' aria-hidden='true'></i> "  +  "<spring:message code='label.nbrTransaction'></spring:message>" 
							                                 +" : " +  " </span>" + "<span class='bold fs-16'>  "  + infoObject[infoKey] +  " </span>" +" <br> ";
															
														}
														else if (new String(infoKey).valueOf() == new String('nbrReplenishements').valueOf()) 
							                            {
															responseContent = responseContent + " " +"<span class='font-montserrat   text-primary bold fs-16'> <i class='fa fa-plus-square' aria-hidden='true'></i> "  +  "<spring:message code='label.nbrReplenishement'></spring:message>"  
							                                 +" : " +  " </span>" + "<span class='bold fs-16'>  "  + infoObject[infoKey] +  " </span>" +" <br> ";
															
														}
														else if (new String(infoKey).valueOf() == new String('nbrIncidents').valueOf()) 
							                            {
															responseContent = responseContent + " " +"<span class='font-montserrat   text-primary bold fs-16'> <i class='fa fa-flash text-warning' aria-hidden='true'></i> "  +  "  <spring:message code='label.nbrIncidents'></spring:message>" 
							                                 +" : " +  " </span>" + "<span class='bold fs-16'>  "  + infoObject[infoKey] +  " </span>" +" <br> ";
															
														}
														else if (new String(infoKey).valueOf() == new String('nbrErrorsATM').valueOf()) 
							                            {
															responseContent = responseContent + " " +"<span class='font-montserrat   text-primary bold fs-16'> <i class='fa fa-exclamation-triangle text-danger' aria-hidden='true'></i> "  +  "<spring:message code='label.nbrAtmErrors'></spring:message> " 
							                                 +" : " +  " </span>" + "<span class='bold fs-16'>  "  + infoObject[infoKey] +  " </span>" +" <br> ";
															
														}
														
														
														else  {
														
														if (infoObject.hasOwnProperty(infoKey)) 
														{
															 
															 
															responseContent = responseContent + " " +"<span class='font-montserrat   text-primary bold fs-16'>  "  +  infoKey 
															                                 +" : " +  " </span>" + "<span class='bold fs-16'>  "  + infoObject[infoKey] +  " </span>" +" <br> ";
														}}
													}
													responseContent = responseContent
															+ "<hr> "+ "<hr>";
												}

												$('#modalSlideUp')
														.modal('show');
												$("#infos").append(
														responseContent);

											}

										}

									});

						});
	</script>

	<script
		src="<spring:url value="/resources/assets/jquery-confirm.min.js"/>"></script>

</body>



</html>