<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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





				<div class="content">

					<ul class="nav nav-tabs nav-tabs-linetriangle   nav-stack-sm"
						role="tablist" data-init-reponsive-tabs="dropdownfx">
						<li class="nav-item"><a id="listeAtm"
							class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold"
							data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
								<span> <spring:message code="label.space"></spring:message>
							</span><span> </span><span> </span><i class="fa fa-money fa-4x"></i> <span>Cash
									Balance </span>
						</a></li>
					</ul>
					<br>
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					<!-- BLOC FILTER  -->
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->
					<!-- -------------------------------------------------------- -->


					<c:if test="${empty Filter }">
						<div class="col-lg-12 sm-no-padding">
							<div class="card card-transparent">
								<div class="card-body no-padding">
									<div id="card-advance" class="card card-default">
										<div class="card-header  ">
											<div class="card-title">

												<h5>
													<span class="semi-bold text-primary"> <i
														class="fa fa-filter fa-2x"></i> Cash Balance
													</span> Filter
												</h5>
											</div>
											<div class="card-controls">
												<ul>

													<li><a href="#" class="card-collapse"
														data-toggle="collapse"><i
															class="card-icon card-icon-collapse"></i></a></li>

													<li><a href="#" class="card-maximize"
														data-toggle="maximize"><i
															class="card-icon card-icon-maximize"></i></a></li>

												</ul>
											</div>
										</div>

										<spring:url value="/cashBalance/find"
											var="formUrlReplenishment" />

										<form:form action="${formUrlReplenishment}" method="POST"
											modelAttribute="replenishment" id="replenishmentFilterForm">
											<div class="card-body">

												<div class="row">
													<div class="col-md-4">

														<div
															class="form-group form-group-default form-group-default-select2 ">
															<label class="">ATM</label>
															<form:select path="idAtm" cssClass="full-width"
																data-placeholder="Select an ATM"
																data-init-plugin="select2" id="ATM">
																<c:forEach var="atm" items="${listATM}">
																	<form:option value="${atm.idAtm}">${atm.nameAtm} </form:option>
																</c:forEach>
															</form:select>
														</div>

													</div>
													<div class="col-md-8">
														<div class="row">

															<div class="col-md-6">

																<div class="form-group form-group-default input-group  ">

																	<div class="form-input-group" id="startDate">
																		<label>Start Date <b class="text-danger fs-16">*</b>
																		</label>
																		<form:input path="startingDateFilterReplenishment"
																			type="text" id="StartingDateFilterReplenishment"
																			class="form-control date" placeholder="Pick a date"
																			autocomplete="off" />
																	</div>

																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-calendar"></i></span>
																	</div>
																</div>

															</div>

															<div class="col-md-6">

																<div class="form-group form-group-default input-group  ">

																	<div class="form-input-group" id="finishDate">
																		<label>Finising Date <b
																			class="text-danger fs-16">*</b></label>
																		<form:input path="finishingDateFilterReplenishment"
																			type="text" id="FinishingDateFilterReplenishment"
																			class="form-control date" placeholder="Pick a date"
																			autocomplete="off" />
																	</div>

																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-calendar"></i></span>
																	</div>
																</div>

															</div>


														</div>


													</div>
												</div>

												<div class="row">
													<div class="col-md-4"></div>
													<div class="col-md-8">
														<div class="row">

															<div class="col-md-6">
																<div class="form-group form-group-default input-group  ">

																	<div class="form-input-group">
																		<label>Start Time</label>
																		<form:input path="startingTimeFilterReplenishment"
																			type="text" class="form-control time"
																			placeholder="Pick a date" autocomplete="off" />
																	</div>

																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-clock-o"></i></span>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group form-group-default input-group  ">

																	<div class="form-input-group">
																		<label>Finishing Time</label>
																		<form:input path="finisingTimeFilterReplenishment"
																			type="text" class="form-control time endTime "
																			placeholder="Pick a date" autocomplete="off" />
																	</div>

																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-calendar"></i></span>
																	</div>
																</div>
															</div>

														</div>
													</div>
												</div>
												<br>
												<div class="row b-grey no-margin ">
													<div class="col-md-12 text-center">
														<button class="btn btn-primary bold" type="submit">
															<i class="fa fa-search fa-3x"></i> Submit
														</button>
														<button class="btn btn-danger bold"
															id="clearFormReplenishment"> <i
															class="fa fa-eraser fa-3x"></i> Clear
														</button>
													</div>
												</div>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>


					</c:if>

					<c:if test="${!empty Filter }">
						<div class="col-lg-12 sm-no-padding text-center">
							<div class="card card-transparent">
								<div class="card-body no-padding">
									<div id="card-advance-resultat" class="card card-default">
										<div class="card-header  ">
											<div class="card-title">

												<h5>
													<span class="semi-bold text-primary bold"> <i
														class="fa fa-money fa-2x m-b-5"></i> Cash Balance result


													</span>
												</h5>
												<br>


												<c:if test="${!empty Filter }">
													<span
														class="   p-t-5 m-l-5 p-b-5 inline fs-12 text-primary bold">
														<i class="fa fa-filter fa-2x"></i> Filter :
													</span>


													<c:if
														test="${!empty replenishment.startingDateFilterReplenishment }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<i class="fa fa-calendar-o" aria-hidden="true"></i> DATE
															: ${replenishment.startingDateFilterReplenishment}
														</span>
													</c:if>

													<c:if test="${1==1 }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<i class="fa fa-clock-o" aria-hidden="true"></i> TIME
															:12:00:00

														</span>
													</c:if>
													<c:if
														test="${!empty replenishment.finisingTimeFilterReplenishment  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															Finishing TIME :
															${replenishment.finisingTimeFilterReplenishment}</span>
													</c:if>



													<br>
													<br>
													<button class="btn btn-sm btn-primary "
														onclick="window.location.href='<spring:url value="/replenishment"/>'">
														<i class="fa fa-filter fa-2x"></i> New Filter
													</button>


												</c:if>
											</div>
											<div class="card-controls">
												<ul>
													<li>
														<div class="dropdown">
															<a id="card-settings" data-target="#" href="#"
																data-toggle="dropdown" aria-haspopup="true"
																role="button" aria-expanded="false"> <i
																class="card-icon card-icon-settings "></i>
															</a>
															<div class="dropdown-menu dropdown-menu-right"
																role="menu" aria-labelledby="card-settings">
																<a class="dropdown-item">Export To PDF </a> <a
																	class="dropdown-item" id="viewTable">Export To csv
																</a> <a class="dropdown-item" id="oneByOne">Export To
																	xls</a>
															</div>
														</div>
													</li>
													<li><a class="card-collapse" data-toggle="collapse"><i
															class="card-icon card-icon-collapse" id="collapseBtn"></i></a></li>

													<li><a class="card-maximize" data-toggle="maximize"><i
															class="card-icon card-icon-maximize"></i></a></li>

												</ul>
											</div>
										</div>
										<div class="card-body" id="cardBodyOneByOne">


											<div class="card card-transparent">
												<div class="card-header ">


													<div class="pull-left export-options-container "></div>
													<div class="clearfix"></div>
												</div>


												<div class="card-body" id="cardBodyOneByOnex">

													<div class="col-lg-12 col-xl-12 col-xlg-12 m-b-11">
														<div class="row">
															<div class="col-md-12">

																<div
																	class="widget-12 card no-border widget-loader-circle no-margin">

																	<div class="card-body">
																		<div class="row">
																			<div>
																				<h2 class="pull-left m-t-5 m-b-5">
																					<i class="fa fa-calendar-o" aria-hidden="true"></i>
																					Last replenishment
																				</h2>
																				<h2 class="pull-left m-l-50 m-t-5 m-b-5 text-danger">
																					<span class="">
																						${replenishment.startingDateFilterReplenishment} </span>
																					<span class="text-danger fs-12"> 14:22:00 </span>
																				</h2>


																				<div>
																					<div class="col-md-12">




																						<div class="table-responsive">

																							<table class="table table-hover " id="tableRepl">
																								<thead>
																									<tr class="text-center">


																										<th
																											class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">

																											<br>

																										</th>


																										<th colspan="4"
																											class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">
																											<i class="fa fa-cube fa-2x"
																											aria-hidden="true"></i> <br>CASH
																										</th>


																										<th colspan="4"
																											class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">
																											<i class="fa fa-money fa-2x"
																											aria-hidden="true"></i> <br>CONSUME
																										</th>


																										<th colspan="3"
																											class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">
																											<i class="fa fa-calculator fa-2x"
																											aria-hidden="true"></i><br> BALANCE
																										</th>




																									</tr>

																								</thead>
																								<tr>

																									<td></td>





																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											notes </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											Denomination </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											total </span></td>

																									<td></td>

																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											notes </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											Denomination </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											total </span></td>


																									<td></td>

																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											notes </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											Denomination </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1"><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											total </span></td>


																								</tr>
																								<tr>



																									<td class="col-lg-1 col-md-1 col-sm-1 "><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											Cassette 1 </span></td>

																									<td><span class="fs-14 text-primary bold ">
																											600 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 500 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-primary bold "> <c:out
																												value="${600*500}" />
																									</span></td>
																									<td><span class="bg-complete fs-20">
																											| </span></td>

																									<td><span class="fs-14 text-info bold ">
																											100 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 500 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-info bold "> <c:out
																												value="${100*500}" />
																									</span></td>
																									<td><span class="bg-complete fs-20">
																											| </span></td>

																									<td><span class="fs-14 text-primary bold ">
																											500 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 500 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-primary bold "> <c:out
																												value="${500*500}" />
																									</span></td>


																								</tr>
																								<tr>



																									<td class="col-lg-1 col-md-1 col-sm-1 "><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											Cassette 2 </span></td>

																									<td><span class="fs-14 text-primary bold ">
																											200 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 1000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-primary bold "> <c:out
																												value="${200*1000}" />
																									</span></td>
																									<td><span class="bg-complete fs-20">
																											| </span></td>


																									<td><span class="fs-14 text-info bold ">
																											177 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 1000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-info bold "> <c:out
																												value="${177*1000}" />
																									</span></td>
																									<td><span class="bg-complete fs-20">
																											| </span></td>

																									<td><span class="fs-14 text-primary bold ">
																											23 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 1000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-primary bold "> <c:out
																												value="${23*500}" />
																									</span></td>


																								</tr>

																								<tr>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											Cassette 3 </span></td>

																									<td><span class="fs-14 text-primary bold ">
																											20 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 2000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-primary bold "> <c:out
																												value="${20*2000}" />
																									</span></td>
																									<td><span class="bg-complete fs-20">
																											| </span></td>



																									<td><span class="fs-14 text-info bold ">
																											20 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 2000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-info bold "> <c:out
																												value="${20*2000}" />
																									</span></td>
																									<td><span class="bg-complete fs-20">
																											| </span></td>

																									<td><span class="fs-14 text-primary bold ">
																											0</span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 2000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-primary bold "> 0 </span></td>


																								</tr>
																								<tr>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><span
																										class="m-l-10 font-montserrat fs-12 all-caps">
																											Cassette 4 </span></td>

																									<td><span class="fs-14 text-primary bold ">
																											700 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 2000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-primary bold "> <c:out
																												value="${700*2000}" />
																									</span></td>

																									<td><span class="bg-complete fs-20">
																											| </span></td>
																									<td><span class="fs-14 text-info bold ">
																											300 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 2000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-info bold "> <c:out
																												value="${300*2000}" />
																									</span></td>
																									<td><span class="bg-complete fs-20">
																											| </span></td>

																									<td><span class="fs-14 text-primary bold ">
																											400 </span></td>
																									<td class="col-lg-1 col-md-1 col-sm-1 "><label
																										class="fs-12 "> <span
																											class="badge fs-12"> 2000 DZD </span> &nbsp;
																									</label></td>
																									<td class=""><span
																										class="fs-14 text-primary bold "> <c:out
																												value="${400*2000}" /></span></td>




																								</tr>


																							</table>


																						</div>

																						<div class="row b-a b-grey no-margin">
																							<div class="col-md-4 text-right bg-primary  ">
																								<h5
																									class="font-montserrat all-caps small no-margin hint-text text-white bold">Total
																									added</h5>
																								<h4 class="no-margin text-white">
																									1940000 DZD
																									<c:out
																										value="${(replenishment.cassetteOneAfter*replenishment.cassetteOneValueAfter)+
																				(replenishment.cassetteTwoAfter*replenishment.cassetteTwoValueAfter)+
																				(replenishment.cassetteThreeAfter*replenishment.cassetteThreeValueAfter)+
																				(replenishment.cassetteFourAfter*replenishment.cassetteFourValueAfter)}" />
																								</h4>
																							</div>

																							<div class="col-md-5  text-center">
																								<div>
																									<h5
																										class="font-montserrat all-caps small no-margin hint-text bold">Total
																										consumed</h5>
																									<h4 class="no-margin text-info">
																										831000 DZD

																										<c:out
																											value="${(replenishment.cassetteOneBefor*replenishment.cassetteOneValueBefor)+
																				(replenishment.cassetteTwoBefor*replenishment.cassetteTwoValueBefor)+
																				(replenishment.cassetteThreeBefor*replenishment.cassetteThreeValueBefor)+
																				(replenishment.cassetteFourBefor*replenishment.cassetteFourValueBefor)}" />

																									</h4>


																								</div>
																							</div>


																							<div class="col-md-3 text-right bg-primary  ">
																								<h5
																									class="font-montserrat all-caps small no-margin hint-text text-white bold">Total
																									Balance</h5>
																								<h4 class="no-margin text-white">
																									1109000 DZD
																									<c:out
																										value="${(replenishment.cassetteOneAfter*replenishment.cassetteOneValueAfter)+
																				(replenishment.cassetteTwoAfter*replenishment.cassetteTwoValueAfter)+
																				(replenishment.cassetteThreeAfter*replenishment.cassetteThreeValueAfter)+
																				(replenishment.cassetteFourAfter*replenishment.cassetteFourValueAfter)}" />
																								</h4>
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




											</div>
										</div>





									</div>
								</div>
							</div>
						</div>
				</div>



				</c:if>



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
	<script src="<spring:url value="/resources/assets/js/form_wizard.js"/>"></script>
	<script src="<spring:url value="/resources/pages/js/Datepair.js"/>"></script>


	<script
		src="<spring:url value="/resources/pages/js/replenishment.js"/>"></script>

	<script type="text/javascript">
	 
	$(' .lo').hide();
	
	$('#tableRepl').DataTable();
 

	var table = $('#tableRepl');

	var settings = {
		"sDom" : " <'row'<l>> <'exportOptions'T><'table-responsive't><'row'<p i>>",
		"sPaginationType" : "bootstrap",
		"destroy" : true,

		"scrollCollapse" : true,
		"oLanguage" : {
			"sLengthMenu" : "_MENU_ ",
			"sInfo" : "Showing <b>_START_ to _END_</b> Replinshments of _TOTAL_ Operations"
		},
		"aLengthMenu" : [
				[ 5, 10, 25, 50, -1 ],
				[ "5 entreis ", "10 entreis ", "25 entreis", "50 entreis",
						"All" ] ],

		"iDisplayLength" : 5,
		"bAutoWidth" : false,
		aoColumns : [ {
			sWidth : '5%'
		}, {
			sWidth : '5%'
		}, {
			sWidth : '5%'
		}, {
			sWidth : '5%'
		}, {
			sWidth : '5%'
		}, {
			sWidth : '5%'
		}, {
			sWidth : '5%'
		} , {
			sWidth : '5%'
		}   ],

		"oTableTools" : {
			"sSwfPath" : "<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/swf/copy_csv_xls_pdf.swf"/>",
			"aButtons" : [
					{
						"sExtends" : "csv",
						"sButtonText" : "<i class='pg-grid text-primary'></i>",
					},
					{
						"sExtends" : "xls",
						"sButtonText" : "<i class='fa fa-file-excel-o text-primary'></i>",
					},
					{
						"sExtends" : "pdf",
						"sButtonText" : "<i class='fa fa-file-pdf-o text-primary'></i>",
					},
					{
						"sExtends" : "copy",
						"sButtonText" : "<i class='fa fa-copy text-primary'></i>",
					} ]
		},
		fnDrawCallback : function(oSettings) {
			$('.export-options-container').append($('.exportOptions'));
		}
	};

	table.dataTable(settings);

	$('#tableRepl').keyup(function() {
		table.fnFilter($(this).val());
	});

	 
		 
		

 
	 
		
	</script>
</body>
</html>