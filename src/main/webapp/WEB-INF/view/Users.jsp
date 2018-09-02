<%@ page session="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!DOCTYPE html>
<html>
<head>
 
 

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
                     
                     

<!-- *************** -->
<!--    container 1  -->
<!-- *************** -->
				<div class="content">

					<div class=" container-fluid   container-fixed-lg">
             <div id="rootwizard" class="m-t-50">

				<ul class="nav nav-tabs nav-tabs-linetriangle nav-tabs-separator nav-stack-sm" role="tablist" data-init-reponsive-tabs="dropdownfx">
				<li class="nav-item" >
				<a id="listeAtm" class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold" data-toggle="tab" href="#tab1" data-target="#tab1" role="tab"><i class="fa fa-shopping-cart tab-icon"></i> <span>Users</span></a>
				</li>
				 
				</ul>




       <div class="tab-content">
				<div class="tab-pane padding-20 sm-no-padding active slide-left" id="tab1">
				<div class="row row-same-height">
								<div class="col-md-2 b-r b-dashed b-grey sm-b-b">
								
								<div class="   sm-m-t-15 m-t-50">
								<i class="fa fa-university fa-2x hint-text" ></i>
								 
								<h4>la liste des USER</h4>
								<p>Our Solution is multi Vendor </p>
								</div>	
								</div>
			
								
				<div class="col-md-10">
				 
												<div class="pull-right">
													<div class="col-xs-12">
													<button  id="show-modal" class="btn btn-primary btn-cons"   ><i class="fa fa-plus"></i> Add row
													</button>
													</div>
												</div>
				
				                                 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				<br>
				
				<div class="padding-30 sm-padding-5">
				<table class="table table-responsive-block nowrap ">
				 <thead>
				 <tr>
				 
				 <td class="v-align-middle">User Name</td>
				 <td class="v-align-middle">Password </td>
				 <td class="v-align-middle">email </td>
				 <td class="v-align-middle">creationDate</td>
				 <td class="v-align-middle">lastLogin </td>
				 <td class="v-align-middle">state </td>
				 <td class="v-align-middle">  </td>
				 
				 
				 
				 </tr>
				 </thead>
				 <tbody>
				 
				 <c:forEach var="user" items="${listeUsers}">
				 <c:url var ="updateLink" value="/user/updateUser">
					   <c:param name="userName" value="${user.userName}"></c:param>
				 </c:url>
				 <c:url var ="deleteLink" value="/user/deleteUser">
					   <c:param name="userName" value="${user.userName}"></c:param>
				 </c:url>
				  <tr>
				 <td class="text-primary font-montserrat v-align-middle">${user.userName}</td>
				 <td class="text-primary font-montserrat v-align-middle password">${user.password}</td>
				 <td class="text-primary font-montserrat v-align-middle">${user.email}</td>
				 <td class="text-primary font-montserrat v-align-middle">${user.creationDate}</td>
				 <td class="text-primary font-montserrat v-align-middle">${user.lastLogin}</td>
				  <td class="text-primary font-montserrat v-align-middle">${user.state}</td>
				  
				 <td class="text-primary font-montserrat v-align-middle">
				 
				 <div class="btn-group">
					 
					
					 <button onclick="window.location.href='${updateLink}'" type="button" id="Update"  class="btn btn-sm btn-rounded btn-success"><i class="fa fa-pencil"></i>
					</button>
					 <button onclick="window.location.href='${deleteLink}'" type="button" id="delete" class="btn btn-sm  btn-rounded btn-danger"><i class="fa fa-trash-o"></i>
					</button>	
                 </div>
               
                 </td>
				  
				 
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



										<div class="tab-pane slide-left padding-20 sm-no-padding" id="tab2">
										<div class="row row-same-height">
										
										<div class="col-md-2 b-r b-dashed b-grey ">
										<div class=" sm-m-t-15 m-t-50">
										<h2>Ajouter un nouveau DAB!</h2>
										
										<p class="small hint-text">Created ATM using infomation Elementes</p>
										</div>
										</div>
										
										
										<div class="col-md-10">
										<div class="padding-30 sm-padding-5">
										 
										</div>
										</div>
										</div>
										</div>
										
										
										
						<div class="tab-pane slide-left padding-20 sm-no-padding" id="tab3">
						<div class="row row-same-height">
						
						
						<div class="col-md-2 b-r b-dashed b-grey ">
						 <div class=" sm-m-t-15 m-t-50">
						<h2>Update the informations about ATM</h2>
                        </div>
						</div>
						
						
						
						 
						
						<div class="col-md-10">
										<div class="padding-30 sm-padding-5">
										 
										</div>
										 
						
						
						 
						</div>
						</div>
						</div>
						
						
						
						
						
<div class="tab-pane slide-left padding-20 sm-no-padding" id="tab4">
<h1>Thank you.</h1>
</div>
<div class="padding-20 sm-padding-5 sm-m-b-20 sm-m-t-20 bg-white clearfix">
<ul class="pager wizard no-style">
<li class="next">
<button class="btn btn-primary btn-cons btn-animated from-left fa fa-truck pull-right" type="button">
<span>Next</span>
</button>
</li>
<li class="next finish hidden">
 <button class="btn btn-primary btn-cons btn-animated from-left fa fa-cog pull-right" type="button">
<span>Finish</span>
</button>
</li>
<li class="previous first hidden">
<button class="btn btn-default btn-cons btn-animated from-left fa fa-cog pull-right" type="button">
<span>First</span>
</button>
</li>
<li class="previous">
<button class="btn btn-default btn-cons pull-right" type="button">
<span>Previous</span>
</button>
</li>
</ul>
</div>
 
