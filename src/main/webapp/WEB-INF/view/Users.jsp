<%@ page session="false"%>
<%@ page isELIgnored="false" %>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>




<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

 


<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/pace/pace-theme-flash.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap-tag/bootstrap-tagsinput.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap3-wysihtml5/bootstrap3-wysihtml5.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/dropzone/css/dropzone.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/summernote/css/summernote.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/select2/css/select2.min.css"/>"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/ion-slider/css/ion.rangeSlider.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/ion-slider/css/ion.rangeSlider.skinFlat.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.nouislider.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-datatable/media/css/dataTables.bootstrap.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/FixedColumns/css/dataTables.fixedColumns.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
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
					<div class=" container-fluid   container-fixed-lg">   
                       <div id="rootwizard" class="m-t-60">

						<ul class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm" role="tablist" data-init-reponsive-tabs="dropdownfx">
						<li class="nav-item" >
						<a id="listeAtm" class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold" data-toggle="tab" href="#tab1" data-target="#tab1" role="tab">
						 <span>Space</span><span> </span><span> </span><i class="fa fa-user-circle fa-4x"></i> <span>Users</span></a>
						</li>
						</ul>
						
                           <div class="tab-content">
       	   
									<div class="tab-pane padding-20 sm-no-padding active slide-left" id="tab1">
									<div class="row row-same-height">
													
										<div class="col-md-3 b-r b-dashed b-grey sm-b-b">
														<div class="sm-m-t-15 m-t-50">
														<h2>List of users</h2>
														<p>You can add, modify , or delete users here  </p>
														</div>	
										</div>
			
								
				                       <div class="col-md-9">
				 
												<div class="pull-right">
													<div class="col-xs-12">
													<button  id="show-modal" class="btn btn-primary btn-cons" ><i class="fa fa-user-plus"></i> Add user
													</button>
													</div>
												</div>
												
                                                <br>
				
				                     <div class="padding-30 sm-padding-5">
										
										<table class="table table-hover table-responsive-block nowrap " id="tableUser">
										 <thead>
										 <tr>
										 
										 <th class="v-align-middle text-primary bold fs-14"><i class="fa fa-address-card-o" aria-hidden="true"></i> Firstname</th>
										 <th class="v-align-middle text-primary bold fs-14"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Lastname</th>
										 <th class="v-align-middle text-primary bold fs-14"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email</th>
										 <th class="v-align-middle text-primary bold fs-14"><i class="fa fa-id-badge" aria-hidden="true"></i> SSO ID</th>
										 
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
													<h5 class="font-montserrat all-caps small no-margin hint-text bold">Local Connexion</h5>
													<p class="no-margin">3</p>
													</div>
											</div>
											
											<div class="col-md-3 col-middle sm-padding-15 align-items-center d-flex">
													<div>
													<h5 class="font-montserrat all-caps small no-margin hint-text bold">Remote Connexion</h5>
													<p class="no-margin">1</p>
													</div>
											</div>
											
											<div class="col-md-2 text-right bg-primary padding-10">
											<h5 class="font-montserrat all-caps small no-margin hint-text text-white bold">Last Modification</h5>
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
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
													</button>
													<h4 class="p-b-5"><span class="semi-bold"> <i class="fa fa-user-plus"></i> ADD New</span> User</h4>
													</div>
												 
												        
													 
													<form:form id="addUserForm" modelAttribute="user" method="POST" >
													
													
													
													<div class="modal-body">
													<p class="small-text">Create a new user </p>
													
													 
													
													
													<div class="row ">
													
															<div class="col-sm-6 ">
															<div class="form-group form-group-default required">
															 <i class="fa fa-address-card-o" aria-hidden="true"></i>
															<label>First Name</label>
															<form:input path="firstName"   id="userName" type="text" cssClass="form-control" autocomplete="off" placeholder="First Name of your the user"/>
															</div>
															<form:errors path="firstName" cssClass="alert alert-danger"/>
															</div>
															
															
															<div class="col-sm-6">
															<div class="form-group form-group-default required">
															<form:input type="hidden" path="id" id="id"/>
															<i class="fa fa-user-circle-o" aria-hidden="true"></i>
															<label>Last Name</label>
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
												       <i class="fa fa-sign-in" aria-hidden="true"></i>
													   <label>LoginID </label>
							                            <form:input type="text" path="ssoId"  id="ssoId" autocomplete="off" placeholder="Your login ID , 'Connexion ID'" cssClass="form-control" disabled="true"/>
						                               </div>
													  
						                               </c:when>
						                        
												        <c:otherwise>
												         <div class="form-group form-group-default ">
												         <i class="fa fa-sign-in" aria-hidden="true"></i>
													   <label>LoginID</label>
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
													 <i class="fa fa-key" aria-hidden="true"></i>
													<label>Password </label>
													<form:input path="password" id="password" type="password"   cssClass="form-control" placeholder="your password"/>
															
													</div>
													<form:errors path="password" cssClass="alert alert-danger"/>
													</div>
													 
													
													
													</div>
													
													<div class="row">
													
													<div class="col-sm-12">
													<div class="form-group form-group-default required">
													<i class="fa fa-envelope-o" aria-hidden="true"></i>
													<label>Email</label> 
													<form:input path="email" id="email" type="text" cssClass="form-control" autocomplete="off" placeholder="Your email"/>
													
													</div>
													<form:errors path="email" cssClass="alert alert-danger"/>
													</div>
													
													</div>
													
													<div class="row">
													
													<div class="col-sm-12">
													<div class="form-group form-group-default required">
													<i class="fa fa-link" aria-hidden="true"></i>
													<label >Role</label> 
															
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
						                                
						                                <button type="submit"   class="btn btn-primary  btn-cons">Update</button>
						                                or 
						                                <button type="button" onclick="window.location.href='<spring:url value="/user/list"/>'" class="btn btn-cons" data-dismiss="modal">Close</button>
						                                
						                                </c:when>
						                                
						                                
						                                <c:otherwise>
						                              <form:button type="submit" class="btn btn-primary  btn-cons"><i class="fa fa-user-plus"></i> Add the User</form:button>
						                              or 
						                              <form:button type="button"    class="btn btn-cons btn-danger" data-dismiss="modal"><i class="fa fa-times-circle" aria-hidden="true"></i> Close</form:button>
						                                </c:otherwise> 
						                               
						                             </c:choose>  
													</div>
													</form:form>
													</div>
													
													 
													</div>
													
												</div>
												
												<div class="modal fade slide-up disable-scroll" id="modalSlideUpSmall" tabindex="-1" role="dialog" aria-hidden="false">
												<div class="modal-dialog modal-sm">
												<div class="modal-content-wrapper">
												<div class="modal-content">
												<div class="modal-body text-center m-t-20">
												<h4 class="no-margin p-b-10">Are you sure to delet the user </h4>
												<button type="button"  class="btn btn-danger btn-cons" data-dismiss="modal" >Continue</button>
												<button type="button" class="btn btn-primary btn-cons" data-dismiss="modal">Cancel</button>
												</div>
												</div>
												</div>
												
												</div>
												</div>	
												
												                                     
                                     
                                     
                       
	                                   

	<script
		src="<spring:url value="/resources/assets/plugins/jquery-validation/js/jquery.validate.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-inputmask/jquery.inputmask.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-form-wizard/js/jquery.bootstrap.wizard.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/moment/moment.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-autonumeric/autoNumeric.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/dropzone/dropzone.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-tag/bootstrap-tagsinput.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/summernote/js/summernote.min.js"/>"></script>
		<script
		src="<spring:url value="/resources/assets/plugins/popper/umd/popper.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-typehead/typeahead.bundle.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-typehead/typeahead.jquery.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/handlebars/handlebars-v4.0.5.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/select2/js/select2.full.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/ion-slider/js/ion.rangeSlider.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.nouislider.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/assets/plugins/jquery-nouislider/jquery.liblink.js"/>"></script>
	<script 
	    src="<spring:url value="/resources/assets/js/slider.js"/>"></script>
	<script 
	    src="<spring:url value="/resources/assets/js/card.js"/>"></script>
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
	<script src="<spring:url value="/resources/assets/js/form_wizard.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

