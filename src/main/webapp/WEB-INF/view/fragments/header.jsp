<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<!-- ------------- -->
<!-- CSS PACKAGES  -->
<!-- ------------- -->

<!DOCTYPE html>
<html>
<head>

<title>ProCompta</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no" />

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">

</head>



<div class="header ">

	<a href="#" class="btn-link toggle-sidebar d-lg-none pg pg-menu"
		data-toggle="sidebar"> </a>

	<div class="d-flex align-items-center">
	
	
		<div class="brand inline  m-l-40 m-t-50 p-r-10">
			<span class="p-r-10 inline hvr-pulse-grow">
			 
			
			
			<i class="humbnail-wrapper d32 circular inline ">  
			<img  src="<spring:url value="/resources/pages/ico/logo.png"/>"  width="40%"  >  
			</i> <br> <br> </span> <a
				href="<spring:url value="/home"/>"> 
				 
			</a>

		</div>

		<ul
			class="d-lg-inline-block d-none notification-list no-margin d-lg-inline-block b-grey b-l b-r no-style p-l-30 p-r-20">
			<li class="p-r-10 inline">
				<div class="dropdown">
					<a href="javascript:;" id="notification-center"
						class="header-icon pg pg-world hvr-grow-shadow" data-toggle="dropdown"> </a>
					<div class="dropdown pull-right d-lg-block d-none">


						<div class="dropdown-menu dropdown-menu-right" role="menu">

							<a href="?language=en" class="dropdown-item"> <i
								class="pg-settings_small"></i> <spring:message
									code="label.English"></spring:message></a> <a href="?language=fr"
								class="dropdown-item"><i class="pg-settings_small"></i> <spring:message
									code="label.Francais"></spring:message></a> <a href="?language=ar"
								class="dropdown-item"><i class="pg-settings_small"></i> <spring:message
									code="label.arab"></spring:message></a>
						</div>
					</div>
				</div>
			</li>
			<li class="p-r-10 inline  "><a href="#"
				class="header-icon pg pg-link hvr-grow-shadow"></a></li>
			<li class="p-r-10 inline"><a onclick="go_full_screen()"
				class="header-icon fa fa-arrows-alt hvr-pulse-grow "></a></li>
		</ul>



	</div>

	<div class="d-flex align-items-center">

		<div class="pull-left p-r-10 fs-14 font-heading d-lg-block d-none hvr-underline-from-left font-montserrat bold">
			<span class="semi-bold hvr-underline-from-left"> <security:authentication
					property="principal.username" /> </span>
		</div>
		<div class="dropdown pull-right d-lg-block d-none hvr-grow ">
			<button class="profile-dropdown-toggle  " type="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="thumbnail-wrapper d32 circular inline "> <img
					src="<spring:url value="/resources/assets/img/profiles/mo.jpg"/>"
					alt=""
					data-src="<spring:url value="/resources/assets/img/profiles/mo.jpg"/>"
					data-src-retina="<spring:url value="/resources/assets/img/profiles/avatar_small2x.jpg"/>"
					width="32" height="32">
				</span>
			</button>
			<div class="dropdown-menu dropdown-menu-right profile-dropdown"
				role="menu">
				<a href="#" class="dropdown-item" data-toggle="modal" data-target="#modalSlideUpUser" ><i class="pg-settings_small"></i>
					<spring:message code="label.Settings"></spring:message></a> 
					
					
					<a href="#" class="dropdown-item" data-toggle="modal" data-target="#modalSlideUpHelp" ><i class="pg-signals"></i> <spring:message code="label.Help"></spring:message></a>
				<form:form action="${pageContext.request.contextPath}/logout"
					method="POST">
					<button value="Logout" type="submit"
						class="bg-master-lighter dropdown-item">
						   <span class="pull-left bold"><i class="pg-power"></i> <spring:message code="label.Logout"></spring:message></span>  
						
						
						
					</button>
				</form:form>



			</div>
		</div>

		<a href="#"
			class="header-icon pg pg-alt_menu btn-link m-l-10 sm-no-margin d-inline-block"
			data-toggle="quickview" data-toggle-element="#quickview"></a>
	</div>


</div>

