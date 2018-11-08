
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
</head>
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/dropzone/css/dropzone.css"/>" />
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



						<form:form modelAttribute="fileUpload" method="post"
							enctype="multipart/form-data">

							<div class="row">
								<div class="col-lg-9">
									<div id="myCard" class="card card-default">
										<div class="card-header ">
											<div class="card-title bold text-primary fs-16 ">
												<i class="fa fa-upload" aria-hidden="true"></i> Uplodaing
												journal file
											</div>
											<div class="card-controls hvr-grow-shadow">
												<ul>
													<li>
														<div class="dropdown">
															<a data-target="#" href="#" data-toggle="dropdown"
																aria-haspopup="flase" role="button"
																aria-expanded="false"> <i
																class="card-icon card-icon-settings "></i>
															</a>

															<ul class="dropdown-menu pull-left" role="menu"
																aria-labelledby="card-settings">
																<li><a href="#">Historique </a></li>

															</ul>
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
														

														<div class="col-md-2 pull-left">
															<div class="input-group transparent m-b-15">
																<div class="input-group-prepend m-b-15 hvr-grow-shadow">
																	<span class="input-group-text text-primary bold text-uppercase transparent center title small no-margin  fs-14 "><i
																		class="fa fa-file" aria-hidden="true"></i> &nbsp;Files </span> <input
																		type="text" value="" placeholder="000" class="form-control text-primary bold text-uppercase center title small   fs-14  "
																		disabled id="nbrFiles">
																</div>
															</div>
														</div>
														<div class="col-md-10  "></div>
													</div>
												</div>
											</div>
											<div class="row">

												<div class="col-md-4">
													<div
														class="form-group form-group-default form-group-default-select2 input-group hvr-grow">
														<label class="">Branche </label>
														<form:select path="atm.branch.idBranch"
															cssClass="full-width" id="branch" style="width: 100%;"
															data-init-plugin="select2" items="${listBranches}"
															itemValue="idBranch" itemLabel="nomBranch" />
													</div>
												</div>
												<div class="col-md-4">
													<div
														class="form-group form-group-default form-group-default-select2 input-group hvr-grow">
														<label class="">ATM</label>
														<form:select path="atm" cssClass="full-width" id="atm"
															data-placeholder="Select an atm here"
															cssStyle="width: 100%;" data-init-plugin="select2" />
													</div>
												</div>
												
												<div class="col-md-4">
													<div
														class="form-group form-group-default form-group-default-select2 input-group hvr-grow">
														<label class="">Type File </label>
														<form:select path="typeFile" cssClass="full-width" id="typeFile"
															data-placeholder="Select a type of file "
															cssStyle="width: 100%;" data-init-plugin="select2" />
													</div>
												</div>
												</div>
												<div class="row">
												<div class="col-md-12">
													<div class="row">
														<div class="col-md-4" id="AutolUploadDive">
															<div
																class="form-group form-group-default input-group hvr-grow">
																<div class="form-input-group">
																	<label class="inline">Automatic&nbsp;&nbsp;</label>
																</div>
																<div class="input-group-append h-c-50">
																	<span class="input-group-text transparent"> <input
																		type="checkbox" data-init-plugin="switchery"
																		id="AutoUpload" data-size="small" data-color="red" />
																	</span>
																</div>
															</div>
														</div>
														<div class="col-md-4" id="ManuelUploadDive">
															<div
																class="form-group form-group-default input-group hvr-grow ">
																<div class="form-input-group">
																	<label class="inline">Manuel</label>
																</div>
																<div class="input-group-append h-c-50">
																	<span class="input-group-text transparent"> <input
																		type="checkbox" data-init-plugin="switchery"
																		id="ManuelUpload" data-size="small" data-color="red" checked disabled="disabled" />
																	</span>
																</div>
															</div>
														</div>
														<div class="col-md-4" id="InfoAutomatique" >
															<div
																class="form-group form-group-default input-group hvr-grow ">
																<div class="form-input-group">
																	<label class="inline">Path folder</label>
																</div>
																<div class="input-group-append h-c-50">
																	<span class="input-group-text transparent">  
																	</span>
																</div>
															</div>
														</div>

													</div>
												</div>
												</div>
											
										</div>


										<div class="card-block" id="cardUpload">
											<div class="card-body no-scroll no-padding">

												<div id="mydropzone" class="dropzone" multiple>
												
                                                   <div class="dz-message text-center" data-dz-message id="dz-messageDiv">
                                                   <br>
                                                   <br>
                                                   <br>
                                                   <br>
                                                   <br>
                                                   <br>
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
												id="sbmtbtn">

												<span class="font-montserrat bold fs-16 m-t-2"> Start
													parsing files </span> <span class="m-r-20 m-b-2"><i
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

							<div class="col-md-12">

								<div class="card card-default hover-stroke">
									<div class="card-body no-padding">
										<div class="container-sm-height">
											<div class="row row-sm-height">
												<div class="col-md-12 ">
													<p class="font-montserrat bold">Progression</p>
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
															<div class="input-group transparent m-b-15">
																<div class="input-group m-b-15 hvr-grow-shadow">

																	<input type="text" value=""
																		class="form-control text-primary fs-10" disabled
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
																		class="font-montserrat bold fs-10 m-t-2"> En
																		cours </span>

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
						<div class="row">

							<div class="col-md-12">


								<div id="myCardX2" class="card card-default">
									<div class="card-header ">
										<div class="card-title font-montserrat bold">Statistique</div>
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

												<div class="card card-transparent">
													<div class="card-body">
														<div class="row">
															<div class="col-lg-4 col-md-6">
																<div class="bg-master b-a b-grey m-b-15">
																	<div class="bg-white m-t-45 padding-10">
																		<p class=" no-margin pull-left">Transaction</p>
																		<p class=" no-margin pull-right">XXX</p>
																		<div class="clearfix"></div>
																	</div>
																</div>
															</div>
															<div class="col-lg-4 col-md-6">
																<div class="bg-primary b-a b-grey m-b-15">
																	<div class="bg-white m-t-45 padding-10 text-master">
																		<p class=" no-margin pull-left">Replanishement</p>
																		<p class=" no-margin pull-right">XXX</p>
																		<div class="clearfix"></div>
																	</div>
																</div>
															</div>
															<div class="col-lg-4 col-md-6">
																<div class="bg-complete b-a b-grey m-b-15">
																	<div class="bg-white m-t-45 padding-10">
																		<p class=" no-margin pull-left">Incident</p>
																		<p class=" no-margin pull-right">XXX</p>
																		<div class="clearfix"></div>
																	</div>
																</div>
															</div>

														</div>
														<div class="row">
															<div class="col-lg-4 col-md-6">
																<div class="bg-menu b-a b-grey m-b-15">
																	<div class="bg-white m-t-45 padding-10">
																		<p class=" no-margin pull-left">Communication</p>
																		<p class=" no-margin pull-right">XXX</p>
																		<div class="clearfix"></div>
																	</div>
																</div>
															</div>
															<div class="col-lg-4 col-md-6">
																<div class="bg-info b-a b-grey m-b-15">
																	<div class="bg-white m-t-45 padding-10">
																		<p class=" no-margin pull-left">Already uploaded</p>
																		<p class=" no-margin pull-right">XXX</p>
																		<div class="clearfix"></div>
																	</div>
																</div>
															</div>
															<div class="col-lg-4 col-md-6">
																<div class="bg-danger b-a b-grey m-b-15">
																	<div class="bg-white m-t-45 padding-10">
																		<p class=" no-margin pull-left">File erreur</p>
																		<p class=" no-margin pull-right">XXX</p>
																		<div class="clearfix"></div>
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


	<script
		src="<spring:url value="/resources/assets/plugins/dropzone/dropzone.min.js"/>"></script>
		<script src="<spring:url value="/resources/pages/js/upload.js"/>"></script>
	 
</body>



</html>