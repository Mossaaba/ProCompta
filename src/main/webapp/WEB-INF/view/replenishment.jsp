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
							</span><span> </span><span> </span><i class="fa fa-plus-square fa-4x"></i>
								<span>Replenishment</span>
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
														class="fa fa-filter fa-2x"></i> Replenishment
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

										<spring:url value="/replenishment/find"
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
														<bsutton class="btn btn-danger bold"
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
														class="fa fa-plus-square fa-2x m-b-5"></i> Replenishment
														Resultat
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
															STARTING DATE :
															${replenishment.startingDateFilterReplenishment}</span>
													</c:if>
													<c:if
														test="${!empty replenishment.finishingDateFilterReplenishment  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															Finishing DATE :
															${replenishment.finishingDateFilterReplenishment}</span>
													</c:if>
													<c:if
														test="${!empty replenishment.startingTimeFilterReplenishment  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															STARTING TIME :
															${replenishment.startingTimeFilterReplenishment}</span>
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
																<a class="dropdown-item">How to filter </a> <a
																	class="dropdown-item" id="viewTable">Table</a> <a
																	class="dropdown-item" id="oneByOne">One by One</a>
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



													<div id="rootwizard" class="m-t-5">

														<ul
															class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm"
															role="tablist" data-init-reponsive-tabs="dropdownfx">

															<c:forEach var="replenishment"
																items="${listReplenishmentAfterFilter}">
																<li class="nav-item lo"><a data-toggle="tab"
																	href="#tab<c:out value = "${replenishment.idReplenishment}"/>"
																	data-target="#tab<c:out value = "${replenishment.idReplenishment}"/>"
																	role="tab"> <span> </span></a></li>
															</c:forEach>
														</ul>

														<div class="tab-content">

															<c:forEach var="replenishment"
																items="${listReplenishmentAfterFilter}"
																varStatus="counter">

																<c:choose>
																	<c:when test="${counter.index eq 1}">
																		<div class="tab-pane   active  "
																			id="tab<c:out value = "${replenishment.idReplenishment}"/>">
																	</c:when>
																	<c:otherwise>
																		<div class="tab-pane  "
																			id="tab<c:out value = "${replenishment.idReplenishment}"/>">
																	</c:otherwise>
																</c:choose>

																<div class="row row-same-height">
																	<div class="col-md-4 ">
																		<div
																			class="padding-20 sm-padding-5 sm-m-b-100 sm-m-t-100 bg-white clearfix ">


																			<ul class="pager wizard no-style">
																				<li class="next">
																					<button
																						class="btn btn-primary btn-cons btn-animated from-left fa fa-chevron-right pull-right"
																						type="button">
																						<span>Next</span>
																					</button>
																				</li>
																				<li class="next finish hidden">
																					<button
																						class="btn btn-primary btn-cons btn-animated from-left fa fa-cog pull-right"
																						type="button">
																						<span>Finish</span>
																					</button>
																				</li>
																				<li class="previous first hidden">
																					<button
																						class="btn btn-default btn-cons btn-animated from-left fa fa-cog pull-right"
																						type="button">
																						<span>First</span>
																					</button>
																				</li>
																				<li class="previous">
																					<button class="btn btn-default btn-cons pull-right"
																						type="button">
																						<span>Previous</span>
																					</button>
																				</li>
																			</ul>


																		</div>
																	</div>





																	<div class="col-md-12">
																		<div class="padding-30 sm-padding-5">
																			<span class="pull-left"> </span>
																			<table class="table table-hover" id="tableRepl">
																				<thead>
																					<tr class="text-center">

																						<th
																							class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">
																							<i class="fa fa-cube fa-2x" aria-hidden="true"></i>
																							<br>casette
																						</th>
																						<th
																							class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">
																							<i class="fa fa-money fa-2x" aria-hidden="true"></i>
																							<br>Denomination
																						</th>
																						<th
																							class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">
																							<i class="fa fa-hand-o-left fa-2x"
																							aria-hidden="true"></i> <br> befor
																						</th>
																						<th
																							class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">
																							<i class="fa fa-hand-o-down fa-2x"
																							aria-hidden="true"></i> <br> after
																						</th>
																						<th
																							class="font-montserrat fs-12 all-caps text-primary bold v-align-middle">
																							<i class="fa fa-calculator fa-2x"
																							aria-hidden="true"></i><br> diffrence
																						</th>
																					</tr>
																				</thead>
																				<tr>

																					<td class="col-lg-2 col-md-3 col-sm-2"><span
																						class="m-l-10 font-montserrat fs-12 all-caps">
																							Cassette 1 </span></td>
																					<td class=" col-lg-2 col-md-3 col-sm-2"><label
																						class="badge"> <span class="fs-12 ">DZD
																								${replenishment.cassetteOneValueBefor} </span>
																					</label></td>
																					<td class=" col-lg-2 col-md-3 col-sm-3 ">
																						<h4 class="text-warning no-margin font-montserrat">${replenishment.cassetteOneBefor}</h4>
																					</td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  ">
																						<h4 class="text-primary no-margin font-montserrat">${replenishment.cassetteOneAfter}</h4>
																					</td>
																					<td
																						class="font-montserrat  all-caps text-primary bold v-align-middle">
																						<c:set var="diffcass1"
																							value="${replenishment.cassetteOneAfter}-${replenishment.cassetteOneBefor}" />

																						<h4 class="text-primary no-margin font-montserrat">
																							<c:out
																								value="${replenishment.cassetteOneAfter-replenishment.cassetteOneBefor}" />
																						</h4>

																					</td>


																				</tr>
																				<tr>

																					<td class="col-lg-2 col-md-3 col-sm-2 "><span
																						class="m-l-10 font-montserrat fs-12 all-caps">
																							Cassette 2 </span></td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  "><label
																						class="badge"> <span class="fs-12 ">DZD
																								${replenishment.cassetteTwoValueBefor}</span>
																					</label></td>
																					<td class=" col-lg-2 col-md-3 col-sm-3 ">
																						<h4 class="text-warning no-margin font-montserrat">${replenishment.cassetteTwoBefor}</h4>
																					</td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  ">
																						<h4 class="text-primary no-margin font-montserrat">${replenishment.cassetteTwoAfter}</h4>
																					</td>
																					<td
																						class="font-montserrat  all-caps text-primary bold v-align-middle">


																						<h4 class="text-primary no-margin font-montserrat">
																							<c:out
																								value="${replenishment.cassetteTwoAfter-replenishment.cassetteTwoBefor}" />
																						</h4>

																					</td>


																				</tr>
																				<tr>


																					<td class="col-lg-2 col-md-3 col-sm-2 "><span
																						class="m-l-10 font-montserrat fs-12 all-caps">
																							Cassette 3 </span></td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  "><label
																						class="badge"> <span class="fs-12 ">DZD
																								${replenishment.cassetteThreeValueBefor}</span>
																					</label></td>
																					<td class=" col-lg-2 col-md-3 col-sm-3  ">
																						<h4 class="text-warning no-margin font-montserrat">${replenishment.cassetteThreeBefor}</h4>
																					</td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  ">
																						<h4 class="text-primary no-margin font-montserrat">${replenishment.cassetteThreeAfter}</h4>
																					</td>
																					<td
																						class="font-montserrat  all-caps text-primary bold v-align-middle">


																						<h4 class="text-primary no-margin font-montserrat">
																							<c:out
																								value="${replenishment.cassetteThreeAfter-replenishment.cassetteThreeBefor}" />
																						</h4>

																					</td>


																				</tr>
																				<tr>

																					<td class="col-lg-2 col-md-3 col-sm-2 "><span
																						class="m-l-10 font-montserrat fs-12 all-caps">
																							Cassette 4 </span></td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  "><label
																						class="badge"> <span class="fs-12 ">DZD
																								${replenishment.cassetteFourValueBefor}</span>
																					</label></td>
																					<td class=" col-lg-2 col-md-3 col-sm-3  ">
																						<h4 class="text-warning no-margin font-montserrat">${replenishment.cassetteFourBefor}</h4>
																					</td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  ">
																						<h4 class="text-primary no-margin font-montserrat">${replenishment.cassetteFourAfter}</h4>
																					</td>
																					<td
																						class="font-montserrat  all-caps text-primary bold v-align-middle">


																						<h4 class="text-primary no-margin font-montserrat">
																							<c:out
																								value="${replenishment.cassetteFourAfter-replenishment.cassetteFourBefor}" />
																						</h4>

																					</td>


																				</tr>
																				<tr>

																					<td class="col-lg-2 col-md-3 col-sm-2 "><span
																						class="m-l-10 font-montserrat fs-12 all-caps">
																							reject <span class="fa-stack fa-lg"> <i
																								class="fa fa-money fa-stack-1x"></i> <i
																								class="fa fa-ban fa-stack-2x text-danger"></i>
																						</span>
																					</span></td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  "></td>
																					<td class=" col-lg-2 col-md-3 col-sm-3  ">
																						<h4 class="text-warning no-margin font-montserrat">${replenishment.cassetteRejectBefor}</h4>
																					</td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  ">
																						<h4 class="text-primary no-margin font-montserrat">${replenishment.cassetteRejectAfter}</h4>
																					</td>
																					<td
																						class="font-montserrat  all-caps text-primary bold v-align-middle">


																						<h4 class="text-primary no-margin font-montserrat">
																							<c:out
																								value="${replenishment.cassetteRejectAfter-replenishment.cassetteRejectBefor}" />
																						</h4>

																					</td>


																				</tr>
																				<tr>

																					<td class="col-lg-2 col-md-3 col-sm-2 "><span
																						class="m-l-10 font-montserrat fs-12 all-caps">
																							retract <span class="fa-stack fa-lg"> <i
																								class="fa fa-money fa-stack-1x"></i> <i
																								class="fa fa-ban fa-stack-2x text-danger"></i>
																						</span>
																					</span></td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  "></td>
																					<td class=" col-lg-2 col-md-3 col-sm-3  ">
																						<h4 class="text-warning no-margin font-montserrat">${replenishment.cassetteRetractBefor}</h4>
																					</td>
																					<td class=" col-lg-2 col-md-3 col-sm-2  ">
																						<h4 class="text-primary no-margin font-montserrat">${replenishment.cassetteRetractAfter}</h4>
																					</td>
																					<td
																						class="font-montserrat  all-caps text-primary bold v-align-middle">


																						<h4 class="text-primary no-margin font-montserrat">
																							<c:out
																								value="${replenishment.cassetteRetractBefor-replenishment.cassetteRetractAfter}" />
																						</h4>

																					</td>


																				</tr>

																			</table>


																			<br>
																			<div class="row b-a b-grey no-margin">
																				<div
																					class="col-md-3 p-l-10 sm-padding-15 align-items-center d-flex">
																					<div>
																						<h5
																							class="font-montserrat all-caps small no-margin hint-text bold">DATE
																							AND TIME</h5>
																						<span class="no-margin text-primary"> Date
																							replenishment :
																							${replenishment.dateReplenishment} <br> Time
																							replenishment :
																							${replenishment.timeReplenishment}


																						</span>


																					</div>
																				</div>


																				<div
																					class="col-md-3 p-l-10 sm-padding-15 align-items-center d-flex">
																					<div>
																						<h5
																							class="font-montserrat all-caps small no-margin hint-text bold">Total
																							befor replenishment</h5>
																						<h4 class="no-margin text-warning">
																							DZD

																							<c:out
																								value="${(replenishment.cassetteOneBefor*replenishment.cassetteOneValueBefor)+
																				(replenishment.cassetteTwoBefor*replenishment.cassetteTwoValueBefor)+
																				(replenishment.cassetteThreeBefor*replenishment.cassetteThreeValueBefor)+
																				(replenishment.cassetteFourBefor*replenishment.cassetteFourValueBefor)}" />

																						</h4>


																					</div>
																				</div>


																				<div class="col-md-6 text-right bg-primary  ">
																					<h5
																						class="font-montserrat all-caps small no-margin hint-text text-white bold">Total
																						actuel</h5>
																					<h4 class="no-margin text-white">
																						DZD
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


														</c:forEach>







													</div>
												</div>




											</div>
										</div>


										<div id="cardBodyDateTable">
											<div class="pull-left">
												<input type="text" id="search-table"
													class="form-control pull-left "
													placeholder="Search with date or time">
											</div>
											<table
												class="table table-hover demo-table-search table-responsive-block table-sm"
												id="tableWithSearch">
												<thead>
													<tr class="text-center">
														<th class="v-align-middle text-primary bold fs-12"><span
															class="fa-stack fa-lg"> <i
																class="fa fa-square-o fa-stack-2x"></i> <i
																class="fa fa-calendar-o fa-stack-1x"></i>
														</span> <br> DATE AND TIME</th>
														
														<th class="v-align-middle text-primary bold fs-12"></th>

														<th class="v-align-middle text-primary bold fs-12">Cassette <span
															class="fa-stack fa-lg"> <i
																class="fa fa-square-o fa-stack-2x"></i>  1
														</span></th>



														<th class="v-align-middle text-primary bold fs-12">Cassette <span
															class="fa-stack fa-lg"> <i
																class="fa fa-square-o fa-stack-2x"></i> 2
														</span>  2</th>



														<th class="v-align-middle text-primary bold fs-12">Cassette <span
															class="fa-stack fa-lg"> <i
																class="fa fa-square-o fa-stack-2x"></i> 3
														</span>  </th>



														<th class="v-align-middle text-primary bold fs-12">Cassette <span
															class="fa-stack fa-lg"> <i
																class="fa fa-square-o fa-stack-2x"></i> 4
														</span>  </th>




														<th class="v-align-middle text-primary bold fs-12"><span
															class="fa-stack fa-lg"> <i
																class="fa fa-money fa-stack-1x"></i> <i
																class="fa fa-ban fa-stack-2x text-danger"></i>
														</span> <br> Reject</th>

														<th class="v-align-middle text-primary bold fs-12"><span
															class="fa-stack fa-lg"> <i
																class="fa fa-money fa-stack-1x"></i> <i
																class="fa fa-ban fa-stack-2x text-danger"></i>
														</span> <br> Retrcat</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach var="replenishment"
														items="${listReplenishmentAfterFilter}">
														<tr class="text-center">
															<td class="text-primary font-montserrat v-align-middle">
																${replenishment.dateReplenishment} <br>

																${replenishment.timeReplenishment}
															</td>
															<td
																class=" font-montserrat v-align-middle text-primary bold fs-16 "
																nowrap="nowrap"><label class="fs-12 "> <span
																	class="  fs-16 "> Befor </span>
															</label> <br> <label class="fs-12"> <span
																	class="fs-16  "> After</span>

															</label></td>


															<td
																class=" font-montserrat v-align-middle text-warning bold fs-16 "
																nowrap="nowrap"><label class="fs-12 "> <span
																	class="badge fs-12">
																		${replenishment.cassetteOneValueBefor} DZD </span> &nbsp;</label>
																	<span class="fs-12 text-primary ">
																		${replenishment.cassetteOneBefor} </span>


															</label> <br> <label class="fs-12"> <span
																	class="fs-12 badge">
																		${replenishment.cassetteOneValueAfter} DZD</span> <label>&nbsp;</label>
																	<span class="fs-12 text-primary">
																		${replenishment.cassetteOneAfter}</span>



															</label></td>
															<td
																class=" font-montserrat v-align-middle text-warning bold fs-16 "
																nowrap="nowrap"><label class="fs-12 "> <span
																	class="badge fs-12">
																		${replenishment.cassetteTwoValueBefor} DZD </span> <label>&nbsp;</label>
																	<span class="fs-12 text-primary ">
																		${replenishment.cassetteTwoBefor} </span>


															</label> <br> <label class="fs-12"> <span
																	class="fs-12 badge">
																		${replenishment.cassetteTwoValueAfter} DZD</span> <label>&nbsp;</label>
																	<span class="fs-12 text-primary">
																		${replenishment.cassetteTwoAfter}</span>



															</label></td>
															<td
																class=" font-montserrat v-align-middle text-warning bold fs-16 "
																nowrap="nowrap"><label class="fs-12 "> <span
																	class="badge fs-12">
																		${replenishment.cassetteThreeValueBefor} DZD </span> <label>&nbsp;</label>
																	<span class="fs-12 text-primary ">
																		${replenishment.cassetteThreeBefor} </span>


															</label> <br> <label class="fs-12"> <span
																	class="fs-12 badge">
																		${replenishment.cassetteThreeValueAfter} DZD</span> <label>&nbsp;</label>
																	<span class="fs-12 text-primary">
																		${replenishment.cassetteThreeAfter}</span>



															</label></td>
															<td
																class=" font-montserrat v-align-middle text-warning bold fs-16 "
																nowrap="nowrap"><label class="fs-12 "> <span
																	class="badge fs-12">
																		${replenishment.cassetteFourValueBefor} DZD </span> <label>&nbsp;</label>
																	<span class="fs-12 text-primary ">
																		${replenishment.cassetteFourBefor} </span>


															</label> <br> <label class="fs-12"> <span
																	class="fs-12 badge">
																		${replenishment.cassetteFourValueAfter} DZD</span> <label>&nbsp;</label>
																	<span class="fs-12 text-primary">
																		${replenishment.cassetteFourAfter}</span>



															</label></td>
															<td
																class=" font-montserrat v-align-middle text-warning bold fs-16 "
																nowrap="nowrap"><label class="fs-12 "> <span
																	class="fs-12 text-primary ">
																		${replenishment.cassetteRejectBefor} </span>


															</label>  <label class="fs-12"> <span
																	class="fs-12 text-primary">
																		${replenishment.cassetteRejectAfter}</span>



															</label></td>
															<td
																class=" font-montserrat v-align-middle text-warning bold fs-16 "
																nowrap="nowrap"><label class="fs-12 "> <span
																	class="fs-12 text-primary ">
																		${replenishment.cassetteRetractBefor} </span>


															</label> <label class="fs-12"> <span
																	class="fs-12 text-primary">
																		${replenishment.cassetteRetractAfter}</span>
															</label></td>

														</tr>


													</c:forEach>


												</tbody>

											</table>

											<br>







										</div>


									</div>
								</div>
							</div>
						</div>
				</div>

				</c:if>






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
	<script src="<spring:url value="/resources/assets/js/form_wizard.js"/>"></script>
	<script src="<spring:url value="/resources/pages/js/Datepair.js"/>"></script>


	<script
		src="<spring:url value="/resources/pages/js/replenishment.js"/>"></script>

	<script type="text/javascript">
	 
	$(' .lo').hide();
	
	$('#tableWithSearch').DataTable();
 

	var table = $('#tableWithSearch');

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

	$('#search-table').keyup(function() {
		table.fnFilter($(this).val());
	});

	 
		 
		

 
	 
		
	</script>
</body>
</html>