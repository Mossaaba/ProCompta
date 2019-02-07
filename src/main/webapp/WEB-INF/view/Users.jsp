<%@ page session="false"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>




<!DOCTYPE html>
<html>
<head>

<title>ProCompta | USERS </title>
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
	href="<spring:url value="/resources/assets/plugins/bootstrap-tag/bootstrap-tagsinput.css"/>"
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
					<div class=" container-fluid   container-fixed-lg">   
                       <div id="rootwizard" class="m-t-60">

                        <ul class="nav nav-tabs nav-tabs-linetriangle   nav-stack-sm"
							role="tablist" data-init-reponsive-tabs="dropdownfx">
							<li class="nav-item"><a id="listeAtm"
								class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold"
								data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
									<span> <spring:message code="label.space"></spring:message>
								</span><span> </span><span> </span><i class="fa fa-user-circle fa-4x"></i> <span><spring:message code="label.users"></spring:message></span>
							</a></li>
						</ul>
                              <br>

                           <div class="tab-content">
       	   
									<div class="tab-pane padding-20 sm-no-padding active slide-left" id="tab1">
									<div class="row row-same-height">
													
										<div class="col-md-2 b-r b-dashed b-grey sm-b-b">
														<div class="sm-m-t-15 m-t-50">
														<h2><spring:message code="label.listOfusers"></spring:message></h2> 
														</div>	
										</div>
			
								
				                       <div class="col-md-10">
				 
												<div class="pull-right">
													<div class="col-xs-12">
													<button  id="show-modal" class="btn btn-rounded btn-primary m-b-10 bold fs-15 blod" >
													<i class="fa fa-user-plus fa-2X"></i> <spring:message code="label.addNewUser"></spring:message>
													</button>
													</div>
												</div>
												
                                                <br>
				
				                     <div class="padding-30 sm-padding-5">
										
										<table class="table table-hover table-responsive-block nowrap " id="tableUser">
										 <thead>
										 <tr> 
										 
										 <th class="v-align-middle text-primary bold fs-14">
										 <span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa-address-card-o fa-stack-1x"></i>
																</span> <spring:message code="label.firstName"></spring:message></th>
										 
										 <th class="v-align-middle text-primary bold fs-14">
										 <span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-user-circle-o fa-stack-1x"></i>
																</span> <spring:message code="label.lastName"></spring:message></th>
																
										 <th class="v-align-middle text-primary bold fs-14">
										 <span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-envelope-o fa-stack-1x"></i>
																</span>  <spring:message code="label.emailUser"></spring:message></th>
																
																
										 <th class="v-align-middle text-primary bold fs-14">
										 <span class="fa-stack fa-lg"> <i
																		class="fa fa-square-o fa-stack-2x"></i> <i
																		class="fa fa fa-id-badge fa-stack-1x"></i>
																</span> <spring:message code="label.loginIDUser"></spring:message></th>
																
										
				                         <security:authorize access="hasRole('ADMIN')">
				                         <th class="v-align-middle"> </th>
				                         </security:authorize> 
										 </tr>
										 </thead>
										 <tbody>
										 
										 <c:forEach items="${users}" var="user">

										 <c:url var ="updateLink" value="/user/edit-user-${user.ssoId}"></c:url>
										 <c:url var ="deleteLink" value="/user/delete-user-${user.ssoId}"></c:url>
										 
										 
										  <tr>
											 <td class="text-primary font-montserrat v-align-middle">${user.firstName}</td>
											 <td class="text-primary font-montserrat v-align-middle password">${user.lastName}</td>
											 <td class="text-primary font-montserrat v-align-middle">${user.email}</td>
											 <td class="text-primary font-montserrat v-align-middle">${user.ssoId}</td>
											 
										      
										 
										  <security:authorize access="hasRole('ADMIN')">
												 <td class="text-primary font-montserrat v-align-middle">
									              <div class="btn-group">
									                 <button onclick="window.location.href='${updateLink}'" type="button" id="Update"  class="btn btn-sm btn-rounded btn-success"><i class="fa fa-pencil"></i>
													 </button>
													
													<a class="btn btn-sm  btn-rounded btn-danger delete"   data-title="are you sure to delete the user ?" href="${deleteLink}"><i class="fa fa-trash-o"></i></a>	
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
											 
												 </tr>
												 </tfoot>
								    </table>
				                         <br>
				                         
				                         
				                         
										<div class="row b-a b-grey no-margin">
											<div class="col-md-3 p-l-10 sm-padding-15 align-items-center d-flex">
													<div>
													<h5 class="font-montserrat all-caps small no-margin hint-text bold">Total </h5>
													<p class="no-margin">4</p>
													</div>
											</div>
											
											<div class="col-md-4 col-middle sm-padding-15 align-items-center d-flex">
													<div>
													<h5 class="font-montserrat all-caps small no-margin hint-text bold">Admin</h5>
													<p class="no-margin">3</p>
													</div>
											</div>
											
											<div class="col-md-3 col-middle sm-padding-15 align-items-center d-flex">
													<div>
													<h5 class="font-montserrat all-caps small no-margin hint-text bold">Manager</h5>
													<p class="no-margin">1</p>
													</div>
											</div>
											
											<div class="col-md-2 text-right bg-primary padding-10">
											<h5 class="font-montserrat all-caps small no-margin hint-text text-white bold">Last Modification</h5>
											<h4 class="no-margin text-white">25-02-1991</h4>
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
													$(document).ready(function() 
													{
														$('body').pgNotification({
															 style: 'circle',
															 title :"${msgTraitment}",
															 message: "${theUser}",  
															 position: 'top-right',
														
															 timeout: 10000,  
															 type: "${style}"
															}).show();
													});
				                                    </script>								
												</c:if>
                                     
                                               <c:if test="${!empty msg }">
												<script type="text/javascript">
												$(function () {
												$('#addNewAppModal').modal('show');
												});
												</script>
												
                                               </c:if>
                                               <c:if test="${!empty editUser }">
												<script type="text/javascript">
												$(function () {
												$('#addNewAppModal').modal('show');
												});
												</script>
                                               </c:if>
                                     
                                                 <div class="modal fade  fill-in" id="addNewAppModal" 
                                                  tabindex="-1" role="dialog" aria-labelledby="addNewAppModal" aria-hidden="true" data-backdrop="static">
													
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header clearfix ">
													 
													<h4 class="p-b-5"><span class="font-montserrat blod text-primary bold fs-17"> 
													<i class="fa fa-user-plus"></i> <spring:message code="label.addNewUser"></spring:message> </span>
													 </h4>
													</div>
												 
												        
													 
													<form:form id="addUserForm" modelAttribute="user" method="POST" >
													
													
													
													<div class="modal-body">
											
													<div class="row ">
													
															<div class="col-sm-6 ">
															<div class="form-group form-group-default required">
															 <i class="fa fa-address-card-o text-complete m-l-5" aria-hidden="true"></i>
															<label><spring:message code="label.firstName"></spring:message> </label>
															<form:input path="firstName"   id="userName" type="text" cssClass="form-control" autocomplete="off" placeholder="First Name of your the user"/>
															</div>
															<form:errors path="firstName" cssClass="alert alert-danger"/>
															</div>
															
															
															<div class="col-sm-6">
															<div class="form-group form-group-default required">
															<form:input type="hidden" path="id" id="id"/>
															<i class="fa fa-user-circle-o text-complete m-l-5" aria-hidden="true"></i>
															<label><spring:message code="label.lastName"></spring:message></label>
															<form:input path="lastName"  id="lastName" type="text" cssClass="form-control" autocomplete="off" placeholder="Last Name of your the user"/>
															</div>
															<form:errors path="lastName" cssClass="alert alert-danger"/>
															</div>
															
															
													</div>
													
													
													<div class="row">
													<div class="col-sm-12">
													
													<c:choose>
												       <c:when test="${edit}">
												       <div class="form-group form-group-default required">
												       <i class="fa fa-sign-in text-complete m-l-5" aria-hidden="true"></i>
													   <label><spring:message code="label.loginIDUser"></spring:message> </label>
							                            <form:input type="text" path="ssoId"  id="ssoId" autocomplete="off" placeholder="Your login ID , 'Connexion ID'" cssClass="form-control" disabled="true"/>
						                               </div>
													  
						                               </c:when>
						                        
												        <c:otherwise>
												         <div class="form-group form-group-default ">
												         <i class="fa fa-sign-in text-complete m-l-5" aria-hidden="true"></i>
													   <label><spring:message code="label.loginIDUser"></spring:message></label>
							                            <form:input type="text" path="ssoId" id="ssoId" autocomplete="off" placeholder="Your login ID" cssClass="form-control" />
							                            </div>
													      <form:errors path="ssoId" cssClass="alert alert-danger"/>
							                           </c:otherwise>
										            </c:choose>
										             
													
													</div>
													</div>
													
													
													
													<div class="row">
													
													
													<div class="col-sm-12">
													 <div class="form-group form-group-default required">
													 <i class="fa fa-key text-complete m-l-5" aria-hidden="true"></i>
													<label><spring:message code="label.loginPasswordUser"></spring:message> </label>
													<form:input path="password" id="password" type="password"   cssClass="form-control" placeholder="your password"/>
															
													</div>
													<form:errors path="password" cssClass="alert alert-danger"/>
													</div>
													 
													
													
													</div>
													
													<div class="row">
													
													<div class="col-sm-12">
													<div class="form-group form-group-default required">
													<i class="fa fa-envelope-o text-complete m-l-5" aria-hidden="true"></i>
													<label><spring:message code="label.emailUser"></spring:message></label> 
													<form:input path="email" id="email" type="text" cssClass="form-control" autocomplete="off" placeholder="Your email"/>
													
													</div>
													<form:errors path="email" cssClass="alert alert-danger"/>
													</div>
													
													</div>
													
													<div class="row">
													
													<div class="col-sm-12">
													<div class="form-group form-group-default required">
													<i class="fa fa-link text-complete m-l-5" aria-hidden="true"></i>
													<label ><spring:message code="label.roleUser"></spring:message></label> 
															
															<form:select path="userProfiles" cssClass="form-control full-width"
																		  id="userProfiles"  
																		  cssStyle="width: 100%;" data-init-plugin="select2"
																		  items="${roles}" itemValue="id" itemLabel="type"  />
								
															 
													</div>
													<form:errors path="userProfiles" cssClass="alert alert-danger"/>
													</div>
													
													</div>

													</div>
													<div class="modal-footer">
													
													 <c:choose>
						                                
						                                <c:when test="${edit}">
						                                
						                                <button type="submit" class="btn btn-primary  btn-cons"> <i class="fa fa-user-plus"></i> <spring:message code="label.update"></spring:message></button>
						                                or 
						                                <button type="button" class="btn btn-cons btn-danger" onclick="window.location.href='<spring:url value="/user/list"/>'" class="btn btn-cons" 
						                                data-dismiss="modal"><i class="fa fa-times-circle" aria-hidden="true"></i> <spring:message code="label.close"></spring:message></button>
						                                
						                                </c:when>
						                                
						                                
						                                <c:otherwise>
						                              <form:button type="submit" class="btn btn-primary  btn-cons"><i class="fa fa-user-plus"></i> <spring:message code="label.addNewUser"></spring:message></form:button>
						                              or 
						                              <form:button type="button" class="btn btn-cons btn-danger" 
						                              data-dismiss="modal"><i class="fa fa-times-circle" aria-hidden="true"></i> <spring:message code="label.close"></spring:message></form:button>
						                                </c:otherwise> 
						                               
						                             </c:choose>  
													</div>
													</form:form>
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
		<script src="<spring:url value="/resources/pages/js/user.js"/>"></script>
		

</body>
</html>