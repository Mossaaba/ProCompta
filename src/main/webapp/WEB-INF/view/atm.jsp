<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
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


			<div class="page-content-wrapper">



				<!-- *************** -->
				<!--    container 1  -->
				<!-- *************** -->
				<div class="content">

					<div class=" container-fluid   container-fixed-lg">
						<ul class="nav nav-tabs nav-tabs-linetriangle   nav-stack-sm"
							role="tablist" data-init-reponsive-tabs="dropdownfx">
							<li class="nav-item"><a id="listeAtm"
								class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold"
								data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
									<span> <spring:message code="label.space"></spring:message>
								</span><span> </span><span> </span> <img
									src="<spring:url value="/resources/assets/img/atm.svg"/>"
									alt=""
									data-src="<spring:url value="/resources/assets/img/atm.svg"/>"
									data-src-retina="<spring:url value="/resources/assets/img/atm.svg"/>"
									width="64" height="64"> <span> <spring:message
											code="label.atms"></spring:message>
								</span>
							</a></li>
						</ul>
						<br>
						<div class="row bg-white">

							<div class="col-md-12">
								<div class="tab-content">

									<div
										class="tab-pane padding-20 sm-no-padding active slide-left"
										id="tab1">

										<div class="row row-same-height">



											<div class="col-md-12">
												<div class="pull-left">
													<div class="col-xs-12">

														<p class="font-montserrat blod text-primary bold fs-15">
															<i class="fa fa-list   m-l-5" aria-hidden="true"> </i>
															<spring:message code="lable.list"></spring:message>
															<spring:message code="label.atms"></spring:message>
														</p>
													</div>
												</div>
												<div class="pull-right">
													<div class="col-xs-12">
														<button id="show-modal"
															class="btn btn-rounded btn-primary m-b-10 bold fs-15 blod">
															<i class="fa fa-plus-circle"></i>
															<spring:message code="label.addNewATM"></spring:message>
														</button>
													</div>
												</div>

												<br>

												<div class=" ">


													<table class="table table-hover " id="dataTableAtm">
														<thead>
															<tr class="text-center">
																<td class="v-align-middle text-primary bold fs-14">


																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-link fa-stack-1x"></i>
																</span> <spring:message code="label.atmVendor"></spring:message>
																</td>
																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-server fa-stack-1x"></i>
																</span> <spring:message code="label.atmHost"></spring:message>
																</td>
																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-thumb-tack fa-stack-1x"></i>
																</span> <spring:message code="label.branchName"></spring:message>
																</td>


																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <img
																		width="25" height="22"
																		src="<spring:url value="/resources/assets/img/atm.svg"/>">
																</span> <spring:message code="label.atmName"></spring:message>

																</td>
																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-wifi fa-stack-1x"></i>
																</span> <spring:message code="label.atmConnexionType"></spring:message>

																</td>
																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-location-arrow fa-stack-1x"></i>
																</span> <spring:message
																		code="label.AdresseIpJournalFolderFolder"></spring:message>
																</td>
																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-user-circle fa-stack-1x"></i>
																</span> <spring:message code="label.windwosUser"></spring:message>


																</td>
																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa fa-key fa-stack-1x"></i>
																</span> <spring:message code="label.windwosPassword"></spring:message>
																</td>
																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-hdd-o fa-stack-1x"></i>
																</span> <spring:message code="label.journalDisuqe"></spring:message>
																</td>
																<td class="v-align-middle text-primary bold fs-14">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-folder fa-stack-1x"></i>
																</span> <spring:message code="label.journalFolder"></spring:message>
																</td>

																<security:authorize access="hasRole('ADMIN')">
																	<td class="v-align-middle text-primary bold fs-15">
																		<i class="fa fa-wrench fa-2x" aria-hidden="true"></i>
																	</td>
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
																	<td class="text-primary font-montserrat v-align-middle">${atm.host.nomHost}</td>
																	<td class="text-primary font-montserrat v-align-middle">${atm.branch.nomBranch}</td>
																	<td class="text-primary font-montserrat v-align-middle">${atm.nameAtm}</td>
																	<td class="text-primary font-montserrat v-align-middle">${atm.typeConnexion}</td>
																	<td class="text-primary font-montserrat v-align-middle">${atm.adressIp}</td>
																	<td class="text-primary font-montserrat v-align-middle">${atm.userSession}</td>
																	<td class="text-primary font-montserrat v-align-middle">${atm.passwordSession}</td>
																	<td class="text-primary font-montserrat v-align-middle">${atm.readingDisuqeLetter}</td>
																	<td class="text-primary font-montserrat v-align-middle">${atm.repositoryFile}</td>

																	<security:authorize access="hasRole('ADMIN')">

																		<td
																			class="text-primary font-montserrat v-align-middle">
																			<div class="btn-group">

																				<button
																					onclick="window.location.href='${updateLink}'"
																					type="button" id="Update"
																					class="btn btn-sm btn-rounded btn-success">
																					<i class="fa fa-pencil"></i>
																				</button>

																				<a class="btn btn-sm  btn-rounded btn-danger delete"
																					data-title="Are you sure to delete the Atm ?"
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
						<span class="font-montserrat blod text-primary bold fs-17">



							<c:if test="${!empty editAtm }">
								<i class="fa fa-info-circle"></i>
								<spring:message code="label.updateTheAtm"></spring:message>
							</c:if> <c:if test="${empty editAtm }">
								<i class="fa fa-info-circle"></i>
								<spring:message code="label.addNewAtmform"></spring:message>
							</c:if>



						</span>
					</h4>
				</div>



				<form:form modelAttribute="atm" method="POST" id="addAtmForm">

					<div class="modal-body ">

						<div class="row clearfix">

							<div class="col-sm-6">
								<div
									class="form-group form-group-default form-group-default-select2 required">
									<span class="font-montserrat blod  bold fs-15"> <i
										class="fa fa-link text-complete m-l-5"></i>
									</span>
									<spring:message code="label.atmVendor"></spring:message>
									<form:select path="Vendor" cssClass="full-width" id="Vendor"
										data-placeholder="Please select a Vendor"
										cssStyle="width: 100%;" data-init-plugin="select2"
										items="${ListVendors}" />

								</div>
							</div>




							<div class="col-sm-6">
								<div
									class="form-group form-group-default form-group-default-select2 required">
									<span class="font-montserrat blod  bold fs-15"> <i
										class="fa fa-thumb-tack text-complete m-l-5"></i>
									</span>
									<spring:message code="label.branchName"></spring:message>

									<form:select path="branch.idBranch" cssClass="full-width"
										id="branch" data-placeholder="branch" cssStyle="width: 100%;"
										data-init-plugin="select2" items="${branches}"
										itemValue="idBranch" itemLabel="nomBranch" />
								</div>
							</div>

						</div>

						<p class="font-montserrat blod text-primary bold fs-15">
							<span class="fa-stack fa-lg"> <i
								class="fa fa-square-o fa-stack-2x"></i> <i
								class="fa fa fa-server fa-stack-1x"></i>
							</span>
							<spring:message code="label.hostConfiguration"></spring:message>
						</p>

						<div class="row clearfix">

							<div class="col-sm-12">
								<div
									class="form-group form-group-default form-group-default-select2 required">
									<span class="font-montserrat blod  bold fs-15"> <i
										class="fa fa-server text-complete m-l-5"></i>
									</span>
									<spring:message code="label.atmHost"></spring:message>
									<form:select path="host.idHost" cssClass="full-width" id="host"
										data-placeholder="host" cssStyle="width: 100%;"
										data-init-plugin="select2" items="${hosts}" itemValue="idHost"
										itemLabel="nomHost" />

								</div>
							</div>


						</div>
						<p class="font-montserrat blod text-primary bold fs-15">
							<span class="fa-stack fa-lg"> <img width="32" height="32"
								src="<spring:url value="/resources/assets/img/atm.svg"/>">
							</span>
							<spring:message code="label.atmInformations"></spring:message>
						</p>
						<div class="row clearfix">


							<div class="col-sm-6">
								<div class="form-group form-group-default required">
									<label><spring:message code="label.atmName"></spring:message><img
										width="16" height="16"
										src="<spring:url value="/resources/assets/img/atm.svg"/>"></label>
									<form:input path="nameAtm" cssClass="form-control" />
								</div>
							</div>


							<div class="col-sm-6">
								<div class="form-group form-group-default">
									<label><spring:message code="label.atmSerieNumber"></spring:message><i
										class="fa fa-sort-numeric-desc text-complete m-l-5"
										aria-hidden="true"></i> </label>
									<form:input path="NumeroSerie" cssClass="form-control" />
								</div>
							</div>

						</div>

						<p class="font-montserrat blod text-primary bold fs-15">
							<span class="fa-stack fa-lg"> <i
								class="fa fa-square-o fa-stack-2x"></i> <i
								class="fa fa fa-folder fa-stack-1x"></i>
							</span>
							<spring:message code="label.JounralFileRepository"></spring:message>
						</p>

						<div class="row clearfix" id="localDive">

							<div class="col-md-3">
								<div class="form-group form-group-default input-group">
									<div class="form-input-group">
										<label class="inline"><spring:message
												code="label.LocalRepository"></spring:message></label>
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

									<label><spring:message
											code="label.LocalRepositoryFolder"></spring:message><i
										class="fa fa-folder text-complete m-l-5"></i> </label>
									<form:input path="repositoryFile" type="text"
										id="repositoryFile" class="form-control"
										placeholder="repository" disabled="true" />
								</div>
							</div>

						</div>


						<form:input path="typeConnexion" type="hidden" id="typeConnexion"
							cssClass="form-control" />


						<div class="row clearfix" id="remotDive">

							<div class="col-md-3">
								<div class="form-group form-group-default input-group">
									<div class="form-input-group">
										<label class="inline"><spring:message
												code="label.RemoteRepositoryFolder"></spring:message></label>
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
									<label><spring:message
											code="label.RemoteRepositoryDisuqe"></spring:message> <i
										class="fa fa-hdd-o text-complete m-l-5"></i> </label>
									<form:input path="readingDisuqeLetter" type="text"
										cssClass="typeahead form-control" id="readingDisuqeLetter"
										placeholder="repository" disabled="true" />
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group form-group-default required">
									<label><spring:message
											code="label.RemoteRepositoryAdressIp"></spring:message> <i
										class="fa fa-location-arrow text-complete m-l-5"></i> </label>
									<form:input path="AdressIp" type="text" cssClass="form-control"
										id="AdressIp" placeholder="repository" value=""
										disabled="true" />

								</div>

							</div>


						</div>
						<div class="row clearfix" id="windowsDiv">

							<div class="col-md-6">
								<div class="form-group form-group-default  ">
									<label><spring:message code="label.windwosUser"></spring:message>
										<i class="fa fa-user-circle  text-complete m-l-5"></i> </label>
									<form:input path="userSession" type="text"
										cssClass="form-control" placeholder="User Windows Session" />
								</div>
							</div>


							<div class="col-md-6">
								<div class="form-group form-group-default  ">
									<label><spring:message code="label.windwosPassword"></spring:message>
										<i class="fa fa fa-key text-complete m-l-5"></i> </label>
									<form:input path="passwordSession" type="password"
										class="form-control" placeholder="Password Windows Session" />
								</div>
							</div>

						</div>
					</div>

					<div class="modal-footer">

						<c:choose>

							<c:when test="${edit}">
								<form:hidden path="idAtm" />

								<button type="submit" class="btn btn-primary  btn-cons">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
									<spring:message code="label.update"></spring:message>
								</button>
			                                or 
			                               <button type="button"
									class="btn btn-cons btn-danger" data-dismiss="modal">
									<i class="fa fa-times-circle" aria-hidden="true"></i>
									<spring:message code="label.close"></spring:message>
								</button>

							</c:when>


							<c:otherwise>
								<button type="submit" class="btn btn-primary  btn-cons">
									<i class="fa fa-plus-circle"></i>
									<spring:message code="label.addNewATM"></spring:message>
								</button>
			                              or 
			                              <button type="button"
									class="btn btn-cons btn-danger" data-dismiss="modal">
									<i class="fa fa-times-circle" aria-hidden="true"></i>
									<spring:message code="label.close"></spring:message>
								</button>
							</c:otherwise>

						</c:choose>
					</div>


				</form:form>

			</div>
		</div>
	</div>

	<c:if test="${!empty msgTraitment }">
		<script type="text/javascript">
			$(document).ready(function() {
				$('body').pgNotification({
					style : 'circle',
					title : "${msgTraitment}",
					message : "${theATM}",
					position : 'top-right',
					timeout : 10000,
					type : "${style}"
				}).show();
			});
			
			
			
			
			
			
			$('#dataTableAtm')
			.DataTable(
					{
						"sDom" : "<'exportOptions2'T><'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>>"
								+ "<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "
								+ "<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "
								+ "<'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> <'row'<'col-sm-12 col-md-2'><'col-sm-12 col-md-10'>> "
								+ " <'row'<'col-sm-12 col-md-2'l><'col-sm-12 col-md-10'f>> <'table-responsive't>  "
								+ "<'row'<'col-sm-12 col-md-2'i><'col-sm-12 col-md-10'p>>",

						"fixedHeader" : true,
						"sPaginationType" : "bootstrap",
						"destroy" : true,
						"bPaginate" : true,
						"lengthMenu" : [
								[ 5, 10, 25, 50, -1 ],
								[ 5, 10, 25, 50, "All" ] ],
						"oLanguage" : {

							"sInfo" : "Atms liste resultat "
						},

						"oTableTools" : {
							"sSwfPath" : '<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/swf/copy_csv_xls_pdf.swf"/>',
							"aButtons" : [
								{
									"sExtends" : "csv",
									"sButtonText" : "<i class='pg-grid'></i>",
								},
								{
									"sExtends" : "xls",
									"sButtonText" : "<i class='fa fa-file-excel-o'></i>",
								},
								{
									"sExtends" : "pdf",
									"sButtonText" : "<i class='fa fa-file-pdf-o'></i>",
								},
								{
									"sExtends" : "copy",
									"sButtonText" : "<i class='fa fa-copy'></i>",
								} ]
					 
						},

						fnDrawCallback : function(
								oSettings) {

							$(
									'.export-options-container2')
									.append(
											$('.exportOptions2')); // Append the buttons to container export-options-container2 in the DOM

							// In the DOM you'll find something like: <a id="ToolTables_historyDataTable_XXXXX" class="btn btn-white DTTT_button_csv" data-original-title="" title=">

						}

					});
			
			
		</script>
	</c:if>




	<script src="<spring:url value="/resources/assets/js/card.js"/>"></script>
	<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/media/js/jquery.dataTables.min.js"/>"></script>
	<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/js/dataTables.tableTools.min.js"/>"></script>
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
	<script src="<spring:url value="/resources/pages/js/atm.js"/>"></script>

</body>
</html>