<c:if test="${!empty CronTab }">
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('body')
										.pgNotification(
												{
													style : 'circle',
													title : "<i class='fa fa-exchange' aria-hidden='true'></i> Number of transactions :${CronTab} ",
													message : "Im parsing a journal file ",
													position : 'top-right',
													timeout : 200000,
													type : "${css}"
												}).show();
							});
		</script>
	</c:if>

<div class="modal fade slide-up disable-scroll" id="modalSlideUpUser"
	tabindex="-1" role="dialog" aria-hidden="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content-wrapper">
			<div class="modal-content">
				<div class="modal-header clearfix text-left text-primary">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<i class="pg-close fs-14"></i>
					</button>
					<h5>
					
						<i class="fa fa-user-circle-o" aria-hidden="true"></i> User <span class="semi-bold">Information</span>
					</h5>
					<p class="p-b-10"></p>
				</div>
				<div class="modal-body">

					<div class=" container-fluid   container-fixed-lg bg-white">
						<div class="row">

							<div class="col-md-12">

								<div class="card card-transparent">
									<div class="card-body">
										<form id="form-project" role="form" autocomplete="off"
											novalidate>
											<p>Basic Information</p>
											<div class="form-group-attached">
												 
												<div class="row clearfix">
													<div class="col-md-6">
														<div class="form-group form-group-default required">
															<label>First name</label> <input type="text"
																class="form-control" name="firstName" required>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group form-group-default">
															<label>Last name</label> <input type="text"
																class="form-control" name="lastName">
														</div>
													</div>
												</div>
											</div>
											<p class="m-t-10">Advanced Information</p>
											<div class="form-group-attached">
												<div class="form-group form-group-default">
													<label>Branch <i
														class="fa fa-info text-complete m-l-5"></i>
													</label> <input type="text" class="form-control" name="investor">
												</div>
												<div class="row clearfix">
													<div class="col-md-12">
														<div class="form-group form-group-default required">
															<label>Creation Date</label> <input id="start-date"
																type="text" class="form-control date" name="startDate"
																required>
														</div>
													</div>
													 
												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group form-group-default required">
															<label>Role</label> <input type="text"
																class="form-control" name="url">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label class="inline">Change Password</label>
															</div>
															<div class="input-group-append h-c-50">
																<span class="input-group-text transparent"> <input
																	type="checkbox" data-init-plugin="switchery"
																	data-size="small" data-color="primary"
																	checked="checked" />
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-4">
														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label>Current Password</label> <input type="text"
																	class="form-control usd" required>
															</div>
															<div class="input-group-append ">
																<span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i> </span>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label>New Password</label> <input type="text"
																	class="form-control usd">
															</div>
															<div class="input-group-append ">
																<span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i> </span>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label>Confirm Password</label> <input type="text"
																	class="form-control usd">
															</div>
															<div class="input-group-append ">
																<span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i> </span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="pull-left">
												<div class="checkbox check-success  ">
													<input type="checkbox" checked="checked" value="1"
														id="checkbox-agree"> <label for="checkbox-agree">I
														hereby certify that the information above is true and
														accurate </label>
												</div>
											</div>
											<br>
											<button class="btn btn-success" type="submit">Submit</button>
											<button class="btn btn-default">
												<i class="pg-close"></i> Clear
											</button>
										</form>
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

