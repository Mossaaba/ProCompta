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


		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">

			<div class="content">

				<div class=" container-fluid   container-fixed-lg">
					<ul class="breadcrumb p-l-0">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Tally</li>
					</ul>
					<h3 class="page-title"></h3>
				</div>


				<div class=" container-fluid   container-fixed-lg">





					<div class="card card-default">
						<div class="card-header ">
							<div class="card-title"></div>
						</div>
						<div class="card-body no-padding">
							<div class="row">


								<div class="col-xl-12 col-lg-12 col-md-12 text-center">

									<div class="card card-transparent">
										<div class="card-header ">
											<div class="card-title"> </div>
										</div>
										<spring:url value="/pointage/perform"
											var="performReconciliation" />

										<form:form action="${performReconciliation}" method="POST"
											modelAttribute="reconciliation" id="reconciliationForm">
											
											
										<div class="card-body ">
											 
											 
											 
											<button class="btn btn-lg btn-rounded btn-primary m-r-20 m-b-10 hvr-pulse-grow ">
											<i class="fa fa-play fa-3x " aria-hidden="true"></i> <br>
											Run reconciliation</button>
											 
											 
											 
											 
											 
										</div>
										</form:form>
										
										
									</div>

								</div>
							</div>
						</div>
					</div>






				</div>
			</div>



			<jsp:include page="../view/fragments/footer.jsp"></jsp:include>

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
	<script src="<spring:url value="/resources/pages/js/tally.js"/>"></script>

</body>



</html>