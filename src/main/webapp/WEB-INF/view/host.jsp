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
									<span> <spring:message code="label.space"></spring:message>
								</span><span> </span><span> </span><i class="fa fa-server fa-4x"></i> <span><spring:message code="label.hosts"></spring:message></span>
							</a></li>
						</ul>
						<br>
						<div class="row bg-white">

							<div class="col-md-4">
								<c:if test="${!empty editHost }">
									<br>
									<div class=" card card-default bg-warning-lighter ">
								</c:if>

								<c:if test="${empty editHost }">
                                     <div class="card card-transparent">
								</c:if>

								<div class="card-body text-center">

									<form:form modelAttribute="host" method="POST" id="addhostForm"
										autocomplete="off">

										<c:if test="${!empty editHost }">
											<p class="font-montserrat blod text-primary bold fs-15">
												<i class="fa fa-info-circle  fa-2x m-l-5 fa-spin  fa-fw" aria-hidden="true">
												</i> <spring:message code="label.updateTheHost"></spring:message>
											</p>
										</c:if>
										<c:if test="${empty editHost }">
											<p class="font-montserrat blod text-primary bold fs-15">
												<i class="fa fa-info-circle  fa-2x m-l-5 " aria-hidden="true">
												</i> <spring:message code="label.addNewHost"></spring:message>
											</p>
										</c:if>
										<hr>

										<div class="form-group-attached">

											<div class="form-group form-group-default required">
												<label><spring:message code="label.nameHost"></spring:message><i
													class="fa fa-server text-complete m-l-5"></i></label>
												<form:input path="nomHost" type="text"
													cssClass="form-control" />
											</div>

										</div>

										<p class="m-t-10"><spring:message code="label.valueCassettes"></spring:message></p>

										<div class="form-group-attached">

											<div class="row clearfix">



												<div class="col-md-6">
													<div
														class="form-group form-group-default input-group required">
														<div class="form-input-group">
															<label><spring:message code="label.valueCassette1"></spring:message><i
																class="fa fa-battery-full text-complete m-l-5"></i></label>
															<form:input path="configCassette1" type="number"
																cssClass="form-control usd" />
														</div>
														<div class="input-group-append ">
															<span class="input-group-text">DZD </span>
														</div>
													</div>
												</div>

												<div class="col-md-6">
													<div
														class="form-group form-group-default input-group required">
														<div class="form-input-group">
															<label><spring:message code="label.valueCassette2"></spring:message><i
																class="fa fa-battery-full text-complete m-l-5"></i></label>
															<form:input path="configCassette2" type="number"
																cssClass="form-control usd" />
														</div>
														<div class="input-group-append ">
															<span class="input-group-text">DZD </span>
														</div>
													</div>
												</div>

												<div class="col-md-6">
													<div
														class="form-group form-group-default input-group required">
														<div class="form-input-group">
															<label><spring:message code="label.valueCassette3"></spring:message><i
																class="fa fa-battery-full text-complete m-l-5"></i></label>
															<form:input path="configCassette3" type="number"
																cssClass="form-control usd" />
														</div>
														<div class="input-group-append ">
															<span class="input-group-text">DZD</span>
														</div>
													</div>
												</div>

												<div class="col-md-6">
													<div
														class="form-group form-group-default input-group required">
														<div class="form-input-group">
															<label><spring:message code="label.valueCassette4"></spring:message><i
																class="fa fa-battery-full text-complete m-l-5"></i></label>
															<form:input path="configCassette4" type="number"
																cssClass="form-control usd" />
														</div>
														<div class="input-group-append ">
															<span class="input-group-text">DZD</span>
														</div>
													</div>
												</div>



											</div>

										</div>
										<br>

										<c:choose>

											<c:when test="${edit}">

												<form:hidden path="idHost" />

												<form:button type="submit" id="addHostSuBmit"
													class="btn btn-primary  btn-cons">
													<i class="fa fa-plus-circle"></i> <spring:message code="label.update"></spring:message></form:button>
												<form:button type="button" id="ClearForm"
													class="btn btn-cons btn-danger">
													<i class="fa fa-times-circle"></i> <spring:message code="label.clear"></spring:message></form:button>

											</c:when>
											<c:otherwise>
												<form:button type="submit" id="addHostSuBmit"
													class="btn btn-primary  btn-cons">
													<i class="fa fa-plus-circle"></i> <spring:message code="label.add"></spring:message></form:button>
												<form:button type="button" id="ClearForm"
													class="btn btn-cons btn-danger">
													<i class="fa fa-times-circle"></i> <spring:message code="label.clear"></spring:message></form:button>
											</c:otherwise>

										</c:choose>


									</form:form>
								</div>
							</div>

						</div>

						<div class="col-md-8">

							<div class="card card-transparent">
								<div class="card-body">

									<p class="font-montserrat blod text-primary bold fs-15">
										<i class="fa fa-list fa-2x m-l-5" aria-hidden="true"> </i>
										<spring:message code="lable.list"></spring:message> <spring:message code="label.hosts"></spring:message>
									</p>
									<hr>


									<div class="row bg-white">



										<div class="col-md-12">

											<div class="card card-transparent">


												<div class="card-body">

													<table
														class="table table-hover table-responsive-block nowrap "
														id="tableHost">
														<thead>
															<tr>


																<th class="v-align-middle text-primary bold fs-10">
																<i
																	class="fa fa-server fa-3x fa-fw " aria-hidden="true"></i>
																	<spring:message code="label.nameHost"></spring:message>
																	</th>
																<th class="v-align-middle text-primary bold fs-10">
																<spring:message code="label.valueCassette1"></spring:message>
																<i class="fa fa-battery-full fa-3x fa-fw  "
																	aria-hidden="true"></i></th>
																	
																<th class="v-align-middle text-primary bold fs-10"><spring:message code="label.valueCassette2"></spring:message>
																<i
																	class="fa fa-battery-full fa-3x fa-fw "
																	aria-hidden="true"></i></th>
																	
																<th class="v-align-middle text-primary bold fs-10"><spring:message code="label.valueCassette3"></spring:message>
																<i
																	class="fa fa-battery-full fa-3x fa-fw "
																	aria-hidden="true"></i></th>
																	
																<th class="v-align-middle text-primary bold fs-10"><spring:message code="label.valueCassette4"></spring:message>
																<i
																	class="fa fa-battery-full fa-3x fa-fw "
																	aria-hidden="true"></i></th>

																<security:authorize access="hasRole('ADMIN')">
																	<th class="v-align-middle"></th>
																</security:authorize>
															</tr>
														</thead>
														<tbody>

															<c:forEach items="${hosts}" var="host">

																<c:url var="updateLink"
																	value="/host/edit-host-${host.idHost}"></c:url>
																<c:url var="deleteLink"
																	value="/host/delete-host-${host.idHost}"></c:url>


																<tr>

																	<td
																		class="text-primary font-montserrat v-align-middle password">${host.nomHost}</td>
																	<td class="text-primary font-montserrat v-align-middle">${host.configCassette1}</td>
																	<td class="text-primary font-montserrat v-align-middle">${host.configCassette2}</td>
																	<td class="text-primary font-montserrat v-align-middle">${host.configCassette3}</td>
																	<td class="text-primary font-montserrat v-align-middle">${host.configCassette4}</td>


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
																					data-title="Are you sure to delete the Host ?"
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

															</tr>
														</tfoot>
													</table>



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
					message : "${theHost}",
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
	<script src="<spring:url value="/resources/pages/js/host.js"/>"></script>


</body>
</html>