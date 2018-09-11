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
         

		<div class="page-content-wrapper content-builder active full-height" id="plainContent">
		     <div class="page-content-wrapper">
                       <div class="content ">
                     
                     
			                     <div class=" container-fluid   container-fixed-lg ">
			                     
				                     <ol class="breadcrumb">
				                       <li class="breadcrumb-item"><a href="#">Home</a></li>
				                       <li class="breadcrumb-item active">Host</li>
				                     </ol>
				                     
			                         <div class="row bg-white">
											
											<div class="col-md-12">
																
														<div class="card card-transparent">
														<div class="card-body">
														
																<form:form  modelAttribute="host" method="POST" id="addhostForm" autocomplete="off">
																
																
																
																<p>Basic Information of the Host</p>
																
																<div class="form-group-attached">
																
																	<div class="form-group form-group-default required">
																	<label>Host name</label>
																	<form:input path="nomHost" type="text" cssClass="form-control"  />
																	</div>
																
																</div>
																
																<p class="m-t-10">Advanced Information</p>
																
																<div class="form-group-attached">
	
																<div class="row clearfix">
																
																	 
																        
																	<div class="col-md-6">
																	<div class="form-group form-group-default input-group required">
																	<div class="form-input-group">
																	<label>Host Name</label>
																	<form:input path="configCassette1" type="number" cssClass="form-control usd"  />
																	</div>
																	<div class="input-group-append ">
																	<span class="input-group-text">DZD
																	</span>
																	</div>
																	</div>
																	</div>
																	
																	<div class="col-md-6">
																	<div class="form-group form-group-default input-group required">
																	<div class="form-input-group">
																	<label>Nombre de station</label>
																	<form:input path="configCassette2" type="number" cssClass="form-control usd"  />
																	</div>
																	<div class="input-group-append ">
																	<span class="input-group-text">DZD
																	</span>
																	</div>
																	</div>
																	</div>
																	
																	<div class="col-md-6">
																	<div class="form-group form-group-default input-group required">
																	<div class="form-input-group">
																	<label>Nombre de station</label>
																	<form:input path="configCassette3" type="number" cssClass="form-control usd"  />
																	</div>
																	<div class="input-group-append ">
																	<span class="input-group-text">DZD
																	</span>
																	</div>
																	</div>
																	</div>
																	
																	<div class="col-md-6">
																	<div class="form-group form-group-default input-group required">
																	<div class="form-input-group">
																	<label>Nombre de station</label>
																	<form:input path="configCassette4" type="number" cssClass="form-control usd"  />
																	</div>
																	<div class="input-group-append ">
																	<span class="input-group-text">DZD
																	</span>
																	</div>
																	</div>
																	</div>
																	
																	
																	
																</div>

																</div>
																<br>
																	
																	<c:choose>
						                                
						                                <c:when test="${edit}">
						                                
						                                <form:hidden path="idHost"/>
						                                
						                                <form:button type="submit" id="addHostSuBmit" class="btn btn-primary  btn-cons"><i class="fa fa-plus-circle"></i> Update</form:button>
													    <form:button type="button" class="btn btn-cons btn-danger"><i class="fa fa-times-circle" ></i> Clear</form:button>	
													    					                                
						                                </c:when>
						                                <c:otherwise>
						                              <form:button type="submit"  id="addHostSuBmit" class="btn btn-primary  btn-cons"><i class="fa fa-plus-circle"></i> Add</form:button>
													  <form:button type="button" class="btn btn-cons btn-danger"><i class="fa fa-times-circle" ></i> Clear</form:button>
						                                </c:otherwise> 
						                               
						                             </c:choose> 

																
																</form:form >
														</div>
														</div>
																
											</div>
										</div>
										
										
										<div class="row">
										 <div class="card card-transparent">
											<div class="card-body">
											
											   <ol class="breadcrumb">
							                       <li class="breadcrumb-item"><a href="#">Home</a></li>
							                       <li class="breadcrumb-item active">Liste Hosts</li>
							                     </ol>
							                   <div class="row bg-white">
										
									 
										
										<div class="col-md-12">
											
											<div class="card card-transparent">
												<div class="card-header ">
												<div class="card-title">Host
												</div>
												</div>
												
												<div class="card-body">
												 
												 <table class="table table-hover table-responsive-block nowrap " id="tableHost">
										 <thead>
										 <tr>
										 
										  
										 <th class="v-align-middle text-primary bold fs-10"><i class="fa fa-address-card-o" aria-hidden="true"></i>Name Host</th>
										 <th class="v-align-middle text-primary bold fs-10"><i class="fa fa-id-badge" aria-hidden="true"></i>Configuration Cassette 01</th>
										 <th class="v-align-middle text-primary bold fs-10"><i class="fa fa-id-badge" aria-hidden="true"></i>Configuration Cassette 02</th>
										 <th class="v-align-middle text-primary bold fs-10"><i class="fa fa-id-badge" aria-hidden="true"></i>Configuration Cassette 03</th>
										 <th class="v-align-middle text-primary bold fs-10"><i class="fa fa-id-badge" aria-hidden="true"></i>Configuration Cassette 04</th>
										 
				                         <security:authorize access="hasRole('ADMIN')">
				                         <th class="v-align-middle"> </th>
				                         </security:authorize> 
										 </tr>
										 </thead>
										 <tbody>
										 
										 <c:forEach items="${hosts}" var="host">

										 <c:url var ="updateLink" value="/host/edit-host-${host.idHost}"></c:url>
										 <c:url var ="deleteLink" value="/host/delete-host-${host.idHost}"></c:url>
										 
										 
										  <tr>
											 
											 <td class="text-primary font-montserrat v-align-middle password">${host.nomHost}</td>
											 <td class="text-primary font-montserrat v-align-middle">${host.configCassette1}</td>
											 <td class="text-primary font-montserrat v-align-middle">${host.configCassette2}</td>
											 <td class="text-primary font-montserrat v-align-middle">${host.configCassette3}</td>
											 <td class="text-primary font-montserrat v-align-middle">${host.configCassette4}</td>
										      
										 
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
												 
												 </tr>
												 </tfoot>
								    </table>
												 
												 
												 
												<br>
												<div>
												<div class="profile-img-wrapper m-t-5 inline">
												<div class="chat-status available">
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
	
	
 
	
	$('#addidBranchSuBmit').click(function()
			{
		$('#addidBranchForm').validate();
});
	
	
	$('a.delete').confirm({
	    content: "",
	    type: 'red',
	    typeAnimated: true,
	         buttons: {
	        	 
	             Delete: {
	                       text: 'Delete Branch',
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