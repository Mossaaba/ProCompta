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
<title>ProCompta | BANK  </title>
<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"  
    href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"  
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="apple-touch-icon"  
	href="<spring:url value="/resources/pages/ico/logo.png"/>" />
<link rel="icon"  
	href="<spring:url value="/resources/pages/logo.png"/>" />
	
	
	
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/jquery-confirm.min.css"/>" />
<style type="text/css">
input[type="file"] {
	display: none;
}

.custom-file-upload {
	border: 1px solid #ccc;
	display: inline-block;
	padding: 6px 12px;
	cursor: pointer;
}
</style>


</head>


<body class="fixed-header windows desktop pace-done">

	<security:csrfMetaTags />


	<jsp:include page="../view/fragments/menu.jsp"></jsp:include>


	<div class="page-container ">
		<jsp:include page="../view/fragments/header.jsp"></jsp:include>
        <br>
		<br>
		<br>

		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">
			<div class="page-content-wrapper">
				<div class="content ">


					<div class=" container-fluid  container-fixed-lg m-t-60 ">

						<ul class="nav nav-tabs nav-tabs-linetriangle   nav-stack-sm"
							role="tablist" data-init-reponsive-tabs="dropdownfx">
							<li class="nav-item"><a id="listeAtm"
								class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold"
								data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
									<span><spring:message code="label.space"></spring:message></span><span>
								</span><span> </span><i class="fa fa-building fa-4x"></i> <span><spring:message
											code="label.bank"></spring:message></span>
							</a></li>
						</ul>

						<br>
						<div class="row bg-white">
							<div class="col-md-5">

								<div class="card card-transparent">
									<div class="card-header ">
										<div
											class="card-title font-montserrat blod text-primary bold fs-15">
											<i class="fa fa-list" aria-hidden="true"></i>
											<spring:message code="label.listBanks"></spring:message>
										</div>
									</div>

									<div class="card-body">

										<table
											class="table table-hover table-responsive-block nowrap "
											id="tableBank">
											<thead>
												<tr class="text-center">


													<th
														class="v-align-middle text-primary bold fs-12 text-uppercase"><i
														class="fa fa-building" aria-hidden="true"></i> <spring:message
															code="label.BankName"></spring:message></th>
													<th
														class="v-align-middle text-primary bold fs-12 text-uppercase"><i
														class="fa fa-picture-o" aria-hidden="true"></i> <spring:message
															code="label.Banklogo"></spring:message></th>
													<th
														class="v-align-middle text-primary bold fs-12 text-uppercase"><i
														class="fa fa-credit-card-alt" aria-hidden="true"></i> <spring:message
															code="label.BankBin"></spring:message> °</th>

													<security:authorize access="hasRole('ADMIN')">
														<th
															class="v-align-middle text-primary bold fs-17 text-uppercase ">
															<i class="fa fa-cog" aria-hidden="true"></i>
														</th>
													</security:authorize>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${banks}" var="bank">

													<c:url var="updateLink"
														value="/bank/edit-bank-${bank.idBank}"></c:url>
													<c:url var="deleteLink"
														value="/bank/delete-bank-${bank.idBank}"></c:url>


													<tr>

														<td
															class="text-primary font-montserrat text-uppercase v-align-middle password">${bank.abbreviation}</td>
														<td class="text-primary font-montserrat v-align-middle">

															<span class="thumbnail-wrapper d32 circular inline">
																<img
																src="<spring:url value="/resources/pages/img/profile-pictures/${bank.logo}"/>"
																alt=""
																data-src="<spring:url value="/resources/pages/img/profile-pictures/${bank.logo}"/>"
																data-src-retina="<spring:url value="/resources/pages/img/profile-pictures/${bank.logo}"/>"
																width="32" height="32">
														</span>



														</td>
														<td class="text-primary font-montserrat v-align-middle">${bank.bin}</td>


														<security:authorize access="hasRole('ADMIN')">
															<td class="text-primary font-montserrat v-align-middle">
																<div class="btn-group">
																	<button onclick="window.location.href='${updateLink}'"
																		type="button" id="Update"
																		class="btn btn-sm btn-rounded btn-success">
																		<i class="fa fa-pencil"></i>
																	</button>

																	<a class="btn btn-sm  btn-rounded btn-danger delete"
																		data-title="are you sure to delete the bank?"
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
										<div>
											<div class="profile-img-wrapper m-t-5 inline">
												<div class="chat-status available"></div>
											</div>

										</div>
									</div>
								</div>

							</div>

							<div class="col-md-7">


								<c:choose>

									<c:when test="${edit}">
										<br>
										<div class=" card card-default bg-warning-lighter ">
									</c:when>


									<c:otherwise>


										<div class="card card-transparent">
									</c:otherwise>

								</c:choose>


								<div class="card-body">

									<form:form modelAttribute="bank" method="POST" id="addBankForm"
										autocomplete="off">



										<p class="font-montserrat blod text-primary bold fs-15">
											<i class="fa fa-info-circle m-l-5" aria-hidden="true"> </i>
											<spring:message code="label.BankInfoForm"></spring:message>
										</p>

										<div class="form-group-attached">
											<form:errors path="abbreviation"
												cssClass="alert alert-danger" />
											<div class="form-group form-group-default required">
												<label><spring:message code="label.BankName"></spring:message><i
													class="fa fa-building text-complete m-l-5"></i></label>
												<form:input path="namBank" type="text"
													cssClass="form-control" />
											</div>

											<div class="row clearfix">
												<div class="col-md-6">


													<div class="form-group form-group-default">
														<label><spring:message code="label.BankAdresse"></spring:message><i
															class="fa fa-map text-complete m-l-5"></i> </label>
														<form:input path="adressBank" type="text"
															cssClass="form-control" />
													</div>

												</div>

												<div class="col-md-6">
													<div class="form-group form-group-default  ">
														<label><spring:message code="label.Banklogo"></spring:message><i
															class="fa fa-picture-o text-complete m-l-5"></i></label>
														<div class="">

															<label for="file-upload"
																class="custom-file-upload new_Btn" id="new_Btn">
																<i class="fa fa-cloud-upload text-complete m-l-5 "></i>
																Click here To Upload
															</label>

															<form:input path="logo" type='file' id='file'
																cssClass="btn btn-sm " />
															<br>

															<button id="UplaodLogo"
																class="btn btn-sm btn-primary pull-right"
																onclick="uplaod();" style="display: none;">
																<i class="fa fa-upload" aria-hidden="true"></i> Upload
															</button>

														</div>

													</div>
												</div>




											</div>

										</div>



										<div class="form-group-attached">

											<div class="form-group form-group-default required">
												<label><spring:message code="label.BankAbbreviation"></spring:message><i
													class="fa fa-address-card-o text-complete m-l-5"></i></label>
												<form:input path="abbreviation" type="text"
													cssClass="form-control" maxlength="9" />
											</div>





											<div class="row clearfix">

												<div class="col-md-6">
													<div class="form-group form-group-default">
														<label><spring:message code="label.BankPhone"></spring:message><i
															class="fa fa-phone-square text-complete m-l-5"></i></label>
														<form:input path="phoneBank" type="text"
															cssClass="form-control"
															onkeypress="return isNumberKey(event)" />
													</div>
												</div>

												<div class="col-md-6">
													<div
														class="form-group form-group-default input-group required">
														<div class="form-input-group">
															<label><spring:message code="label.BankBin"></spring:message><i
																class="fa fa-credit-card-alt text-complete m-l-5"></i></label>
															<form:input path="bin" type="text"
																cssClass="form-control usd " minlength="6" maxlength="6" />
														</div>
														<div class="input-group-append ">
															<span class="input-group-text">BIN N°</span>
														</div>
													</div>
												</div>
											</div>

										</div>
										<br>

										<c:choose>

											<c:when test="${edit}">

												<form:hidden path="idBank" />

												<form:button type="submit" id="addBankSumit"
													class="btn btn-primary  btn-cons">
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
													<spring:message code="label.update"></spring:message>
												</form:button>
												<button type="button" id="ClearForm"
													class="btn btn-cons btn-danger">
													<i class="fa fa-times-circle"></i>
													<spring:message code="label.clear"></spring:message>
												</button>

											</c:when>

											<c:otherwise>

												<form:button type="submit" id="addBankSumit"
													class="btn btn-primary  btn-cons">
													<i class="fa fa-plus-circle"></i>
													<spring:message code="label.add"></spring:message>
												</form:button>


												<button type="button" id="ClearForm"
													class="btn btn-cons btn-danger">
													<i class="fa fa-times-circle"></i>
													<spring:message code="label.clear"></spring:message>
												</button>

											</c:otherwise>

										</c:choose>


									</form:form>
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
			$(document)
					.ready(
							function() {
								$('body')
										.pgNotification(
												{
													style : 'circle',
													title : "${msgTraitment}",
													message : "${theBank}",
													position : 'top-right',
													thumbnail : '<img width="40" height="40" style="display: inline-block;" src="<spring:url value="/resources/pages/img/profile-pictures/${logo}"/>" data-src="<spring:url value="/resources/pages/img/profile-pictures/${logo}"/>" data-src-retina="<spring:url value="/resources/pages/img/profile-pictures/${logo}"/>" alt="">',
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
	<script src="<spring:url value="/resources/pages/js/bank.js"/>"></script>
</body>
</html>