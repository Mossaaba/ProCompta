<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
</head>
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/dropzone/css/dropzone.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/jquery-confirm.min.css"/>" />	
 
	 
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/pages/css/hover.css"/>" />
<style>
</style>


<body class="fixed-header windows desktop pace-done">
	<jsp:include page="../view/fragments/menu.jsp"></jsp:include>
	<div class="page-container">
		<jsp:include page="../view/fragments/header.jsp"></jsp:include>
		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">
			<div class="page-content-wrapper">
				<div class="content ">
					<div class=" container-fluid container-fixed-lg ">
						<ul class="nav nav-tabs nav-tabs-linetriangle   nav-stack-sm "
							role="tablist" data-init-reponsive-tabs="dropdownfx">
							<li class="nav-item"><a id="listeAtm"
								class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold"
								data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
									<span> <spring:message code="label.space"></spring:message>
								</span><span> </span><span> </span><i class="fa fa-cloud-upload fa-3x "
									aria-hidden="true"></i> <span>Uploding Journal files </span>
							</a></li>
						</ul>
						<br>
						<form:form modelAttribute="fileUpload"  method="POST"  enctype="multipart/form-data" id ="UploadingForm" role="form">

							<div class="row">
								<div class="col-lg-9">
									<div id="myCard" class="card card-default">
										<div class="card-header ">
													<div class="card-title bold text-primary fs-16 ">
														<i class="fa fa-upload" aria-hidden="true"></i> Uplodaing
														journal file
													</div>
											         <div class="card-controls  ">
														<ul>
															<li>
																<div class="dropup show">
															  <a class="btn  dropdown-toggle b-dashed b-rad-lg " href="#" role="button" id="dropdownMenuLink" 
															  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															    <i class="fa fa-history" aria-hidden="true"></i> History 
															  </a>
															
															  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
															    <a class="dropdown-item" data-target="#HostFileHistory" data-toggle="modal">Host File</a>
															    <a class="dropdown-item"  data-target="#JournalHistory" data-toggle="modal" >Journal</a>
															  
															  </div>
															</div>
															</li>
															<li><a href="#" class="card-collapse"
																id="colpaseAreaUplod" data-toggle="collapse"><i
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
										<div class="card-header ">
											<br>
											<div class="row">
												<div class="col-md-12 ">
													<div class="row">
                                                        
														<div class="col-md-5" id="AutolUploadDive">
															<div
																class="form-group form-group-default input-group hvr-grow">
																<div class="form-input-group">
																	<label class="inline">Automatic&nbsp;&nbsp;</label>
																</div>
																<div class="input-group-append h-c-50 ">
																	<span class="input-group-text transparent"> <input
																		type="checkbox" data-init-plugin="switchery"
																		id="AutoUpload" data-size="large" data-color="primary"  />
																		
																	</span>
																</div>
															</div>
														</div>
														<div class="col-md-5" id="ManuelUploadDive">
															<div
																class="form-group form-group-default input-group hvr-grow ">
																<div class="form-input-group">
																	<label class="inline">Manuel</label>
																</div>
																<div class="input-group-append h-c-50">
																	<span class="input-group-text transparent"> <input
																		type="checkbox" data-init-plugin="switchery"
																		id="ManuelUpload" data-size="large" data-color="primary" checked="checked"/>	
																	</span>
																</div>
															</div>
														</div>
														<div class="col-md-2 pull-left m-t-5" id="nbrFileDive" >
														<div class="form-group form-group-default input-group">
															<div class="form-input-group  ">
																 
																<input type="number" class="form-control usd text-primary bold p-t-15 p-l-5 fs-16 " disabled id="nbrFiles" > 
															<br>
															<br>
															 
															</div>
															<div class="input-group-append font-montserrat bold text-uppercase ">
															<br>
																<span class="input-group-text text-primary font-montserrat bold text-uppercase "><i class="fa fa-file-text-o fa-2x" aria-hidden="true"> </i>   </span>
															</div>
														</div>
													</div>
												 
														<input id="typeProcessingFile" name="typeProcessingFile" type="hidden" value="manuel">
														
													</div>
												</div>
											</div>
											<div class="row">

												<div class="col-md-4" id="branchDiv">
													<div
														class="form-group form-group-default form-group-default-select2 input-group hvr-grow required">
														<label class="">Branche </label>
														<form:select path="atm.branch.idBranch"
															cssClass="full-width" id="branch" style="width: 100%;"
															data-init-plugin="select2" items="${listBranches}"
															itemValue="idBranch" itemLabel="nomBranch"   />
													</div>
												</div>
												<div class="col-md-4" id="atmDiv">
													<div
														class="form-group form-group-default form-group-default-select2  hvr-grow required" id="divATM">
														<label >ATM</label>
														<form:select path="atm" cssClass="full-width" id="atm"
															data-placeholder="Select an atm here"  
															cssStyle="width: 100%;" data-init-plugin="select2"  /> 
													</div> 
												</div>
												
												<div class="col-md-4" id="typeFileDiv">
													<div 
														class="form-group form-group-default form-group-default-select2  hvr-grow required" id="divTypeFile" >
														<label class="">Type File </label>
														<form:select path="typeFile" cssClass="full-width" id="typeFile"
															data-placeholder="Select a type of file "
															cssStyle="width: 100%;" data-init-plugin="select2" /> 
													</div>
												</div>
												</div>
										</div>


										<div class="card-block" id="cardUpload">
											<div class="card-body no-scroll no-padding">

												<div id="mydropzone" class="dropzone" >
												
                                                   <div class="dz-message text-center" data-dz-message id="dz-messageDiv">
                                                   <br> <br> <br>   <br>  <br>   <br>
                                                  
                                                   <span class=" center title text-uppercase text-primary  font-montserrat all-caps small bold fs-16">
                                                   Please drop journal or log file here to be uploaded 
                                                   <br>
                                                   <i class="fa fa-upload  fa-4x hvr-grow-shadow center" aria-hidden="true"></i> 
                                                   </span>
                                                   </div>
													<div id="dropzonePreview"></div>
													 
												</div>

											</div>
										</div>
									</div>
								</div>

								<div class="col-xl-3 col-lg-12 text-center">
									
									
									<div class="card card-default" id="startProsessingDive">
										<div class="card-header ">
											<div class="card-title text-center bold text-primary fs-16 ">Start
												parsing Files</div>
										</div>
										<div class="card-body">
											<p>please make sure for the branch and the atm selected.</p>
											
											
											<button class="btn btn-block btn-primary hvr-grow-shadow btn-rounded"
												id="sbmtbtn" type="submit"  >
												<span class="font-montserrat bold fs-16 m-t-2"> Start
													parsing files </span> 
													<span class="m-r-20 m-b-2"><i
													class="fa fa-play-circle fa-2x " aria-hidden="true"></i> </span>
											</button>
										</div>
									</div>
									
									
									
									<div class="card card-default" id="ClearFileDive" >
										<div class="card-header ">
											<div class="card-title text-center bold text-primary fs-16  ">Clear
												all files</div>
										</div>
										<div class="card-body">
											<p>
												Clear all file already uploded . <br>
											</p>
											<button type="button"
												class="btn btn-block btn-warning hvr-grow-shadow btn-rounded"
												id="ClearAllFiles">
												<span class="pull-right"><i
													class="fa fa-eraser  fa-2x" aria-hidden="true"></i> </span> <span
													class="font-montserrat bold fs-16 m-t-2"> Clear All
													file </span>
											</button>
										</div>
									</div>
									
									
									
									<div class="card card-default" id="testConexion">
										<div class="card-header ">
											<div class="card-title text-center bold text-primary fs-16  ">Test
												Connexion</div>
										</div>
										<div class="card-body">
											<p>Please select a barnch and an ATM befor testing the
												connexion .</p>
											<button type="button"
												class="btn btn-block btn-complete hvr-pulse-grow btn-rounded">
												<span class="pull-right"><i
													class="fa fa-signal fa-2x" aria-hidden="true"></i> </span> <span
													class="font-montserrat bold fs-16 m-t-2"> Test
													Connexion </span>
											</button>

										</div>
									</div>
									
									
								</div>
							</div>
						</form:form>
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
								class="fa fa-info-circle" aria-hidden="true"></i> Parsing Result</span>
						</h5>
						<p class="p-b-10 text-white font-montserrat ">The informations
							showed bellow are some statistic of parsing result.</p>
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
													<p class="font-montserrat bold text-uppercase "> <i class="fa fa-tasks" aria-hidden="true"></i> Progression</p>
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
																		class="font-montserrat bold fs-10 m-t-2"> En cours </span>

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
										<div class="card-title font-montserrat bold">Infos</div>
										<div class="card-controls">
											<ul>
												<li>
													<div class="dropdown">
														<a id="card-settings" data-target="#" href="#"
															data-toggle="dropdown" aria-haspopup="true" role="button"
															aria-expanded="false"> <i
															class="card-icon card-icon-settings "></i>
														</a> ​
														<ul class="dropdown-menu pull-right" role="menu"
															aria-labelledby="card-settings">
															<li><a href="#">Item 1</a></li>
															<li><a href="#">Item 2</a></li>
														</ul>
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
												<li><a href="#" class="card-close" data-toggle="close"><i
														class="card-icon card-icon-close"></i></a></li>
											</ul>
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
								data-dismiss="modal">Close</button>
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
								Upload File
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
									data-dismiss="modal" aria-hidden="true">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	
