<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!-- ------------- -->
<!-- CSS PACKAGES  -->
<!-- ------------- -->

<!DOCTYPE html>
<html>
<!-- Mirrored from pages.revox.io/dashboard/4.0.0/html/corporate/builder.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Aug 2018 17:22:30 GMT -->
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta charset="utf-8" />
<title>Pages - ProCompta - Blank Page</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no" />

<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/60.png"/>" />
<link rel="apple-touch-icon" sizes="76x76"
	href="<spring:url value="/resources/pages/ico/76.png"/>" />
<link rel="apple-touch-icon" sizes="120x120"
	href="<spring:url value="/resources/pages/ico/120.png"/>" />
<link rel="apple-touch-icon" sizes="152x152"
	href="<spring:url value="/resources/pages/ico/152.png"/>" />
<link rel="icon" sizes="152x152"
	href="<spring:url value="/resources/pages/favicon.ico"/>" />

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">

<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/pace/pace-theme-flash.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap/css/bootstrap.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/font-awesome/css/font-awesome.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-scrollbar/jquery.scrollbar.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/switchery/css/switchery.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/pages/css/pages-icons.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap-datepicker/css/datepicker3.css"/>"
	type="text/css" />
<link class="main-stylesheet" rel="stylesheet"
	href="<spring:url value="/resources/pages/css/themes/corporate.css"/>"
	type="text/css" />
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


<script type="text/javascript">
	window.onload = function() {
		// fix for windows 8
		if (navigator.appVersion.indexOf("Windows NT 6.2") != -1)
			document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="pages/css/windows.chrome.fix.css" />'
	}
</script>
</head>



<div class="header ">

	<a href="#" class="btn-link toggle-sidebar d-lg-none pg pg-menu"
		data-toggle="sidebar"> </a>

	<div class="">
		<div class="brand inline  m-l-10 ">
		<span class=""><i class="pg-menu_justify"></i></span>
			 <a href="<spring:url value="/home"/>"  >
			             <span class="font-montserrat" style="font-size :20px;"> ProCompta</span> 
		     </a>
		      
		</div>

		<ul
			class="d-lg-inline-block d-none notification-list no-margin d-lg-inline-block b-grey b-l b-r no-style p-l-30 p-r-20">
			<li class="p-r-10 inline">
				<div class="dropdown">
					<a href="javascript:;" id="notification-center"
						class="header-icon pg pg-world" data-toggle="dropdown"> <span
						class="bubble"></span>
					</a>

					<div class="dropdown-menu notification-toggle" role="menu"
						aria-labelledby="notification-center">

						<div class="notification-panel">

							<div class="notification-body scrollable">

								<div class="notification-item unread clearfix">

									<div class="heading open">
										<a href="#" class="text-complete pull-left"> <i
											class="pg-map fs-16 m-r-10"></i> <span class="bold">English</span>
											<span class="fs-12 m-l-10">David Nester</span>
										</a>
									</div>

								</div>


								<div class="notification-item  clearfix">
									<div class="heading">
										<a href="#" class="text-danger pull-left"> <i
											class="fa fa-exclamation-triangle m-r-10"></i> <span
											class="bold">Français</span> <span class="fs-12 m-l-10">Take
												Action</span>
										</a>
									</div>



								</div>
								<div class="notification-item  clearfix">
									<div class="heading">
										<a href="#" class="text-danger pull-left"> <i
											class="fa fa-exclamation-triangle m-r-10"></i> <span
											class="bold">Arab</span> <span class="fs-12 m-l-10">Take
												Action</span>
										</a>
									</div>



								</div>

							</div>




						</div>

					</div>

				</div>
			</li>
			<li class="p-r-10 inline"><a href="#"
				class="header-icon pg pg-link"></a></li>
			<li class="p-r-10 inline"><a href="#"
				class="header-icon pg pg-thumbs"></a></li>
		</ul>



	</div>
	<!-- ------------- -->
	<!-- BLOCK USER    -->
	<!-- ------------- -->



	<div class="d-flex align-items-center">

		<div class="pull-left p-r-10 fs-14 font-heading d-lg-block d-none">
			<span class="semi-bold"> <security:authentication property="principal.username" /></span>  
		</div>
		<div class="dropdown pull-right d-lg-block d-none">
			<button class="profile-dropdown-toggle" type="button"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="thumbnail-wrapper d32 circular inline"> <img
					src="<spring:url value="/resources/assets/img/profiles/mo.jpg"/>"
					alt=""
					data-src="<spring:url value="/resources/assets/img/profiles/mo.jpg"/>"
					data-src-retina="<spring:url value="/resources/assets/img/profiles/avatar_small2x.jpg"/>"
					width="32" height="32">
				</span>
			</button>
			<div class="dropdown-menu dropdown-menu-right profile-dropdown"
				role="menu">
				<a href="#" class="dropdown-item"><i class="pg-settings_small"></i>
					Settings</a> <a href="#" class="dropdown-item"><i
					class="pg-signals"></i> Help</a> 
					
					 
					<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			       <button  value="Logout" type="submit" class="clearfix bg-master-lighter dropdown-item"> 
			       <span  class="pull-left">Logout</span> <span class="pull-right"><i class="pg-power"></i></span>
			       </button>
			       </form:form>
					
					
				
			</div>
		</div>

		<a href="#"
			class="header-icon pg pg-alt_menu btn-link m-l-10 sm-no-margin d-inline-block"
			data-toggle="quickview" data-toggle-element="#quickview"></a>
	</div>


</div>








<!-- ------------- -->
<!-- JS PACKAGES  -->
<!-- ------------- -->




<script
	src="<spring:url value="/resources/assets/plugins/pace/pace.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery/jquery-3.2.1.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-ui/jquery-ui.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery/jquery-easy.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-unveil/jquery.unveil.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-ios-list/jquery.ioslist.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-actual/jquery.actual.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/modernizr.custom.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/popper/umd/popper.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/classie/classie.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/switchery/js/switchery.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/bootstrap3-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>">
</script>
 
<script 
    src="<spring:url value="/resources/pages/js/pages.js"/>">
</script>
<script 
    src="<spring:url value="/resources/assets/js/form_layouts.js"/>">
</script>
<script
	src="<spring:url value="/resources/assets/js/form_elements.js"/>">
</script>
<script 
    src="<spring:url value="/resources/assets/js/scripts.js"/>">
</script>
<script 
    src="<spring:url value="/resources/assets/js/demo.js"/>">
</script>
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
	<script src="<spring:url value="/resources/assets/js/datatables.js"/>"></script>

