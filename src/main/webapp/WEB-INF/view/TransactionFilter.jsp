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

<title>ProCompta | TRANSACTIONS</title>
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

        <br>
		<br>
		<br>




		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">


			<div class="page-content-wrapper">



				<div class="content">
				
				<div class="row center text-center">
							 <div class="col-md-4"></div>
							<div class="col-md-4 text-center">
								<ul class="nav nav-tabs nav-tabs-linetriangle  nav-stack-sm"
									role="tablist" data-init-reponsive-tabs="dropdownfx">
									<li class="nav-item text-center"><a id="listeAtm"
										class=" title text-uppercase card-title bold  fs-16  text-primary font-montserrat all-caps small   bold text-center "
										data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
											<span> <i class="fa fa-exchange fa-4x"></i> <spring:message code="label.space"></spring:message></span>
											   
								        <span > <spring:message code="label.transaction"></spring:message>    </span>
									</a>
									
									</li>
								</ul>
								 
							</div>
							
							 

						</div>
				

					 
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
														class="fa fa-filter fa-2x"></i><spring:message code="label.transaction"></spring:message>   
													</span> <spring:message code="label.filter"></spring:message>
												</h5>
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
																<a href="#" class="dropdown-item">How to filter </a> <a
																	href="#" class="dropdown-item">Resultat</a> <a href="#"
																	class="dropdown-item">About</a>
															</div>
														</div>
													</li>
													<li><a href="#" class="card-collapse"
														data-toggle="collapse"><i
															class="card-icon card-icon-collapse"></i></a></li>
													<li><a href="#" class="card-refresh"
														data-toggle="refresh"><i
															class="card-icon card-icon-refresh"></i></a></li>
													<li><a href="#" class="card-maximize"
														data-toggle="maximize"><i
															class="card-icon card-icon-maximize"></i></a></li>

												</ul>
											</div>
										</div>

										<spring:url value="/transaction/find" var="formUrlTrnsaction" />

										<form:form action="${formUrlTrnsaction}" method="POST"
											modelAttribute="transaction" id="TransactionFilterForm">


											<div class="card-body">


												<div class="row ">
													<div class="col-md-3">



														<div
															class="form-group form-group-default form-group-default-select2 ">
															<label class=""><spring:message code="label.vendor"></spring:message></label>
															<form:select path="transactionVendor"
																cssClass="full-width" data-placeholder="Select a vendor "
																data-init-plugin="select2" id="vendor">
																<option value="Diebold-nixdorf">Diebold-nixdorf</option>
																<option value="NCR">NCR</option>
															</form:select>
														</div>


													</div>
													<div class="col-md-3">

														<div
															class="form-group form-group-default form-group-default-select2 ">
															<label class=""><spring:message code="label.atm"></spring:message></label>
															<form:select path="transactionHostATM"
																cssClass="full-width" data-placeholder="Select an ATM"
																data-init-plugin="select2" id="ATM" items="${listATM}" />

														</div>


													</div>



													<div class="col-md-6">

														<div class="row "  >

															<div class="col-md-6 form-group-attached">



																<div
																	class="form-group form-group-default input-group required" id="divStartingDate">
																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-calendar"></i></span>
																	</div>
																	<div class="form-input-group input-sm" >
																		<form:input path="transactionDateStarting" type="text"
																			class="form-control date"
																			placeholder="Please select a start date" autocomplete="off" id="transactionDateStarting"/>
																	</div>


																</div>


																<div class="form-group form-group-default input-group  " >
																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-clock-o"></i></span>
																	</div>
																	<div class="form-input-group input-sm">
																		<form:input path="transactionTimeStarting" type="text" 
																			id="transactionTimeStarting" class="form-control time start "
																			placeholder="Please select a start time" autocomplete="off" />
																	</div>


																</div>




															</div>
															<div class="col-md-6 form-group-attached">



																<div class="form-group form-group-default input-group required " id="divFinishingDate">

																	<div class="form-input-group input-sm required">
																		<form:input path="transactionDateFinishing"
																			type="text" class="form-control date"
																			placeholder="Please select a finish date" autocomplete="off"  id="transactionDateFinishing"/>
																	</div>
																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-calendar"></i></span>
																	</div>


																</div>
																<div class="form-group form-group-default input-group  ">


																	<div class="form-input-group input-sm">

																		<form:input path="transactionTimeFinishing"  
																			type="text" class="form-control time endTime " id="transactionTimeFinishing"
																			placeholder=" Please select a finish time" autocomplete="off" />
																	</div>
																	<div class="input-group-append ">
																		<span class="input-group-text"><i
																			class="fa fa-clock-o"></i></span>
																	</div>


																</div>


															</div>
														</div>
														<br>


													</div>





												</div>


												<div class="row clearfix ">

													<div class="col-md-3  ">

														<div class="form-group form-group-default   ">

															<label class="">&nbsp; <i
																class="fa fa-credit-card-alt"></i> &nbsp; <spring:message code="label.cardNumber"></spring:message> 
																&nbsp;
															</label>


															<div class="row clearfix p-t-5 ">

																<div class="col-md-4 no-margin no-padding" >

																	<div class="form-group form-group-default" id="partOneCard">
																		<form:input path="transactionCardPartOne" type="text"
																			cssClass="form-control input-sm fs-16 autonumeric"
																			maxlength="6" id="cardNumberP1" autocomplete="off"
																			placeholder="999999"
																			onkeypress="return isNumberKey(event)" />
																	</div>

																</div>

																<div class="col-md-4 no-margin no-padding ">
																	<div
																		class="form-group form-group-default bold   disabled  ">
																		<input type="text"
																			class="form-control bold fs-16 input-sm "
																			maxlength="6" id="cardNumber" disabled="disabled"
																			value="xxxxxx" />
																	</div>
																</div>



																<div class="col-md-4 no-margin no-padding" >
																	<div class="form-group form-group-default " id="partTwoCard">
																		<form:input type="text" path="transactionCardPartTwo"
																			class="autonumeric form-control input-sm fs-16 "
																			maxlength="4" id="cardNumberP2" autocomplete="off"
																			placeholder="9999"
																			onkeypress="return isNumberKey(event)" />
																	</div>
																</div>


															</div>


														</div>



													</div>

													<div class="col-md-3">

														<diV class="form-group form-group-default form-group-default-select2  ">
															<label class=""><spring:message code="label.TransactionType"></spring:message></label> <br>
															<form:select path="transactionType" cssClass="full-width"
																data-placeholder="Select Country"
																data-init-plugin="select2" id="transactionType">
																<option value="WITHDRAWAL">WITHDRAWAL</option>
																<option value="OTHER">Other</option>


															</form:select>
														</div>



													</div>





													<div class="col-md-2">
														<div class="form-group form-group-default input-group">
															<div class="input-group-append ">
																<span class="input-group-text">DZD</span>
															</div>

															<div class="form-input-group">
																<label><spring:message code="label.AmountMin"></spring:message></label> <br>
																<form:input path="transactionHostAmounttMin"
																	type="number" id="montantMin"
																	onkeypress="return isNumberKey(event)"
																	class="form-control usd" />
															</div>

														</div>
													</div>



													<div class="col-md-2">

														<div class="form-group form-group-default input-group">
															<div class="form-input-group">
																<label><spring:message code="label.AmountMax"></spring:message></label> <br>
																<form:input path="transactionHostAmountMax"
																	type="number" id="montantMax"
																	onkeypress="return isNumberKey(event)"
																	class="form-control usd" />
															</div>
															<div class="input-group-append ">
																<span class="input-group-text">DZD </span>
															</div>
														</div>
													</div>

													<div class="col-md-2">
														<div class="form-group form-group-default ">
															<label><i class="fa fa-sort-numeric-asc"></i>&nbsp;<spring:message code="label.Auth"></spring:message>
															</label> <br>
															<form:input path="taransaction_AUTH" type="text"
																class="form-control" maxlength="8"
																onkeypress="return isNumberKey(event)"  autocomplete="off"/>


														</div>

													</div>

												</div>



												<br>
												<div class="row b-grey no-margin " id="WincorDive">
													<div class="col-md-12">

														<div class="card card-transparent">
															<div class="card-body no-padding">
																<div id="card-advanceWincor" class="card card-default">
																	<div class="card-header  ">
																		<div class="card-title">
																			<h5>
																				<span class="semi-bold  "> <i
																					class="fa fa-info-circle fa-2x"></i> <spring:message code="label.onlyfor"></spring:message>
																				</span> <spring:message code="label.DieboldNixdorfMachine"></spring:message>
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
																	<div class="card-body">
																		<div class="row b-grey no-margin ">


																			<div class="col-md-4">

																				<div
																					class="form-group form-group-default form-group-default-select2 required">
																					<label class=""><spring:message code="label.CashTaken"></spring:message></label>
																					<form:select path="transactionCardStatus"
																						cssClass="full-width"
																						data-placeholder="Select Country"
																						data-init-plugin="select2" id="cashStatus">

																						<option value="true">YES</option>
																						<option value="false">NO</option>


																					</form:select>
																				</div>
																			</div>
																			<div class="col-md-4">

																				<div
																					class="form-group form-group-default form-group-default-select2 required">
																					<label class=""><spring:message code="label.CardTaken"></spring:message></label>
 
																					<form:select path="transactionCashStatus"
																						cssClass="full-width"
																						data-placeholder="Select Country"
																						data-init-plugin="select2" id="cardStatus">

																						<option value="true">YES</option>
																						<option value="false">NO</option>
																					</form:select>
 
																				</div>
																			</div>
																			<div class="col-md-4">

																				<div
																					class="form-group form-group-default form-group-default-select2 required">
																					<label class=""><spring:message code="label.errorTransaction"></spring:message></label>
																					<form:select path="errorTransaction"
																						class="full-width"
																						data-placeholder="Select Country"
																						data-init-plugin="select2" id="transactionError"
																						items="${errorsTransaction}" />
 
																				</div>
																			</div>

																		</div>
 
																	</div>
																</div>
															</div>
														</div>

													</div>

												</div>


												<div class="row b-grey no-margin ">
													<div class="col-md-12 text-center">
 
														<button class="btn btn-primary bold" type="submit" id="subFormTransaction">
															<i class="fa fa-search fa-3x"></i> <spring:message code="label.search"></spring:message>
														</button>
														<button class="btn btn-danger bold" id="clearTransactionForm" >
															<i class="fa fa-eraser fa-3x"></i> <spring:message code="label.clear"></spring:message>
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
														class="fa fa-exchange fa-2x m-b-5"></i> <spring:message code="label.TransactionResult"></spring:message>  
													</span>
												</h5>
												<br>
												<c:if test="${!empty Filter }">
													<span
														class="   p-t-5 m-l-5 p-b-5 inline fs-12 text-primary bold">
														<i class="fa fa-filter fa-2x"></i> <spring:message code="label.filter"></spring:message> :
													</span>


													<!--  <span class=" label label-COLOR-PRIMARY-LIGHTER p-t-5 m-l-5 p-b-5 inline fs-12">VENDOR : </span>-->

													<c:if
														test="${transactionFilter.transactionHostATM ne '-1' }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.atm"></spring:message>  : ${transactionFilter.transactionHostATM}</span>
													</c:if>
													<c:if
														test="${!empty transactionFilter.transactionDateStarting  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.startingDate"></spring:message> : ${transactionFilter.transactionDateStarting}</span>
													</c:if>
													<c:if
														test="${!empty transactionFilter.transactionDateFinishing  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.finishingDate"></spring:message> :
															${transactionFilter.transactionDateFinishing}</span>
													</c:if>

													<c:if
														test="${!empty transactionFilter.transactionTimeStarting  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.startingTime"></spring:message> : ${transactionFilter.transactionTimeStarting}
														</span>
													</c:if>

													<c:if
														test="${!empty transactionFilter.transactionTimeFinishing  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.finishingTime"></spring:message> :
															${transactionFilter.transactionTimeFinishing} </span>
													</c:if>

													<c:if
														test="${!empty transactionFilter.transactionCardPartOne }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.cardNumber"></spring:message>
															:${transactionFilter.transactionCardPartOne}******${transactionFilter.transactionCardPartTwo}
														</span>
													</c:if>

													<c:if
														test="${transactionFilter.transactionHostAmounttMin ne '0' }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">

															<spring:message code="label.AmountMin"></spring:message> :
															${transactionFilter.transactionHostAmounttMin} </span>
													</c:if>
													<c:if
														test="${transactionFilter.transactionHostAmountMax ne '0' }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">

															<spring:message code="label.AmountMax"></spring:message> :
															${transactionFilter.transactionHostAmountMax} </span>
													</c:if>
													<c:if
														test="${transactionFilter.transactionType  ne '-1'  }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.TransactionType"></spring:message> :${transactionFilter.transactionType}</span>
													</c:if>
													<c:if test="${!empty transactionFilter.taransaction_AUTH }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.Auth"></spring:message> : ${transactionFilter.taransaction_AUTH}</span>
													</c:if>
													<c:if
														test="${transactionFilter.transactionCardStatus ne '-1' }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.CardTaken"></spring:message> :${transactionFilter.transactionCardStatus}</span>
													</c:if>
													<c:if
														test="${transactionFilter.transactionCashStatus ne '-1' }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.CashTaken"></spring:message> : :${transactionFilter.transactionCashStatus}</span>
													</c:if>
													<c:if test="${transactionFilter.errorTransaction ne '-1' }">
														<span
															class=" label label-info p-t-5 m-l-5 p-b-5 inline fs-12">
															<spring:message code="label.errorTransaction"></spring:message> :${transactionFilter.errorTransaction}
														</span>
													</c:if>

													<br>
													<br>
													<button class="btn btn-sm btn-primary " data-toggle="tooltip" data-placement="bottom" 
													title="Search transaction with a new filter " data-animation="true"
														onclick="window.location.href='<spring:url value="/transaction"/>'">
														<i class="fa fa-filter fa-2x"></i> <spring:message code="label.newFilter"></spring:message>
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
																<a href="#" class="dropdown-item">Resultat</a> <a
																	href="#" class="dropdown-item">About</a>
															</div>
														</div>
													</li>
													<li><a href="#" class="card-collapse"
														data-toggle="collapse"><i
															class="card-icon card-icon-collapse"></i></a></li>
													<li><a href="#" class="card-refresh"
														data-toggle="refresh"><i
															class="card-icon card-icon-refresh"></i></a></li>
													<li><a href="#" class="card-maximize"
														data-toggle="maximize"><i
															class="card-icon card-icon-maximize"></i></a></li>

												</ul>
											</div>
										</div>
										<div class="card-body">


											<div class="card card-transparent">
												<div class="card-header ">

													<div class="pull-right">
														<input type="text" id="search-table"
															class="form-control pull-right" placeholder="Search">
													</div>
													<div class="pull-left export-options-container "></div>
													<div class="clearfix"></div>
												</div>
												<div class="card-body">
													<table
														class="table table-hover demo-table-search table-responsive-block table-sm"
														id="tableWithSearch">
														<thead>
															<tr class="text-center">
																<th class="v-align-middle text-primary bold fs-12">
																	<span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-link fa-stack-1x"></i>
																</span><br> <spring:message code="label.vendor"></spring:message>
																</th>
																<th class="v-align-middle text-primary bold fs-12"><span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <img
																		width="25" height="22"
																		src="<spring:url value="/resources/assets/img/atm.svg"/>">
																</span> <br> <spring:message code="label.atm"></spring:message></th>
																<th class="v-align-middle text-primary bold fs-12"><span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-calendar fa-stack-1x"></i>
																</span> <br> <spring:message code="label.date"></spring:message></th>
																<th class="v-align-middle text-primary bold fs-12"><span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-credit-card-alt fa-stack-1x"></i>
																</span> <br> <spring:message code="label.cardNumber"></spring:message></th>
																<th class="v-align-middle text-primary bold fs-12"><span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-exchange fa-stack-1x"></i>
																</span> <br> <spring:message code="label.TransactionType"></spring:message></th>
																<th class="v-align-middle text-primary bold fs-12"><span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-money fa-stack-1x"></i>
																</span> <br> <spring:message code="label.amount"></spring:message></th>
																<th class="v-align-middle text-primary bold fs-12"><span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-sort-numeric-asc fa-stack-1x"></i>
																</span> <br> <spring:message code="label.Auth"></spring:message></th>

																<th class="v-align-middle text-primary bold fs-12"><span
																	class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-eye fa-stack-1x"></i>
																</span> <br> <spring:message code="label.details"></spring:message></th>

															</tr>
														</thead>
														<tbody>
															<c:forEach var="transaction"
																items="${TrasanctionFilterList}">
																<tr class="text-center"
																	id="${transaction.idtransaction}">
																	<td class="text-primary font-montserrat v-align-middle">
																		   
																		
																		 
														              <c:if test = "${transaction.vendor eq 'Diebold Nixdorf'}">
														            
														            
														            <span class="thumbnail-wrapper d50   inline" >
														             
														             
														             
														            <img src="<spring:url value="/resources/pages/img/vendor/dn.png"/>"
														             alt="" data-src="<spring:url value="/resources/pages/img/vendor/dn.png"/>" 
														              width="50" height="50">
														            </span>
														            
														             </c:if>
														             
														             <c:if test = "${transaction.vendor eq 'NCR'}">
														             <span class="thumbnail-wrapper d50 inline" >
														            <img src="<spring:url value="/resources/pages/img/vendor/ncr.png"/>"
														             alt="" data-src="<spring:url value="/resources/pages/img/vendor/ncr.png"/>" 
														              width="30" height="30">
														            </span>     
														             </c:if>
														             
														             	
																		 </td>
																	<td class="text-primary font-montserrat v-align-middle">${transaction.transactionHostATM}</td>
																	<td class="text-primary font-montserrat v-align-middle">${transaction.transactionDateHost}</td>
																	<td class="text-primary font-montserrat v-align-middle">${transaction.transactionHostCard}</td>
																	<td class="text-primary font-montserrat v-align-middle">${transaction.transactionType}</td>

																	<c:choose>
																		<c:when
																			test="${transaction.transactionHostAmount ne '0.00' && !empty transaction.transactionHostAmount && transaction.cashTaken ne 'false' }">
																			<td
																				class="text-primary font-montserrat v-align-middle details-control">
																				${transaction.transactionHostAmount}
													 							<button class="btn btn-primary btn-xs" id="rowChild"  data-toggle="tooltip" data-placement="bottom" 
													                                                                                 title="see cassette distribution " data-animation="true" >

																					<i class="fa fa-caret-down" aria-hidden="true"
																						id="down"></i>
																				</button>
																			</td>
																		</c:when>


																		<c:otherwise>
																			<td
																				class="text-primary font-montserrat v-align-middle">
																				${transaction.transactionHostAmount}</td>
																		</c:otherwise>
																	</c:choose>


																	<td class="text-primary font-montserrat v-align-middle">${transaction.taransaction_AUTH}</td>
																	<td class="text-primary font-montserrat v-align-middle">
																		<div class="btn-group">
																			<button type="button" class="btn btn-primary" title="Transaction detail" data-animation="true" 
																				data-id="${transaction.idtransaction}"
																				data-toggle="modal"
																				data-target="#modalDetailsTransaction">
																				<i class="fa fa-eye" aria-hidden="true"></i>
																			</button>
																			<button type="button" data-toggle="modal" data-id="${transaction.idtransaction}"
																			 data-target="#modalHostInfos" title="Response Host detail" data-animation="true"
																			 class="btn btn-primary">
																				<i class="fa fa-server" aria-hidden="true"></i>
																			</button>
																		</div>

																	</td>

																</tr>


															</c:forEach>


														</tbody>

													</table>
												</div>
												<div class="row b-a b-grey no-margin">
													<div
														class="col-md-2 p-l-10 sm-padding-15 align-items-center d-flex">
														<div>
															<h5
																class="font-montserrat all-caps small no-margin hint-text bold">
																<i class='fa fa-exchange' aria-hidden='true'></i> <spring:message code="label.transaction"></spring:message>
															</h5>
															<p class="no-margin text-primary bold fs-16">${countTransaction}</p>
														</div>
													</div>
													<div
														class="col-md-2 col-middle sm-padding-15 align-items-center d-flex">
														<div>
															<h5
																class="font-montserrat all-caps small no-margin hint-text bold">
																<i class='fa fa-money' aria-hidden='true'></i> <spring:message code="label.totalAmount"></spring:message>
															</h5>
															<p class="no-margin text-primary bold fs-16">${TotalAmount}</p>
														</div>
													</div>
													<div
														class="col-md-2 col-middle sm-padding-15 align-items-center d-flex">
														<div>
															<h5
																class="font-montserrat all-caps small no-margin hint-text bold">
																<span class="fa-stack fa-lg"> <i
																	class="fa fa-credit-card-alt fa-stack-1x"></i> <i
																	class="fa fa-ban fa-stack-2x text-danger"></i>
																</span> <spring:message code="label.CardCaptured"></spring:message>
															</h5>
															<p class="no-margin text-primary bold fs-16 ">0</p>
														</div>
													</div>
													<div
														class="col-md-2 col-middle sm-padding-15 align-items-center d-flex">
														<div>
															<h5
																class="font-montserrat all-caps small no-margin hint-text bold">
																<span class="fa-stack fa-lg"> <i
																	class="fa fa-money fa-stack-1x"></i> <i
																	class="fa fa-ban fa-stack-2x text-danger"></i>
																</span> <spring:message code="label.numberCashRetract"></spring:message>
															</h5>
															<p class="no-margin text-primary bold fs-16 ">0</p>
														</div>
													</div>
													<div
														class="col-md-2 col-middle sm-padding-15 align-items-center d-flex">
														<div>
															<h5
																class="font-montserrat all-caps small no-margin hint-text bold">
																<span class="fa-stack fa-lg"> <i
																	class="fa fa-money fa-stack-1x"></i> <i
																	class="fa fa-ban fa-stack-2x text-danger"></i>
																</span> <spring:message code="label.totalCashRetract"></spring:message>
															</h5>
															<p class="no-margin text-primary bold fs-16 ">0</p>
														</div>
													</div>


													<div class="col-md-2 text-left bg-primary padding-10">
														<h5
															class="font-montserrat all-caps small no-margin hint-text text-white bold"><spring:message code="label.resume"></spring:message></h5>
														<h5 class="no-margin text-white"><spring:message code="label.startingDate"></spring:message> : ${transactionFilter.transactionDateStarting}</h5>
														<h5 class="no-margin text-white"><spring:message code="label.finishingDate"></spring:message> : ${transactionFilter.transactionDateFinishing}</h5>
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

				<jsp:include page="../view/fragments/footer.jsp"></jsp:include>
			</div>

		</div>
	</div>


	<c:if test="${!empty msgResultat }">
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('body')
										.pgNotification(
												{
													style : 'circle',
													title : "<i class='fa fa-exchange' aria-hidden='true'></i> Number of transactions :${countTransaction} ",
													message : "<span class='bold' ><i class='fa fa-money' aria-hidden='true'></i> Total Amount : ${TotalAmount},00 DZD</span>",
													position : 'top-right',
													timeout : 200000,
													type : "${css}"
												}).show();
							});
		</script>
	</c:if>


	<div class="modal fade slide-up disable-scroll" id="modalHostInfos"
		tabindex="-1" role="dialog" aria-hidden="false">
		<div class="modal-dialog ">
			<div class="modal-content-wrapper">
				<div class="modal-content">
					<div class="modal-header clearfix text-left">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<i class="pg-close fs-14"></i>
						</button>
						<h5 class="text-primary ">
							<i class="fa fa-server" aria-hidden="true"></i> <spring:message code="label.host"></spring:message> <span class="semi-bold"><spring:message code="label.details"></spring:message></span>
						</h5>

					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group-attached">
								 
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-calendar-o"
												aria-hidden="true"></i> <spring:message code="label.host"></spring:message> <spring:message code="label.finishingDate"></spring:message></label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="hostDateModal"> 
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-clock-o" aria-hidden="true"></i> <spring:message code="label.host"></spring:message> <spring:message code="label.startingTime"></spring:message></label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="hostTimeModal">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-money" aria-hidden="true"></i> <spring:message code="label.amount"></spring:message></label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="hostAmountModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-microchip" aria-hidden="true"></i> <spring:message code="label.atm"></spring:message></label>
											 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="hostAtmModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-exchange" aria-hidden="true"></i> <spring:message code="label.TransactionType"></spring:message> </label> <input type="text"
												class="form-control text-info bold fs-15" disabled="disabled" id="hostTypeTransactionModal">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-info-circle"
												aria-hidden="true"></i> <spring:message code="label.infosTransaction"></spring:message></label> 
												<input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="hostInfosModal">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-exclamation-triangle"
												aria-hidden="true"></i> <spring:message code="label.errorTransaction"></spring:message> </label>
												 <input type="text" class="form-control text-info bold fs-15" disabled="disabled" id="hostErrorModal">
										</div>
									</div>

								</div>
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>




	<div class="modal fade slide-up disable-scroll"
		id="modalDetailsTransaction" tabindex="-1" role="dialog"
		aria-hidden="false">
		<div class="modal-dialog ">
			<div class="modal-content-wrapper">
				<div class="modal-content">
					<div class="modal-header clearfix text-center ">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<i class="pg-close fs-14"></i>
						</button>
						<h5 class="text-primary">
							<i class='fa fa-exchange' aria-hidden='true'></i> <spring:message code="label.transaction"></spring:message> <span
								class="semi-bold text-primary"><spring:message code="label.details"></spring:message></span>
						</h5>

					</div>

					<div class="modal-body">
						<form role="form">
							<div class="form-group-attached">
								<div class="row">

									<div class="col-md-6">
										<div class="form-group form-group-default"> 
											<label><i class="fa fa-calendar-o" aria-hidden="true"></i>
												<spring:message code="label.startingDateAndTime"></spring:message></label> <input type="text"
												class="form-control text-primary fs-16 bold text-center"
												disabled="disabled" id="startingDateAndTimeModal">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-calendar-o"
												aria-hidden="true"></i> <spring:message code="label.finishingDateAndTime"></spring:message>
											</label> <input type="text"
												class="form-control text-primary fs-16 bold text-center"
												disabled="disabled" id="finishingDateAndTimeModal">
										</div>
									</div>
								</div>
								<div class="row">

									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa fa-link "></i><spring:message code="label.vendor"></spring:message></label> <input
												type="text" class="form-control text-primary fs-12 bold"
												disabled="disabled" id="vendorModal">
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-thumb-tack"></i> <spring:message code="label.branch"></spring:message></label> <input
												type="text" class="form-control text-primary fs-12 bold"
												disabled="disabled" id="branchModal">
										</div>
									</div>

									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-microchip" aria-hidden="true"></i>
												<spring:message code="label.atm"></spring:message></label> <input type="text"
												class="form-control text-primary fs-12 bold"
												disabled="disabled" id="atmModal">
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-group-default">
											<label><i class="fa fa-credit-card-alt "></i> 
											<spring:message code="label.cardNumber"></spring:message>
											</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="cardNumberModal">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group form-group-default">
											<label><i class="fa fa-info" aria-hidden="true"></i>
												<spring:message code="label.CardTaken"></spring:message> </label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="cardStatusModal">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-hand-lizard-o"
												aria-hidden="true"></i> <spring:message code="label.CashTaken"></spring:message>
											</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="cashTakenModal">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-money "></i> <spring:message code="label.amount"></spring:message></label> <input
												type="text" class="form-control text-primary fs-16 bold"
												disabled="disabled" id="amountModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-info" aria-hidden="true"></i>
												<spring:message code="label.cashPresented"></spring:message></label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="cashPresentedModal">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label><i class="fa fa-info-circle"
												aria-hidden="true"></i> <spring:message code="label.infosTransaction"></spring:message> </label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="infosModal">
										</div>
									</div>
									
								</div>

								<div class="row">
									
									<div class="col-md-4">
										<div class="form-group form-group-default">
											<label> <i class="fa fa-exchange" aria-hidden="true"></i>
												<spring:message code="label.TransactionType"></spring:message>
											</label> <input type="text"
												class="form-control text-primary fs-16 bold"
												disabled="disabled" id="typeTransactionModal">
										</div>
									</div>
									<div class="col-md-8">
										<div class="form-group form-group-default">
											<label><i class="fa fa-exclamation-triangle"
												aria-hidden="true"></i> <spring:message code="label.errorTransaction"></spring:message> </label> <input type="text"
												class="form-control text-danger fs-12 bold"
												disabled="disabled" id="errorTransactionModal">
										</div>
									</div>
								</div>

							</div>
						</form>

					</div>
				</div>
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
	<script src="<spring:url value="/resources/pages/js/transaction.js"/>"></script>

	<script type="text/javascript">
	 

	/**********************************************************************************************************
	 **********************************************************************************************************
	 ********************************************************************************************************** 
	                             START : C A S S E T T E    V A L U E S   
	 ********************************************************************************************************** 
	 **********************************************************************************************************
	 **********************************************************************************************************
	 *********************************************************************************************************/
	
		function format(d) {
			return '<div class="slider" name>'
					+ '<table>'
					+ '<tr>'
					+ '<td>'
					+ '<div class="input-group p-l-0 ">'
					+ '<input type="text" class="form-control input-sm text-center text-primary bold fs-16 " disabled="disabled" value='+d.cassette1+'>'
					+ '<div class="input-group-append ">'
					+ '<span class="input-group-text">CASSETTE ONE </span>'
					+ '</div>'
					+ '</div>'
					+ '</td>'
					+ '<td>'
					+ '<div class="input-group p-l-0">'
					+ '<input type="text" class="form-control input-sm text-center text-primary bold fs-16 " disabled="disabled" value='+d.cassette2+' >'
					+ '<div class="input-group-append ">'
					+ '<span class="input-group-text input-sm">CASSETTE TWO </span>'
					+ '</div>'
					+ '</div>'
					+ '</td>'
					+ '<td>'
					+ '<div class="input-group p-l-0">'
					+ '<input type="text" class="form-control input-sm text-center text-primary bold fs-16"  disabled="disabled" value='+d.cassette3+'>'
					+ '<div class="input-group-append ">'
					+ '<span class="input-group-text">CASSETTE THREE </span>'
					+ '</div>'
					+ '</div>'
					+ '</td>'
					+ '<td>'
					+ '<div class="input-group p-l-0">'
					+ '<input type="text" class="form-control input-sm text-center text-primary bold fs-16" disabled="disabled" value='+d.cassette4+'>'
					+ '<div class="input-group-append ">'
					+ '<span class="input-group-text">CASSETTE FOUR </span>'
					+ '</div>' + '</div>' + '</td>' + '</tr>' + '</table>'
					+ '</div>'
		}

		$('#tableWithSearch tbody')
				.on(
						'click',
						'td.details-control',
						function() {
							var tr = $(this).closest('tr');
							var table = $('#tableWithSearch').DataTable();

							var row = table.row(tr);

							if (row.child.isShown())

							{

								$('div.slider', row.child()).slideUp(
										function() {

											$('#down').removeClass(
													'fa-caret-up');
											$('#down')
													.addClass('fa-caret-down');
											row.child.hide();
											tr.removeClass('shown');
										});
							} else

							{

								var id = $(this).closest('tr').attr('id');
								$
										.ajax({
											url : '${pageContext.request.contextPath}/gettransaction-'
													+ id + '',
											method : 'GET',
											contentType : "application/json",
											timeout : 600000,
											success : function(data) 
											{

												row.child(format(data)).show();
												$('#down').removeClass('fa-caret-down');
												$('#down').addClass('fa-caret-up');
									
												tr.addClass('shown');

											},

											error : function(xhr, status, error) {

											}
										});
							}
						});

		
		/**********************************************************************************************************
		 **********************************************************************************************************
		 ********************************************************************************************************** 
		                             END : C A S S E T T E    V A L U E S   
		 ********************************************************************************************************** 
		 **********************************************************************************************************
		 **********************************************************************************************************
		 *********************************************************************************************************/
		
		
		
		/**********************************************************************************************************
		 **********************************************************************************************************
		 ********************************************************************************************************** 
		                             START : D  A  T  E     T  A  B  L  E   
		 ********************************************************************************************************** 
		 **********************************************************************************************************
		 **********************************************************************************************************
		 *********************************************************************************************************/
		$('#tableWithSearch').DataTable();
		$('#WincorDive').hide();

		var table = $('#tableWithSearch');

		var settings = {
			"sDom" : " <'row'<l>> <'exportOptions'T><'table-responsive't><'row'<p i>>",
			"sPaginationType" : "bootstrap",
			"destroy" : true,

			"scrollCollapse" : true,
			"oLanguage" : {
				"sLengthMenu" : "_MENU_ ",
				"sInfo" : "Showing <b>_START_ to _END_</b>Transaction of _TOTAL_ Transaction"
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
				sWidth : '10%'
			}, {
				sWidth : '20%'
			}, {
				sWidth : '15%'
			}, {
				sWidth : '15%'
			}, {
				sWidth : '15%'
			}, {
				sWidth : '15%'
			}, {
				sWidth : '5%'
			} ],

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

		/**********************************************************************************************************
		 **********************************************************************************************************
		 ********************************************************************************************************** 
		                             END  : D  A  T  E     T  A  B  L  E   
		 ********************************************************************************************************** 
		 **********************************************************************************************************
		 **********************************************************************************************************/
		
		
		
		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && ((charCode < 48) || (charCode > 57)))
				return false;
			return true;
		};
		/**********************************************************************************************************
		 **********************************************************************************************************
		 ********************************************************************************************************** 
		                             START : M O D A L   H O S T    I N F O S   
		 ********************************************************************************************************** 
		 **********************************************************************************************************
		 **********************************************************************************************************/
		$('#modalHostInfos')
		.modal({
			keyboard : true,
			backdrop : "static",
			show : false,

		})
		.on('shown.bs.modal',
				function(event)

				{
					var $button = $(event.target);
					var idTransactionAjax = event.relatedTarget.getAttribute('data-id');
					console.log(idTransactionAjax);

					$.ajax({
								url : '${pageContext.request.contextPath}/gettransaction-'
										+ idTransactionAjax + '',
								method : 'GET',
								contentType : "application/json",
								timeout : 600000,
								success : function(data) {

									
									var dateHost = new Date(data.transactionDateHost).toLocaleDateString();
									$('#hostNameModal').val();
									$('#hostDateModal').val( dateHost);
									$('#hostTimeModal').val(data.transactionHostTime);
									$('#hostAmountModal').val(data.transactionHostAmount);
									$('#hostAtmModal').val(data.transactionHostATM);
									$('#hostTypeTransactionModal').val(data.transactionType);
									$('#hostInfosModal').val(data.transactionHostCard);
									$('#hostErrorModal').val(data.errorTransaction);
								},

								error : function(xhr, status, error) {

								}
							});
				});
		
		/**********************************************************************************************************
		 **********************************************************************************************************
		 ********************************************************************************************************** 
		                             END  : M O D A L   H O S T    I N F O S   
		 ********************************************************************************************************** 
		 **********************************************************************************************************
		 **********************************************************************************************************/
		 
		 
		 
	     /**********************************************************************************************************
		 **********************************************************************************************************
		 ********************************************************************************************************** 
		                             START : M O D A L   T R A N S A C T I O N     D E T A I L S    
		 ********************************************************************************************************** 
		 **********************************************************************************************************
		 **********************************************************************************************************/
			 
			 
		$('#modalDetailsTransaction')
				.modal({
					keyboard : true,
					backdrop : "static",
					show : false,

				})
				.on(
						'shown.bs.modal',
						function(event)

						{
							var $button = $(event.target);
							var idTransactionAjax = event.relatedTarget
									.getAttribute('data-id');
							console.log(idTransactionAjax);

							$
									.ajax({
										url : '${pageContext.request.contextPath}/gettransaction-'
												+ idTransactionAjax + '',
										method : 'GET',
										contentType : "application/json",
										timeout : 600000,
										success : function(data) {
											var StartDate = new Date(
													data.startingDate)
													.toLocaleDateString();
											var FinishDate = new Date(
													data.finishingDate)
													.toLocaleDateString();

											$('#startingDateAndTimeModal')
													.val(
															StartDate
																	+ '   '
																	+ data.startingTime);
											$('#finishingDateAndTimeModal')
													.val(
															FinishDate
																	+ '   '
																	+ data.finishingTime);
											$('#vendorModal').val(data.vendor);
											$('#branchModal').val();
											$('#atmModal').val(
													data.transactionHostATM);
											$('#cardNumberModal').val(
													data.cardNumber);

											if (data.cardTaken) {

												$('#cardStatusModal').val(
														"TAKEN");

											} else {

												$('#cardStatusModal').val("no");

											}

											$('#amountModal').val(
													data.transactionHostAmount);

											if (data.cashPresented) {

												$('#cashPresentedModal').val(
														"YES");

											} else {

												$('#cashPresentedModal').val(
														"Not presented");

											}
											if (data.cashTaken) {
												$('#cashTakenModal').val("YES");

											} else {

												$('#cashTakenModal').val(
														"not taken");

											}

											$('#infosModal').val(
													data.infosTransaction);
											$('#typeTransactionModal').val(
													data.transactionType);
											$('#errorTransactionModal').val(
													data.errorTransaction);

											console.log(data);

										},

										error : function(xhr, status, error) {

										}
									});
						});
		
		/**********************************************************************************************************
		 **********************************************************************************************************
		 ********************************************************************************************************** 
		                             END  : M O D A L   T R A N S A C T I O N     D E T A I L S    
		 ********************************************************************************************************** 
		 **********************************************************************************************************
		 **********************************************************************************************************/
	</script>
</body>
</html>