<script type="text/javascript">

 

$(function () {
	
	
	$(document).ready(function() {
	    $('#addUserForm').validate();
	});
	
	
	
	
	$('a.delete').confirm({
	    content: "",
	    type: 'red',
	    typeAnimated: true,
	         buttons: {
	        	 
	             Delete: {
	                       text: 'Delete user',
	                       btnClass: 'btn-red',
	                       action : function()
	                       {
             	            location.href = this.$target.attr('href');
                           }
	                     },
	             
	        close: function () {
	        }
	    }
	});
	
	
	
	
	$('a.delete').confirm({
	    buttons: {
	        hey: function(){
	            location.href = this.$target.attr('href');
	        }
	    }
	});
	
	$('#show-modal').click(function(){$('#addNewAppModal').modal('show');});
	$('#delete').click(function()
			{
		    $('#modalSlideUpSmall').modal('show');
});
	
	$("#creationDate").val(new Date().toISOString());
	$("#userProfiles").select2();
	$("#TyepHost").select2();
	$("#TyepAtmUpdate").select2();
	$("#TyepHostUpdate").select2();
	
	 
	
	
var elems = Array.prototype.slice.call(document.querySelectorAll('#ConnexionHandler'));

elems.forEach(function(html) {
    var switchery = new Switchery(html);
});
 
 
 
 
 
$("#ConnexionHandler").on("change",function()
		
		{
	
	     var isDisabled = $('#typeConnexion').prop('disabled');
	     
	    if (isDisabled == true)
		{	 
		    $("#typeConnexion").removeAttr("disabled");
		    $("#AdressIp").removeAttr("disabled");
		    $("#readingDisuqeLetter").removeAttr("disabled");
		}
	    
	    else 
	    {
	     
	    	$("#typeConnexion").prop('disabled', true);
		    $("#AdressIp").prop('disabled', true);
		    $("#readingDisuqeLetter").prop('disabled', true);
		}
	
 });
 
} );
 
 
 
 
 
 
 
   
</script>

</body>
</html>