<div class="modal fade slide-right" id="JournalHistory" tabindex="-1" role="dialog" aria-hidden="true">
<div class="modal-dialog ">
<div class="modal-content-wrapper">
<div class="modal-content">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
</button>
<div class="container-xs-height full-height">
<div class="row-xs-height">
<div class="modal-body col-xs-height col-middle text-center   ">
<h5 class="text-primary "> <i class="fa fa-file-text-o" aria-hidden="true"></i> Journal File history</h5>
<br>

<div class="table-responsive">
<table class="table table-hover table-condensed table-detailed" id="detailedTable">
<thead>
<tr>
<th style="width:25%">DATE</th>
<th style="width:25%">ATM</th>
 
</tr>
</thead>
<tbody>
<tr>
 
<td class="v-align-middle semi-bold">DATE</td>
<td class="v-align-middle">ProCashX</td>
</tr>
<tr>
 
<td class="v-align-middle semi-bold">DATE</td>
<td class="v-align-middle">ProCashX</td>
</tr>
<tr>
 
<td class="v-align-middle semi-bold">DATE</td>
<td class="v-align-middle">ProCashX</td>
</tr>
<tr>
 
<td class="v-align-middle semi-bold">DATE</td>
<td class="v-align-middle">ProCashX</td>
</tr>
</tbody>
</table>
</div> 
<button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Cancel</button>
</div>
</div>
</div>
</div>
</div>

