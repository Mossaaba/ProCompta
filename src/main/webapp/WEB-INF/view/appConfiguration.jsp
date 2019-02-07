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


<title>ProCompta | RECONCILIATION</title>
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="icon" href="<spring:url value="/resources/pages/logo.png"/>" />



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
		<br> <br> <br>

		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">

			<div class="content">



				<div class=" container-fluid   container-fixed-lg">
					<div id="rootwizard" class="m-t-50">

						<ul
							class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm"
							role="tablist" data-init-reponsive-tabs="dropdownfx">
							<li class="nav-item"><a class="active" data-toggle="tab"
								href="#tab1" data-target="#tab1" role="tab"><i
									class="fa fa-shopping-cart tab-icon"></i> <span>Config
										One</span></a></li>
							<li class="nav-item"><a class="" data-toggle="tab"
								href="#tab2" data-target="#tab2" role="tab"><i
									class="fa fa-truck tab-icon"></i> <span> Config Two</span></a></li>
							<li class="nav-item"><a class="" data-toggle="tab"
								href="#tab3" data-target="#tab3" role="tab"><i
									class="fa fa-credit-card tab-icon"></i> <span> Config
										three</span></a></li>
							<li class="nav-item"><a class="" data-toggle="tab"
								href="#tab4" data-target="#tab4" role="tab"><i
									class="fa fa-upload" aria-hidden="true"></i> <span>
										Uplaoding File</span></a></li>
						</ul>

						<div class="tab-content">
							<div class="tab-pane padding-20 sm-no-padding active slide-left"
								id="tab1">
								<div class="row row-same-height">
									<div class="col-md-5 b-r b-dashed b-grey sm-b-b"></div>
									<div class="col-md-7"></div>
								</div>
							</div>
							<div class="tab-pane slide-left padding-20 sm-no-padding"
								id="tab2">
								<div class="row row-same-height">
									<div class="col-md-5 b-r b-dashed b-grey "></div>
									<div class="col-md-7"></div>
								</div>
							</div>
							<div class="tab-pane slide-left padding-20 sm-no-padding"
								id="tab3">
								<div class="row row-same-height">
									<div class="col-md-5 b-r b-dashed b-grey "></div>
									<div class="col-md-7"></div>
								</div>
							</div>








							<div class="tab-pane slide-left padding-20 sm-no-padding"
								id="tab4">

								<div class="row row-same-height">


									<div class="col-md-6 b-r b-dashed b-grey ">


										<div class="card card-transparent">
											<div class="card-header ">
												<div class="card-title text-primary bold">
													
													<h4 class="text-primary"> <i class="fa fa-sliders fa-2x" aria-hidden="true"></i> 
													Uplaoding Journal file parametters : </h4>
												</div>
											</div>
											<div class="card-body">
												 


												<div class="row ">
                                                   <div class="col-md-3 b-b b-t b-grey ">
                                                   <span class="bold "><i class="fa fa-sun-o"
													aria-hidden="true"></i> Current Configuration : </span>
													
                                                   </div>


													<div class="col-md-3 b-b b-t b-grey ">

														<i class="fa fa-repeat" aria-hidden="true"></i> Type : <label
															for="FixedTimeJournalFile" class="text-primary bold ">
															${typeUploadJrn}</label>
													</div>

													<div class="col-md-3 b-b b-t b-grey ">

                                                    <span class="bold "><i class="fa fa-sort-numeric-asc" aria-hidden="true"></i> Value : </span>
														<c:choose>

															<c:when test="${typeUploadJrn == 'recursive' }">
																<c:set var="MinutesToShow"
																	value="${fn:substring(jrnMin, 2, 4)}" />
																<c:set var="HourToShow"
																	value="${fn:substring(jrnHour, 2, 4)}" />

																  <label class="text-primary bold "> <c:out
																		value="${MinutesToShow}" /> Minutes
																</label>


															</c:when>

															<c:otherwise>
																<label for="FixedTimeJournalFile"> (<strong
																	class="text-primary"><c:out value="${jrnHour}" />:<c:out
																			value="${jrnMin}" /></strong>)
																</label>
															</c:otherwise>


														</c:choose>



													</div>

													<div class="col-md-3 bold ">
														Modify : <input type="checkbox" class="switchery"
															id="switchModifyParamJournalFileUplaod" />
													</div>


												</div>

												<div class="row" id="rowUplaodJournalDiv">
													<div class="col-md-12">


														<div class="radio radio-primary">


															<input type="radio" value="recursive"
																id="RecurentJournalFile"> <label
																for="RecurentJournalFile"> recursive </label> <input
																type="radio" value="fixed" id="FixedTimeJounralFile">

															<label for="FixedTimeJounralFile">Fixed Time </label>
														</div>


													</div>
												</div>

												<form:form action="journalFileParam" autocomplete="off"  id="journalFileParam">
													<div class="row">



														<div class="col-md-6" id="fixedTimeParam">   


															<div class="form-group form-group-default input-group  ">

																<div class="form-input-group">
																	<label>Time</label> <input name="fixeTimeJournalFile"
																		id="fixeTimeJournalFile" type="text"
																		class="form-control time" placeholder="Pick a time"
																		autocomplete="off" />
																</div>

																<div class="input-group-append ">
																	<span class="input-group-text"><i
																		class="fa fa-clock-o"></i></span>
																</div>
															</div>

														</div>

														<div class="col-md-6" id="reccurentTimeParam">



															<div class="form-group form-group-default input-group">
																<div class="form-input-group">
																	<label>Minutes</label> <input type="number"
																		class="form-control" name="reccurentTimeJournalMin" id="reccurentValue">
																</div>
																<div class="input-group-append ">
																	<span class="input-group-text">Minutes </span>
																</div>
															</div>


														</div>



													</div>


													<div class="col-md-12" id="btnJouralParam">

														<button class="btn btn-primary" type="submit" id="btnSubmitjournalFileParam">
															save</button>

														 

													</div>

												</form:form>




												<br>





											</div>



										</div>

									</div>



									<div class="col-md-6  ">

										<div class="card card-transparent">
											<div class="card-header ">
												<div class="card-title text-primary bold fs-18">
													
													<h4 class="text-primary"> 
													<i class="fa fa-sliders fa-2x" aria-hidden="true"></i> 
													Uplaoding Host file parametters :</h4>
												</div>
											</div>
											<div class="card-body">
												 
												 


												<div class="row ">
												<div class="col-md-3 b-b b-t b-grey ">
												
												<span class="bold "><i class="fa fa-sun-o"
													aria-hidden="true"></i> Current Configuration : </span>
												
												</div>

													<div class="col-md-3 b-b b-t b-grey ">

														<i class="fa fa-repeat" aria-hidden="true"></i> Type : <label
															for="FixedTimeHostFile" class="text-primary bold ">
															${typeUploadHost}</label>
													</div>

													<div class="col-md-3 b-b b-t b-grey ">


														<c:choose>

															<c:when test="${typeUploadHost == 'recursive' }">
																 

															</c:when>

															<c:otherwise>
															 <i class="fa fa-clock-o" aria-hidden="true"></i> Value 
															 <br>
																<label for="FixedTimeHostFile"> (<strong
																	class="text-primary"><c:out
																			value="${HostHour}" />:<c:out value="${HostMin}" /></strong>)
																</label>
															</c:otherwise>


														</c:choose>



													</div>

													<div class="col-md-3 bold ">
														Modify : <input type="checkbox" class="switchery"
															id="switchModifyParamHostFileUplaod" />
													</div>


												</div>

												<br>



												<div class="row" id="rowUploadHostFile">



													<form:form action="hostFileParam" autocomplete="off" id="hostFileParam">  

                                                          <br>
														<div class="row">

															<div class="col-md-12 " id="fixeTimeHostFileDive">


																<div
																	class="form-group form-group-default input-group   pull-right">

																	<div class="form-input-group">
																		<label>Time</label> <input name="fixeTimeHost"
																			id="TimeUploadHostFile" type="text"
																			class="form-control time" placeholder="Pick a time"
																			autocomplete="off" />
																	</div>

																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-clock-o"></i></span>
																	</div>
																</div>



															</div>
														</div>



														<div class="row">
															<div class="col-md-12 text-center" id="rowBtn">

																<button class="btn btn-primary" type="submit" id="btnSubmithostFileParam">
															
																	save</button>

													 



															</div>

														</div>

													</form:form>
												</div>




											</div>



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
			<script src="<spring:url value="/resources/pages/js/configApp.js"/>"></script>
</body>



</html>