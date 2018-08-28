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
										<div class="card-title"><i class="fa fa-refresh fa-spin fa-3x fa-fw" style="font-size :15px;" aria-hidden="true"></i> last update</div>
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
											<span class="semi-bold">Lastest </span> Informations
										</h3>
										<div class="card-body">
<!-- *************** -->
<!-- Form            -->
<!-- *************** -->

											 
											
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
		 
		 
    
     
       
</script>

</body>
</html>