</div>

</div>


<div class="modal fade slide-right" id="HostFileHistory" tabindex="-1" role="dialog" aria-hidden="true">
<div class="modal-dialog ">
<div class="modal-content-wrapper">
<div class="modal-content">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
</button>
<div class="container-xs-height full-height">
<div class="row-xs-height">
<div class="modal-body col-xs-height col-middle text-center   ">
<h5 class="text-primary ">Host file </h5>
<br>

<div class="table-responsive">
<table class="table table-hover table-condensed table-detailed" id="detailedTable">
<thead>
<tr>
<th style="width:25%">DATE</th>
<th style="width:25%">ATM</th>
 
</tr>
</thead>
<tbody>
<tr>
 
<td class="v-align-middle semi-bold">40,000 USD</td>
<td class="v-align-middle">April 13, 2014</td>
</tr>
<tr>
 
<td class="v-align-middle semi-bold">70,000 USD</td>
<td class="v-align-middle">April 13, 2014</td>
</tr>
<tr>
 
<td class="v-align-middle semi-bold">20,000 USD</td>
<td class="v-align-middle">April 13, 2014</td>
</tr>
<tr>
 
<td class="v-align-middle semi-bold">90,000 USD</td>
<td class="v-align-middle">April 13, 2014</td>
</tr>
</tbody>
</table>
</div>





