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

<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/jquery-confirm.min.css"/>" />
</head>
<body class="fixed-header windows desktop pace-done">

	<jsp:include page="../view/fragments/menu.jsp"></jsp:include>


	<div class="page-container ">
		<jsp:include page="../view/fragments/header.jsp"></jsp:include>


		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">
			<div class="page-content-wrapper">
				<div class="content ">


					<div class=" container-fluid   container-fixed-lg ">

						<ul class="nav nav-tabs nav-tabs-linetriangle   nav-stack-sm"
							role="tablist" data-init-reponsive-tabs="dropdownfx">
							<li class="nav-item"><a id="listeAtm"
								class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold"
								data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
									<span> <spring:message code="label.space"></spring:message> </span><span> </span><span> </span><i
									class="fa fa-thumb-tack fa-4x"></i> <span><spring:message code="label.branchs"></spring:message></span>
							</a></li>
						</ul>

						<br>

						<div class="row bg-white">

							<div class="col-md-5">

								<div class="card card-transparent">
									<div class="card-body text-center">

										<form:form modelAttribute="branch" method="POST"
											id="addbranchForm" autocomplete="off">

											<p class="font-montserrat blod text-primary bold fs-15">
												<i class="fa fa-info-circle  fa-2x m-l-5" aria-hidden="true">
												</i> <spring:message code="label.addNewBranche"></spring:message> 
											</p>
											<hr>
											<div class="form-group-attached">



												<div class="row clearfix">


													<div class="col-md-6">
														<div class="form-group form-group-default required">
															<label><spring:message code="label.codeBranche"></spring:message><i
																class="fa fa-paperclip text-complete m-l-5"></i>
															</label>
															<form:input path="codeBranche" type="text"
																cssClass="form-control" />
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group form-group-default ">
															<label><spring:message code="label.nameBranche"></spring:message><i
																class="fa fa-font text-complete m-l-5"></i>
															</label>
															<form:input path="nomBranch" type="text"
																cssClass="form-control" />
														</div>
													</div>

												</div>

											</div>

											<br>

											<div class="form-group-attached">

												<div class="form-group form-group-default">
													<label><spring:message code="label.adresseBranche"></spring:message> <i
														class="fa fa-map-marker text-complete m-l-5"></i>
													</label>
													<form:input path="adressBranch" type="text"
														cssClass="form-control" />
												</div>
												<br>
												<div class="row clearfix">

													<div class="col-md-6">
														<div class="form-group form-group-default ">
															<label><spring:message code="label.telephoneBranche"></spring:message> <i
																class="fa fa-phone text-complete m-l-5"></i>
															</label>
															<form:input path="phoneBranch" type="text"
																cssClass="form-control"
																onkeypress="return isNumberKey(event)" />
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label><spring:message code="label.nbrStationBranche"></spring:message><i
																	class="fa fa-sort-numeric-asc text-complete m-l-5"></i>
																</label>
																<form:input path="nbrStation" type="text"
																	cssClass="form-control usd"
																	onkeypress="return isNumberKey(event)" />
															</div>
															<div class="input-group-append ">
																<span class="input-group-text">Nbr </span>
															</div>
														</div>
													</div>
												</div>

											</div>
											<br>

											<c:choose>

												<c:when test="${edit}">

													<form:hidden path="idBranch" />

													<form:button type="submit" id="addidBranchSuBmit"
														class="btn btn-primary  btn-cons">
														<i class="fa fa-plus-circle"></i> <spring:message code="label.update"></spring:message></form:button>
													<form:button type="button" class="btn btn-cons btn-danger"
														id="ClearForm">
														<i class="fa fa-times-circle"></i> <spring:message code="label.clear"></spring:message></form:button>

												</c:when>
												<c:otherwise>
													<form:button type="submit" id="addidBranchSuBmit"
														class="btn btn-primary  btn-cons">
														<i class="fa fa-plus-circle"></i> <spring:message code="label.add"></spring:message></form:button>
													<form:button type="button" class="btn btn-cons btn-danger"
														id="ClearForm">
														<i class="fa fa-times-circle"></i> <spring:message code="label.clear"></spring:message></form:button>
												</c:otherwise>

											</c:choose>


										</form:form>
									</div>
								</div>

							</div>


							<div class="col-md-7">
								<div class="card card-transparent text-center">

									<div class="card-body text-center">

										<ul class="nav nav-tabs nav-tabs-linetriangle   nav-stack-sm"
											role="tablist" data-init-reponsive-tabs="dropdownfx">
											<li class="nav-item"><a id="listeAtm"
												class=" title text-uppercase text-primary font-montserrat all-caps small   bold"
												data-toggle="tab" href="#tab1" data-target="#tab1"
												role="tab"> <span><i class="fa fa-list fa-2x"></i>
														<spring:message code="lable.list"></spring:message> </span><span> 
														</span><span> </span> <span><spring:message code="label.branchs"></spring:message></span>
											</a></li>
										</ul>

										<br>
										<div class="row bg-white">



											<div class="col-md-12">

												<div class="card card-transparent">


													<div class="card-body">

														<table
															class="table table-hover table-responsive-block nowrap "
															id="tableBranch">
															<thead>
																<tr class="text-center">


																	<th class="v-align-middle text-primary bold fs-10"><i
																		class="fa fa-paperclip fa-3x fa-fw" aria-hidden="true"></i>
																		<spring:message code="label.codeBranche"></spring:message>
																		</th>
																	<th class="v-align-middle text-primary bold fs-10"><i
																		class="fa fa-font fa-3x fa-fw" aria-hidden="true"></i>
																		<spring:message code="label.nameBranche"></spring:message>
																		</th>
																	<th class="v-align-middle text-primary bold fs-10"><i
																		class="fa fa-sort-numeric-asc fa-3x fa-fw"
																		aria-hidden="true"></i><spring:message code="label.nbrStationBranche"></spring:message></th>

																	<security:authorize access="hasRole('ADMIN')">
																		<th class="v-align-middle text-primary bold fs-10">
																			<i class="fa fa-cog fa-3x fa-fw" aria-hidden="true"></i>
																		</th>
																	</security:authorize>
																</tr>
															</thead>
															<tbody>

																<c:forEach items="${Branchs}" var="branch">

																	<c:url var="updateLink"
																		value="/branch/edit-branch-${branch.idBranch}"></c:url>
																	<c:url var="deleteLink"
																		value="/branch/delete-branch-${branch.idBranch}"></c:url>


																	<tr>

																		<td
																			class="text-primary font-montserrat v-align-middle password">${branch.codeBranche}</td>
																		<td
																			class="text-primary font-montserrat v-align-middle">${branch.nomBranch}</td>
																		<td
																			class="text-primary font-montserrat v-align-middle">${branch.nbrStation}</td>


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

																					<a
																						class="btn btn-sm  btn-rounded btn-danger delete"
																						data-title="are you sure to delete the branche ?"
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

																</tr>
															</tfoot>
														</table>



														<br>
														<div>
															<div class="profile-img-wrapper m-t-5 inline">
																<div class="chat-status available"></div>
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


				<jsp:include page="../view/fragments/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<c:if test="${!empty msgTraitment }">
		<script type="text/javascript">
			$(document).ready(function() {
				$('body').pgNotification({
					style : 'circle',
					title : "${msgTraitment}",
					message : "${theBranche}",
					position : 'top-right',
					timeout : 10000,
					type : "${style}"
				}).show();
			});
		</script>
	</c:if>


	<script
		src="<spring:url value="/resources/assets/plugins/jquery-validation/js/jquery.validate.min.js"/>"></script>

	<script
		src="<spring:url value="/resources/assets/plugins/jquery-autonumeric/autoNumeric.js"/>"></script>

	<script
		src="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.liblink.js"/>"></script>

	<script src="<spring:url value="/resources/assets/js/card.js"/>"></script>

	<script src="<spring:url value="/resources/assets/js/tables.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/jquery-confirm.min.js"/>"></script>

	<script src="<spring:url value="/resources/pages/js/branche.js"/>"></script>


</body>
</html>