<div class="modal fade slide-up disable-scroll" id="modalSlideUpHelp"
	tabindex="-1" role="dialog" aria-hidden="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content-wrapper">
			<div class="modal-content">
				<div class="modal-header clearfix text-left text-primary">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<i class="pg-close fs-14"></i>
					</button>
					<h5>
						<i class="fa fa-user-circle-o" aria-hidden="true"></i> User <span
							class="semi-bold">Information</span>
					</h5>
					<p class="p-b-10"></p>
				</div>
				<div class="modal-body">

					<div class=" container-fluid   container-fixed-lg bg-white">
						<div class="row">

							<div class="col-md-12">

								<div class="card card-transparent">
									<div class="card-body">
										<div class="card card-transparent">
											<div class="card-header ">
												<div class="card-title">Tab Orientations</div>
											</div>
											<div class="card-body no-padding">
												<div class="row">
													<div class="col-xl-12">
														<div class="card card-transparent flex-row">
															<ul
																class="nav nav-tabs nav-tabs-simple nav-tabs-left bg-white"
																id="tab-3">
																<li class="nav-item"><a href="#" class="active"
																	data-toggle="tab" data-target="#tab3hellowWorld">One</a>
																</li>
																<li class="nav-item"><a href="#" data-toggle="tab"
																	data-target="#tab3FollowUs">Two</a></li>
																<li class="nav-item"><a href="#" data-toggle="tab"
																	data-target="#tab3Inspire">Three</a></li>
															</ul>
															<div class="tab-content bg-white">
																<div class="tab-pane" id="tab3hellowWorld">
																	<div class="row column-seperation">
																		<div class="col-lg-12">
																			<h3>
																				<span class="semi-bold">Sometimes </span>Small
																				things in life means the most
																			</h3>
																		</div>
																		<div class="col-lg-6">
																			<h3 class="semi-bold">great tabs</h3>
																			<p>Native boostrap tabs customized to Pages look
																				and feel, simply changing class name you can change
																				color as well as its animations</p>
																		</div>
																	</div>
																</div>
																<div class="tab-pane active" id="tab3FollowUs">
																	<h3>
																		“ Nothing is <span class="semi-bold">impossible</span>,
																		the word itself says 'I'm <span class="semi-bold">possible</span>'!
																		”
																	</h3>
																	<p>A style represents visual customizations on top
																		of a layout. By editing a style, you can use
																		Squarespace's visual interface to customize your...</p>
																	<br>
																	<p class="pull-right">
																		<button class="btn btn-default btn-cons" type="button">White</button>
																		<button class="btn btn-success btn-cons" type="button">Success</button>
																	</p>
																</div>
																<div class="tab-pane" id="tab3Inspire">
																	<h3>Follow us &amp; get updated!</h3>
																	<p>Instantly connect to what's most important to
																		you. Follow your friends, experts, favorite
																		celebrities, and breaking news.</p>
																	<br>
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
			</div>
		</div>

	</div>
</div>





<!-- ------------- -->
<!-- JS PACKAGES  -->
<!-- ------------- -->

<script src="<spring:url value="/resources/assets/plugins/pace/pace.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery/jquery-3.2.1.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-ui/jquery-ui.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/modernizr.custom.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/popper/umd/popper.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery/jquery-easy.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-unveil/jquery.unveil.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-ios-list/jquery.ioslist.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-actual/jquery.actual.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/select2/js/select2.full.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/classie/classie.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/switchery/js/switchery.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-autonumeric/autoNumeric.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/bootstrap-tag/bootstrap-tagsinput.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-inputmask/jquery.inputmask.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/bootstrap-form-wizard/js/jquery.bootstrap.wizard.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-validation/js/jquery.validate.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/summernote/js/summernote.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/moment/moment.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.js"/>"></script>
<script src="<spring:url value="/resources/pages/js/pages.js"/>"></script>
<script src="<spring:url value="/resources/assets/js/form_layouts.js"/>"></script>
<script src="<spring:url value="/resources/assets/js/scripts.js"/>"></script>
<script src="<spring:url value="/resources/assets/js/demo.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/bootstrap-typehead/typeahead.bundle.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/bootstrap-typehead/typeahead.jquery.min.js"/>"></script>
<scripT src="<spring:url value="/resources/assets/plugins/handlebars/handlebars-v4.0.5.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/ion-slider/js/ion.rangeSlider.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.nouislider.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.liblink.js"/>"></script>
<script src="<spring:url value="/resources/assets/js/slider.js"/>"></script>
<script src="<spring:url value="/resources/assets/js/card.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/media/js/jquery.dataTables.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/js/dataTables.tableTools.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/media/js/dataTables.bootstrap.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/Bootstrap/jquery-datatable-bootstrap.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/datatables-responsive/js/datatables.responsive.js"/>"></script>
<script src="<spring:url value="/resources/assets/plugins/datatables-responsive/js/lodash.min.js"/>"></script>
<script src="<spring:url value="/resources/assets/js/tables.js"/>"></script>
<script src="<spring:url value="/resources/assets/js/datatables.js"/>"></script>

<script type="text/javascript">
function go_full_screen(){
    var elem = document.documentElement;
    if (elem.requestFullscreen) {
      elem.requestFullscreen();
    } else if (elem.msRequestFullscreen) {
      elem.msRequestFullscreen();
    } else if (elem.mozRequestFullScreen) {
      elem.mozRequestFullScreen();
    } else if (elem.webkitRequestFullscreen) {
      elem.webkitRequestFullscreen();
    }
}
  


</script>