<button type="button" class="btn btn-default btn-block" data-dismiss="modal">Cancel</button>
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

		
		
		
		
		(function($){'use strict';
		var initBasicTable=function()
		{
			var table=$('#basicTable');
		      var settings={"sDom":"t",
				"destroy":true,
				"paging":false,
				"scrollCollapse":true,
				"aoColumnDefs":[{'bSortable':false,'aTargets':[0]}],"order":[[1,"desc"]]};
		table.dataTable(settings);$('#basicTable input[type=checkbox]').click(function()
				{if($(this).is(':checked')){$(this).closest('tr').addClass('selected');}else{$(this).closest('tr').removeClass('selected');}});}
		var initStripedTable=function(){var table=$('#stripedTable');var settings={"sDom":"t","destroy":true,"paging":false,"scrollCollapse":true};
		table.dataTable(settings);}
		var initDetailedViewTable=function(){var _format=function(d){return '<table class="table table-inline">'+
		'<tr>'+
		'<td> Transaction </td>'+
		'<td><span class="label label-info">nbr Transactions</span></td>'+
		'</tr>'+
		'<tr>'+
		'<td> Incident </td>'+
		'<td><span class="label label-info">nbr Incidents</span></td>'+
		'</tr>'+
		'<tr>'+
		'<td> Errors </td>'+
		'<td><span class="label label-info">nbr Errors</span></td>'+
		'</tr>'+
		'<tr>'+
		'<td> Replanishment </td>'+
		'<td><span class="label label-info">nbr Replinshement</span></td>'+
		'</tr>'+
		'</table>';}
		var table=$('#detailedTable');table.DataTable({"sDom":"ltip","scrollCollapse":true,"paging":true,"bSort":false});$('#detailedTable tbody').on('click','tr',function(){if($(this).hasClass('shown')&&$(this).next().hasClass('row-details')){$(this).removeClass('shown');$(this).next().remove();return;}
		var tr=$(this).closest('tr');var row=table.DataTable().row(tr);$(this).parents('tbody').find('.shown').removeClass('shown');$(this).parents('tbody').find('.row-details').remove();row.child(_format(row.data())).show();tr.addClass('shown');tr.next().addClass('row-details');});}
		var initCondensedTable=function(){var table=$('#condensedTable');var settings={"sDom":"t","destroy":true,"paging":false,"scrollCollapse":true};table.dataTable(settings);}
		initBasicTable();initStripedTable();initDetailedViewTable();initCondensedTable();})(window.jQuery);
		
		
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
											'X-CSRFToken' : $('meta[name="token"]').attr('content')
										},
										accept : function(file, done) 
										{
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
											this.on("addedfile",
													function(file)
													{
														nbrFile++;
														$("#nbrFiles").val(nbrFile);
														$("#ClearFileDive").show();
														$("#startProsessingDive").show();
													});

											     
											this.on("removedfile", function(file)
													{
												    	nbrFile--;
												    	$("#nbrFiles").val(nbrFile);
												    	
												    	
												    	if (nbrFile=='0'){
												    		
												    		$("#ClearFileDive").hide();
															$("#startProsessingDive").hide();
															$('.dz-message').show();
												    		
												    	}
											            
											});
											
											
											this.on("sendingmultiple",function(file, xhr, formData)   
														 {
												              var type = $('#typeFile').val();
												              var atm = $('#atm').val();
                                                              var typeProcessingFile = $('#typeProcessingFile').val();
                                                              
                                                              if (atm === null) {
                                                            	  
                                                            	atm = 000;  
                                                            	  
                                                              }
												              formData.append("typeFile",type );
														      formData.append("idAtm",atm );
														      formData.append("typeProcessingFile",typeProcessingFile ); 
														     
												    	});

											this.on("processingmultiple",function(file, progress) 
													
													{

													});

											this.on("totaluploadprogress",function(uploadProgress) {

																document.querySelector("#progresUpload").style.width = uploadProgress+ "%";
																document.querySelector("#pourcentage").value = uploadProgress+ "%";

																if (uploadProgress != '100') {
																	
																	$('#CloseResponse').hide();

																} else

																{

																	$('#progressing').html("<span class='pull-right' id='progressing'><i class='fa fa-check-circle fa-3x text-primary'></i> </span>");
																	$('#status').text("Done");
																	$('#CloseResponse').show();

																}

															});

											this.on("completemultiple",function(file) {

														this.removeAllFiles();
														stillSending = false;

													});

											this.on('resetFiles', function() {
												this.removeAllFiles();
												
											});
											this.on('resetFiles', function() {
								                this.removeAllFiles();
								            });
											 


											this.on("queuecomplete", function(progress) {

											});

											this.on("successmultiple",function(files,serverResponse) 
													{
												showInformationDialog(files,serverResponse);
												});

									               $("#ClearAllFiles").on("click",function() {
												
										
									 
																myDropzone.emit("resetFiles");
																nbrFile = 0;
																$("#nbrFiles").val("0");
																$("#ClearFileDive").hide();
																$("#startProsessingDive").hide();
																$("#dz-messageDiv").show();
																 
															 
																
															});

											document.getElementById("sbmtbtn").onclick = function(e) 
													{
												e.preventDefault();
												var files = myDropzone.getQueuedFiles();
												 
												var atmValue  = $("#atm").val();
												var typeFileValue  = $("#typeFile").val().trim();
												var TypeProcessingFile = $("#atm").val();
												 
												 
												if (    (atmValue == null && typeFileValue === '1'  ) 
													|| ( atmValue == null  && typeFileValue === '-1')
												
												    )
												{
													
													
													    console.log(atmValue);
													    $.confirm({
													    title: 'Encountered an error!',
													    content: 'You should select an ATM , and a type of file',
													    type: 'red',
													    animation: 'left',
													    icon: 'fa fa-exclamation-circle fa-spin',
													    typeAnimated: true, 
													    buttons: {
													        
													        close:{
													        	text: 'Close',
													            btnClass: 'btn-red',
													        	action : function () { 
													        		$('#divTypeFile').addClass('bg-danger');
													        		$('#divATM ').addClass('bg-danger');
														        }
													        	
													        }
													    }
													});
 
													return false;
													
												}
												
												 
												
											  
												
												console.log(atmValue);
												console.log(typeFileValue);
												
												
												
												files.forEach(function(file) {
													myDropzone.processFile(file);
												});
												 
											};

											function showInformationDialog(
													files, objectArray) 
											{

												var responseContent = "";

												for (var i = 0; i < objectArray.length; i++) {

													var infoObject = objectArray[i];

													for ( var infoKey in infoObject) {
														if (infoObject
																.hasOwnProperty(infoKey)) {
															responseContent = responseContent
																	+ " "
																	+ infoKey
																	+ " -> "
																	+ infoObject[infoKey]
																	+ "<br>";
														}
													}
													responseContent = responseContent
															+ "<hr>";
												}

												$('#modalSlideUp')
														.modal('show');
												$("#infos").append(responseContent);

											}

										}

									});
						 
						 
						});

	 
		 

</script>

<script src="<spring:url value="/resources/assets/jquery-confirm.min.js"/>"></script>
	 
</body>



</html>