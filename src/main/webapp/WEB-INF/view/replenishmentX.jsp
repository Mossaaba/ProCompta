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

<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: black;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: black;
}

.tg .tg-1wig {
	font-weight: bold;
	text-align: left;
	vertical-align: top
}

.tg .tg-hgcj {
	font-weight: bold;
	text-align: center
}

.tg .tg-s268 {
	text-align: left
}

.tg .tg-5ua9 {
	font-weight: bold;
	text-align: left
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}
</style>


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
											<br> <span
												class="   p-t-5 m-l-5 p-b-5 inline fs-12 text-primary bold">
												<i class="fa fa-filter fa-2x"></i> Filter :
											</span>

										</div>
										
										
										<div class="card-controls">
											<div id="rootwizard" class="m-t-50">

												<ul class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm" role="tablist" data-init-reponsive-tabs="dropdownfx">
												<c:forEach var = "i" begin = "1" end = "5">
												
												<li class="nav-item">
												<a data-toggle="tab" href="#tab<c:out value = "${i}"/>" data-target="#tab<c:out value = "${i}"/>" role="tab">
												<i class="fa fa-shopping-cart tab-icon"></i> <span>XY</span></a>
												</li>
												</c:forEach>
												</ul>
												
												
												
												
												<div class="tab-content">
													    <c:forEach var = "y" begin = "1" end = "5" varStatus="counter">
													    <c:choose>
													     <c:when test = "${counter.index eq 1}">
                                                         <div
														class="tab-pane padding-20 sm-no-padding active slide-left"
														id="tab<c:out value = "${y}"/>">
														 </c:when>
														  <c:otherwise>
                                                          <div
														class="tab-pane padding-20 sm-no-padding  slide-left"
														id="tab<c:out value = "${y}"/>">
                                                       </c:otherwise>
														</c:choose>
														
														
														
														<div class="row row-same-height">
															<div class="col-md-4 b-r b-dashed b-grey sm-b-b">
																<div class="padding-30 sm-padding-5 sm-m-t-15 m-t-50">
																	 
																	<c:out value = "${y}"/>
																	Date <br>
																	Time
																	
																</div>
															</div>
															<div class="col-md-8">
																<div class="padding-30 sm-padding-5">
															
																	<table class="table table-condensed">
																	<thead>
																	<tr>
																	<th> casette </th>
																	<th> value </th>
																	<th>befor </th>
																	<th>after </th>
																	<th>diff </th>
																	</tr>
																	</thead>
																		<tr>
																		
																			<td class="col-lg-8 col-md-6 col-sm-7 "> 
																				<span class="m-l-10 font-montserrat fs-12 all-caps">
																				Cassette 1 
																					 </span>  </td>
																					 <td> <label class="btn btn-primary btn-sm">  
																					<span class="fs-12 ">DZD 0</span>
																				</label>   </td>
																			<td class=" col-lg-2 col-md-3 col-sm-3 text-right">
																				<h4 class="text-warning no-margin font-montserrat">2555</h4>
																			</td>
																			<td class=" col-lg-2 col-md-3 col-sm-2 text-right">
																				<h4 class="text-primary no-margin font-montserrat">2555</h4>
																			</td>
																			<td> </td>
																			
																			
																		</tr>
																		<tr>
																		
																			<td class="col-lg-8 col-md-6 col-sm-7 "> 
																				<span class="m-l-10 font-montserrat fs-12 all-caps">
																				Cassette 1 
																					 </span>  </td>
																					 <td> <label class="btn btn-primary btn-sm">  
																					<span class="fs-12 ">DZD 0</span>
																				</label>   </td>
																			<td class=" col-lg-2 col-md-3 col-sm-3 text-right">
																				<h4 class="text-warning no-margin font-montserrat">2555</h4>
																			</td>
																			<td class=" col-lg-2 col-md-3 col-sm-2 text-right">
																				<h4 class="text-primary no-margin font-montserrat">2555</h4>
																			</td>
																			<td> </td>
																			
																			
																		</tr>
																		<tr>
																		
																			<td class="col-lg-8 col-md-6 col-sm-7 "> 
																				<span class="m-l-10 font-montserrat fs-12 all-caps">
																				Cassette 1 
																					 </span>  </td>
																					 <td> <label class="btn btn-primary btn-sm">  
																					<span class="fs-12 ">DZD 0</span>
																				</label>   </td>
																			<td class=" col-lg-2 col-md-3 col-sm-3 text-right">
																				<h4 class="text-warning no-margin font-montserrat">2555</h4>
																			</td>
																			<td class=" col-lg-2 col-md-3 col-sm-2 text-right">
																				<h4 class="text-primary no-margin font-montserrat">2555</h4>
																			</td>
																			<td> </td>
																			
																			
																		</tr>
																		<tr>
																		
																			<td class="col-lg-8 col-md-6 col-sm-7 "> 
																				<span class="m-l-10 font-montserrat fs-12 all-caps">
																				Cassette 1 
																					 </span>  </td>
																					 <td> <label class="btn btn-primary btn-sm">  
																					<span class="fs-12 ">DZD 0</span>
																				</label>   </td>
																			<td class=" col-lg-2 col-md-3 col-sm-3 text-right">
																				<h4 class="text-warning no-margin font-montserrat">2555</h4>
																			</td>
																			<td class=" col-lg-2 col-md-3 col-sm-2 text-right">
																				<h4 class="text-primary no-margin font-montserrat">2555</h4>
																			</td>
																			<td> </td>
																			
																			
																		</tr>
																		<tr>
																		
																			<td class="col-lg-8 col-md-6 col-sm-7 "> 
																				<span class="m-l-10 font-montserrat fs-12 all-caps">
																				   reject  
																					 </span>  </td>
																					 <td> <label class="btn btn-primary btn-sm">  
																					<span class="fs-12 "> </span>
																				</label>   </td>
																			<td class=" col-lg-2 col-md-3 col-sm-3 text-right">
																				<h4 class="text-warning no-margin font-montserrat">2555</h4>
																			</td>
																			<td class=" col-lg-2 col-md-3 col-sm-2 text-right">
																				<h4 class="text-primary no-margin font-montserrat">2555</h4>
																			</td>
																			<td> </td>
																			
																			
																		</tr>
																		<tr>
																		
																			<td class="col-lg-8 col-md-6 col-sm-7 "> 
																				<span class="m-l-10 font-montserrat fs-12 all-caps">
																				 retract 
																					 </span>  </td>
																					 <td> <label class="btn btn-primary btn-sm">  
																					<span class="fs-12 "> </span>
																				</label>   </td>
																			<td class=" col-lg-2 col-md-3 col-sm-3 text-right">
																				<h4 class="text-warning no-margin font-montserrat">2555</h4>
																			</td>
																			<td class=" col-lg-2 col-md-3 col-sm-2 text-right">
																				<h4 class="text-primary no-margin font-montserrat">2555</h4>
																			</td>
																			<td> </td>
																			
																			
																		</tr>
																		 
																	</table>
																	<h5>Denamination</h5>
																	<div class="row">
																		<div class="col-lg-7 col-md-6">
																			 
																		</div>
																		<div class="col-lg-5 col-md-6">
																			<div class="btn-group btn-group-toggle"
																				data-toggle="buttons">
																				<label class="btn btn-default  active"> <input
																					type="radio" name="options" id="option1" checked>
																					<span class="fs-16">500</span>
																				</label>
																				<label class="btn btn-default active"> <input
																					type="radio" name="options" id="option1" checked>
																					<span class="fs-16">1000</span>
																				</label>  
																				<label class="btn btn-default active " > <input
																					type="radio" name="options" id="option2"> <span
																					class="fs-16">2000</span>
																				</label> <label class="btn btn-default active"> <input
																					type="radio" name="options" id="option3"> <span
																					class="fs-16">2000</span>
																				</label>
																			</div>
																		</div>
																	</div>
																	<br>
																	<div class="row b-a b-grey no-margin">
																		<div
																			class="col-md-3 p-l-10 sm-padding-15 align-items-center d-flex">
																			<div>
																				<h5
																					class="font-montserrat all-caps small no-margin hint-text bold">Total Amount
																					 </h5>
																				<p class="no-margin">$10</p>
																			</div>
																		</div>
																		<div
																			class="col-md-3 col-middle sm-padding-15 align-items-center d-flex">
																			<div>
																				<h5
																					class="font-montserrat all-caps small no-margin hint-text bold">Total reject </h5>
																				<p class="no-margin">$0</p>
																			</div>
																		</div>
																		<div
																			class="col-md-3 col-middle sm-padding-15 align-items-center d-flex">
																			<div>
																				<h5
																					class="font-montserrat all-caps small no-margin hint-text bold">Total rertarct </h5>
																				<p class="no-margin">$0</p>
																			</div>
																		</div>
																		<div class="col-md-3 text-right bg-primary  ">
																			<h5
																				class="font-montserrat all-caps small no-margin hint-text text-white bold">Total</h5>
																			<h4 class="no-margin text-white">$44</h4>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													 
														
														
													 </c:forEach>
													 
													 
													 
													 
													 
													 
													 
													 
													<div
														class="padding-20 sm-padding-5 sm-m-b-20 sm-m-t-20 bg-white clearfix">
														<ul class="pager wizard no-style">
															<li class="next">
																<button
																	class="btn btn-primary btn-cons btn-animated from-left fa fa-truck pull-right"
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


	<script src="<spring:url value="/resources/assets/jquery-confirm.min.js"/>"></script>
	<script src="<spring:url value="/resources/assets/js/form_wizard.js"/>"></script>
	<script src="<spring:url value="/resources/pages/js/Datepair.js"/>"></script>
	<script
		src="<spring:url value="/resources/pages/js/replenishment.js"/>"></script>

	<script type="text/javascript">
	 
 
		
		
		
	$('.nav-item').hide();
		
		
		
	</script>
</body>
</html>