</div>
</div>
 
				 
 
                     
				</div>	
                               



				</div>

				<jsp:include page="../view/fragments/footer.jsp"></jsp:include>
			</div>





		</div>






	</div>
	                                       <div class="modal fade slide-up " id="addNewAppModal" tabindex="-1" role="dialog" aria-labelledby="addNewAppModal" aria-hidden="true">
													
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header clearfix ">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
													</button>
													<h4 class="p-b-5"><span class="semi-bold">New</span> Utilisateur</h4>
													</div>
													<div class="modal-body">
													<p class="small-text">Create a new users </p>
													
													
													<form:form id="addUserForm" action="addUser" modelAttribute="user" method="POST" >
													<div class="row">
													<div class="col-sm-12">
													<div class="form-group form-group-default">
													<label>Name user </label>
													<form:input path="userName" id="userName" type="text" cssClass="form-control" placeholder="Name of your new user"/>
													</div>
													</div>
													</div>
													<div class="row">
													
													<div class="col-sm-12">
													<div class="form-group form-group-default">
													<label>Email</label>
													<form:input path="email" id="email" type="text" cssClass="form-control" placeholder="Tell us more about it"/>
													</div>
													</div>
													
													</div>
													<div class="row">
													
													<div class="col-sm-6">
													<div class="form-group form-group-default">
													<label>Password</label>
													<form:input path="password" id="password" type="password" cssClass="form-control" placeholder="your price"/>
													</div>
													</div>
													
													<div class="col-sm-6">
													 <div class="form-group form-group-default">
													<label>Etat</label>
													<form:input path="state" id="state" type="text"  class="form-control" placeholder="1 or 2"/>
													</div>
													</div>
													 
													
													
													</div>
													
													<div class="row">
													
													<div class="col-sm-12">
													<div class="form-group form-group-default">
													<label>Created ON </label> 
													<form:input path="creationDate" id="creationDate" type="text"  disabled="true" cssClass="form-control"  />
													</div>
													</div>
													
													</div>
													</form:form>
													</div>
													<div class="modal-footer">
													
													 
													<button type="submit" onclick="form_insert_submit()" class="btn btn-primary  btn-cons">Add</button>
													
													<button type="button" class="btn btn-cons" data-dismiss="modal">Close</button>
													</div>
													</div>
													
													</div>
													
												</div>
												
												
												
												
												
												
												
											 
												<c:if test="${!empty msg }">
												  
												  
															<script type="text/javascript">
															$(function () {
															$('#updateUserModel').modal('show');
															});
															</script>
												  
												<div class="modal fade slide-up" tabindex="-1" role="dialog" id="updateUserModel" aria-labelledby="updateUserModel" aria-hidden="true">
													
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header clearfix ">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
													</button>
													<h4 class="p-b-5"><span class="semi-bold">Update</span> Utilisateur</h4>
													</div>
													<div class="modal-body">
													<p class="small-text">Create a new users </p>
													
													
													<form:form id="saveUserForm" action="saveUser" modelAttribute="userUpdate" method="POST" >
													<div class="row">
													<div class="col-sm-12">
													<div class="form-group form-group-default">
													<label>Name user </label>
													<form:input path="userName" id="userName" type="text" cssClass="form-control" placeholder="Name of your new user"/>
													</div>
													</div>
													</div>
													<div class="row">
													
													<div class="col-sm-12">
													<div class="form-group form-group-default">
													<label>Email</label>
													<form:input path="email" id="email" type="text" cssClass="form-control" placeholder="Tell us more about it"/>
													</div>
													</div>
													
													</div>
													<div class="row">
													
													<div class="col-sm-6">
													<div class="form-group form-group-default">
													<label>Password</label>
													<form:input path="password" id="password" type="password" cssClass="form-control" placeholder="your price"/>
													</div>
													</div>
													
													<div class="col-sm-6">
													 <div class="form-group form-group-default">
													<label>Etat</label>
													<form:input path="state" id="state" type="text"  class="form-control" placeholder="1 or 2"/>
													</div>
													</div>
													 
													
													
													</div>
													
													<div class="row">
													
													<div class="col-sm-12">
													<div class="form-group form-group-default">
													<label>Created ON </label> 
													<form:input path="creationDate" id="creationDate" type="text"  disabled="true" cssClass="form-control"  />
													</div>
													</div>
													
													</div>
													</form:form>
													</div>
													<div class="modal-footer">
													
													 
													<button type="submit" onclick="form_update_submit()" class="btn btn-primary  btn-cons">Add</button>
													
													<button type="button" class="btn btn-cons" data-dismiss="modal">Close</button>
													</div>
													</div>
													
													</div>
													
												</div>
												</c:if>

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
	

<script type="text/javascript">

function form_update_submit() {
    document.getElementById("saveUserForm").submit();
}  
function form_insert_submit() {
	document.getElementById("addUserForm").submit();
	
}



$(function () {
	
	$('#show-modal').click(function(){$('#addNewAppModal').modal('show');});
	
	 $("#creationDate").val(new Date().toISOString());
	$("#TyepAtm").select2();
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
 
 
 
 
 
document.getElementById("delete").onclick = function () {
     
	document.getElementById('DeleteAtm').click();
	 
};
 
} );
 
 
 
 
 
 
 
   
</script>

</body>
</html>