<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/pace/pace-theme-flash.css"/>" />
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
						<div id="rootwizard" class="m-t-50">

							<ul
								class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm"
								role="tablist" data-init-reponsive-tabs="dropdownfx">
								<li class="nav-item"><a id="listeAtm"
									class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold"
									data-toggle="tab" href="#tab1" data-target="#tab1" role="tab"><i
										class="fa fa-shopping-cart tab-icon"></i> <span>ListeAtm</span></a>
								</li>

							</ul>




							<div class="tab-content">
								<div class="tab-pane padding-20 sm-no-padding active slide-left"
									id="tab1">
									<div class="row row-same-height">



										<div class="col-md-12">
											<div class="pull-right">
												<div class="col-xs-12">
													<button id="show-modal" class="btn btn-primary btn-cons">
														<i class="fa fa-microchip"></i> Add ATM
													</button>
												</div>
											</div>

											<br>

											<div class=" ">
												<table class="table table-responsive-block nowrap ">
													<thead>
														<tr>
															<td class="v-align-middle">Type</td>
															<td class="v-align-middle">Name</td>
															<td class="v-align-middle">Connexion</td>
															<td class="v-align-middle">Adresse IP</td>
															<td class="v-align-middle">User</td>
															<td class="v-align-middle">Password</td>
															<td class="v-align-middle">Disque</td>
															<td class="v-align-middle">Repository</td>

															<security:authorize access="hasRole('ADMIN')">
																<td class="v-align-middle">Tools</td>
															</security:authorize>



														</tr>
													</thead>
													<tbody>

														<c:forEach var="atm" items="${listAtms}">

															<c:url var="updateLink"
																value="/Atm/edit-atm-${atm.idAtm}"></c:url>
															<c:url var="deleteLink"
																value="/Atm/delete-atm-${atm.idAtm}"></c:url>


															<tr>
																<td class="text-primary font-montserrat v-align-middle">${atm.vendor}</td>
																<td class="text-primary font-montserrat v-align-middle">${atm.nameAtm}</td>
																<td class="text-primary font-montserrat v-align-middle">${atm.typeConnexion}</td>
																<td class="text-primary font-montserrat v-align-middle">${atm.adressIp}</td>
																<td class="text-primary font-montserrat v-align-middle">${atm.userSession}</td>
																<td class="text-primary font-montserrat v-align-middle">${atm.passwordSession}</td>
																<td class="text-primary font-montserrat v-align-middle">${atm.readingDisuqeLetter}</td>
																<td class="text-primary font-montserrat v-align-middle">${atm.repositoryFile}</td>

																<security:authorize access="hasRole('ADMIN')">

																	<td class="text-primary font-montserrat v-align-middle">
																		<div class="btn-group">

																			<button
																				onclick="window.location.href='${updateLink}'"
																				type="button" id="Update"
																				class="btn btn-sm btn-rounded btn-success">
																				<i class="fa fa-pencil"></i>
																			</button>

																			<a class="btn btn-sm  btn-rounded btn-danger delete"
																				data-title="are you sure to delete the Atm ?"
																				href="${deleteLink}"><i class="fa fa-trash-o"></i></a>
																		</div>
																	</td>

																</security:authorize>

															</tr>
														</c:forEach>


													</tbody>
													<tfoot>
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</tfoot>


												</table>





												<br>
												<div class="row b-a b-grey no-margin">
													<div
														class="col-md-3 p-l-10 sm-padding-15 align-items-center d-flex">
														<div>
															<h5
																class="font-montserrat all-caps small no-margin hint-text bold">Total
															</h5>
															<p class="no-margin">4</p>
														</div>
													</div>
													<div
														class="col-md-4 col-middle sm-padding-15 align-items-center d-flex">
														<div>
															<h5
																class="font-montserrat all-caps small no-margin hint-text bold">Local
																Connexion</h5>
															<p class="no-margin">3</p>
														</div>
													</div>
													<div
														class="col-md-3 col-middle sm-padding-15 align-items-center d-flex">
														<div>
															<h5
																class="font-montserrat all-caps small no-margin hint-text bold">Remote
																Connexion</h5>
															<p class="no-margin">1</p>
														</div>
													</div>

													<div class="col-md-2 text-right bg-primary padding-10">
														<h5
															class="font-montserrat all-caps small no-margin hint-text text-white bold">Last
															Modification</h5>
														<h4 class="no-margin text-white">22-01-1989</h4>
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

				<jsp:include page="../view/fragments/footer.jsp"></jsp:include>
			</div>

		</div>
	</div>
	<c:if test="${!empty msg }">
		<script type="text/javascript">
			$(function() {
				$('#addNewAppModal').modal('show');
			});
		</script>

	</c:if>

	<c:if test="${!empty editAtm }">
		<script type="text/javascript">
			$(function() {
				$('#addNewAppModal').modal('show');
			});
		</script>
	</c:if>


	<div class="modal fade  fill-in  " id="addNewAppModal" role="dialog"
		aria-labelledby="addNewAppModal" aria-hidden="true"
		data-backdrop="static">

		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header clearfix ">
					<h4 class="p-b-5">
						<span class="semi-bold"> <i class="fa fa-plus"></i> ADD New
						</span> ATM
					</h4>
				</div>



				<form:form modelAttribute="atm" method="POST">

					<div class="modal-body ">






						<div class="row clearfix">

							<div class="col-sm-6">
								<div
									class="form-group form-group-default form-group-default-select2">
									<label>Type Atm</label>
									<form:select path="Vendor" cssClass="full-width" id="Vendor"
										data-placeholder="Vendor" cssStyle="width: 100%;"
										data-init-plugin="select2" items="${ListVendors}" />

								</div>
							</div>




							<div class="col-sm-6">
								<div
									class="form-group form-group-default form-group-default-select2">
									<label>Agence</label>
									<form:select path="branch.idBranch" cssClass="full-width"
										id="branch" data-placeholder="branch" cssStyle="width: 100%;"
										data-init-plugin="select2" items="${branches}"
										itemValue="idBranch" itemLabel="nomBranch" />
								</div>
							</div>






						</div>

						<p>Host configuration</p>

						<div class="row clearfix">

							<div class="col-sm-12">
								<div
									class="form-group form-group-default form-group-default-select2">
									<label>Type Host</label>

									<form:select path="host.idHost" cssClass="full-width" id="host"
										data-placeholder="host" cssStyle="width: 100%;"
										data-init-plugin="select2" items="${hosts}" itemValue="idHost"
										itemLabel="nomHost" />

								</div>
							</div>


						</div>

						<div class="row clearfix">


							<div class="col-sm-6">
								<div class="form-group form-group-default">
									<label>Name </label>
									<form:input path="nameAtm" cssClass="form-control" />
								</div>
							</div>


							<div class="col-sm-6">
								<div class="form-group form-group-default">
									<label>N serie</label>
									<form:input path="NumeroSerie" cssClass="form-control" />
								</div>
							</div>

						</div>

						<p>Journal Folder</p>

						<div class="row clearfix" id="localDive">

							<div class="col-md-3">
								<div class="form-group form-group-default input-group">
									<div class="form-input-group">
										<label class="inline">Local</label>
									</div>
									<div class="input-group-append h-c-50">
										<span class="input-group-text transparent"> <input
											type="checkbox" data-init-plugin="switchery"
											id="ConnexionLocalHandler" data-size="small" data-color="red" />
										</span>
									</div>
								</div>
							</div>



							<div class="col-sm-9">
								<div class="form-group form-group-default required">
									<label>Address</label>
									<form:input path="repositoryFile" type="text"
										id="repositoryFile" class="form-control"
										placeholder="repository" disabled="true" />
								</div>
							</div>

						</div>
						
						
						<form:input path="typeConnexion" type="hidden"  id ="typeConnexion" cssClass="form-control" />
						
						
						<div class="row clearfix" id="remotDive">

							<div class="col-md-3">
								<div class="form-group form-group-default input-group">
									<div class="form-input-group">
										<label class="inline">Remot</label>
									</div>
									<div class="input-group-append h-c-50">
										<span class="input-group-text transparent"> <input
											type="checkbox" data-init-plugin="switchery"
											id="ConnexionRemotHandler" data-size="small" data-color="red" />
										</span>
									</div>
								</div>
							</div>


							<div class="col-md-3">
								<div class="form-group form-group-default required typehead"
									id="sample-three">
									<label>Disque</label>
									<form:input path="readingDisuqeLetter" type="text"
										cssClass="typeahead form-control" id="readingDisuqeLetter"
										placeholder="repository" disabled="true" />
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group form-group-default required">
									<label>Address IP</label>
									<form:input path="AdressIp" type="text" cssClass="form-control"
										id="AdressIp" placeholder="repository" value="" disabled="true" />
									
									</div>
								 
							</div>


						</div>
						<div class="row clearfix" id="windowsDiv">

							<div class="col-md-6">
								<div class="form-group form-group-default required">
									<label>User</label>
									<form:input path="userSession" type="text"
										cssClass="form-control" placeholder="User Session" />
								</div>
							</div>


							<div class="col-md-6">
								<div class="form-group form-group-default required">
									<label>Password</label>
									<form:input path="passwordSession" type="password"
										class="form-control" placeholder="Password Session" />
								</div>
							</div>

						</div>
					</div>

					<div class="modal-footer">

						<c:choose>

							<c:when test="${edit}">
								<form:hidden path="idAtm" />

								<button type="submit" class="btn btn-primary  btn-cons">Update</button>
			                                or 
			                                <button type="button"
									class="btn btn-cons">Close</button>

							</c:when>


							<c:otherwise>
								<button type="submit" class="btn btn-primary  btn-cons">
									<i class="fa fa-user-plus"></i> Add the User
								</button>
			                              or 
			                              <button type="button"
									class="btn btn-cons btn-danger" data-dismiss="modal">
									<i class="fa fa-times-circle" aria-hidden="true"></i> Close
								</button>
							</c:otherwise>

						</c:choose>
					</div>


				</form:form>

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

	<script src="<spring:url value="/resources/assets/js/form_wizard.js"/>"></script>


	<script
		src="<spring:url value="/resources/assets/plugins/classie/classie.js"/>"></script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

    <script src="<spring:url value="/resources/pages/js/ping.js"/>"></script>


	<script type="text/javascript">
	
	 
	    
	    
	    
		$(function() {

			
			
			
				
			
			$("#Vendor").select2({
				allowClear : true,
				placeholder : {
					id : "-1",
					text : "Vendor",
					selected : 'selected'
				},
				data : [ {
					id : -1,
					text : '',
					selected : 'selected',
					search : '',
					hidden : true
				} ]
			});

			$("#branch").select2({

				allowClear : true,
				placeholder : {
					id : "-1",
					text : "Branch",
					selected : 'selected'
				},
				data : [ {
					id : -1,
					text : '',
					selected : 'selected',
					search : '',
					hidden : true
				} ]

			});

			$("#host").select2({

				allowClear : true,
				placeholder : {
					id : "-1",
					text : "host",
					selected : 'selected'
				},
				data : [ {
					id : -1,
					text : '',
					selected : 'selected',
					search : '',
					hidden : true
				} ]

			});

			$('#show-modal').click(function() {
				$('#addNewAppModal').modal('show');
			});

			$('a.delete').confirm({
				content : "",
				type : 'red',
				typeAnimated : true,
				buttons : {

					Delete : {
						text : 'Delete Atm',
						btnClass : 'btn-red',
						action : function() {
							location.href = this.$target.attr('href');
						}
					},

					close : function() {
					}
				}
			});

			var countries = new Bloodhound({
				datumTokenizer : Bloodhound.tokenizers.whitespace,
				queryTokenizer : Bloodhound.tokenizers.whitespace,
				prefetch : "${pageContext.request.contextPath}/api/disque"
			});

			$('#readingDisuqeLetter').typeahead(null, {
				name : 'countries',
				source : countries
			});

			var elems = Array.prototype.slice.call(document
					.querySelectorAll('#ConnexionLocalHandler'));
			var elems2 = Array.prototype.slice.call(document
					.querySelectorAll('#ConnexionRemotHandler'));

			elems.forEach(function(html) {
				var switchery = new Switchery(html);
			});

			elems2.forEach(function(html) {
				var switchery = new Switchery(html);
			});

			
			$("#ConnexionRemotHandler").on("change", function()

			{

				var isDisabled = $('#AdressIp').prop('disabled');

				if (isDisabled == true) {

					$("#AdressIp").removeAttr("disabled");
					$("#readingDisuqeLetter").removeAttr("disabled");
					$("#typeConnexion").val("remote");
					$("#localDive").hide();
					
					

				}

				else {

					$("#AdressIp").prop('disabled', true);
					$("#readingDisuqeLetter").prop('disabled', true);
					$("#localDive").show();
				}

			});

			
			$("#ConnexionLocalHandler").on("change", function()

			{

				var isDisabled = $('#repositoryFile').prop('disabled');
				var x = document.getElementById("remotDive");
				if (isDisabled == true) {

					$("#repositoryFile").removeAttr("disabled");
					$("#typeConnexion").val("local");
					$("#remotDive").hide();
					$("#windowsDiv").hide();

				}

				else {

					$("#repositoryFile").prop('disabled', true);

					$("#remotDive").show();
					$("#windowsDiv").show();

				}

			});

		});
	</script>

</body>
</html>