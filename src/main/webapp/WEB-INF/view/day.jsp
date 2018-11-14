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


					<div class=" container-fluid container-fixed-lg ">

						<div class="row">
							<div class="col-md-5">

								<div class="card card-transparent">
									<div class="card-header ">
										<div class="card-title">Attached form layouts</div>
									</div>
									<div class="card-body">
										<h3>Uplaoding Log and journal file </h3>
										<p>Despite the UI, We thought of the User experience, With
											attached From Layouts you can simply categories Important
											fields and prioritize them.</p>
										<br>
										<div>
											<div class="profile-img-wrapp er m-t-5 inline">
												<img width="35" height="35"
													src="assets/img/profiles/avatar_small.jpg" alt=""
													data-src="assets/img/profiles/avatar_small.jpg"
													data-src-retina="assets/img/profiles/avatar_small2x.jpg">
												<div class="chat-status available"></div>
											</div>
											<div class="inline m-l-10">
												<p class="small hint-text">
													VIA senior product manage <br> for UI/UX at REVOX
												</p>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="col-md-7">

								<div class="card card-transparent">
									<div class="card-body">
										<form id="form-project" role="form" autocomplete="off"
											novalidate>
											<p>Basic Information</p>
											<div class="form-group-attached">
												<div class="form-group form-group-default required">
													<label>Project name</label> <input type="text"
														class="form-control" name="projectName" required>
												</div>
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
													<label>Investor <i
														class="fa fa-info text-complete m-l-5"></i>
													</label> <input type="text" class="form-control" name="investor">
												</div>
												<div class="row clearfix">
													<div class="col-md-6">
														<div class="form-group form-group-default required">
															<label>Starting date</label> <input id="start-date"
																type="text" class="form-control date" name="startDate"
																required>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group form-group-default">
															<label>Deadline</label> <input id="end-date" type="text"
																class="form-control date" name="endDate">
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group form-group-default required">
															<label>Website</label> <input type="text"
																class="form-control" name="url">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label class="inline">Availability</label>
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
																<label>Budget</label> <input type="text"
																	class="form-control usd" required>
															</div>
															<div class="input-group-append ">
																<span class="input-group-text">USD </span>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label>Profit</label> <input type="text"
																	class="form-control usd">
															</div>
															<div class="input-group-append ">
																<span class="input-group-text">USD </span>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label>Revenue</label> <input type="text"
																	class="form-control usd">
															</div>
															<div class="input-group-append ">
																<span class="input-group-text">USD </span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="pull-left">
												<div class="checkbox check-success  ">
													<input type="checkbox" checked="checked" value="1"
														id="checkbox-agree"> <label for="checkbox-agree">
														I hereby certify that the information above is true and
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
			<jsp:include page="../view/fragments/footer.jsp"></jsp:include>
		</div>
	</div>



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

</body>
</html>