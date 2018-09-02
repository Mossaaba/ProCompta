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
				<a id="listeAtm" class=" title text-uppercase text-primary font-montserrat all-caps small no-margin bold" data-toggle="tab" href="#tab1" data-target="#tab1" role="tab"><i class="fa fa-shopping-cart tab-icon"></i> <span>ListeAtm</span></a>
				</li>
				<li class="nav-item" >
				<a id="AddAnewAtm" class="text-primary font-montserrat all-caps small no-margin bold " data-toggle="tab" href="#tab2" data-target="#tab2" role="tab"><i class="fa fa-truck tab-icon"></i> <span>Add</span></a>
				</li>
				<li class="nav-item" >
				<a id="UpdateAtm" class="text-primary font-montserrat all-caps small no-margin bold" data-toggle="tab" href="#tab3" data-target="#tab3" role="tab"><i class="fa fa-credit-card tab-icon"></i> <span>Updtae</span></a>
				</li>
				<li class="nav-item" >
				<a id="DeleteAtm" class="text-primary font-montserrat all-caps small no-margin bold" data-toggle="tab" href="#tab4" data-target="#tab4" role="tab"><i class="fa fa-check tab-icon"></i> <span>Delet</span></a>
				</li>
				</ul>




       <div class="tab-content">
				<div class="tab-pane padding-20 sm-no-padding active slide-left" id="tab1">
				<div class="row row-same-height">
								<div class="col-md-2 b-r b-dashed b-grey sm-b-b">
								
								<div class="   sm-m-t-15 m-t-50">
								<i class="fa fa-university fa-2x hint-text" ></i>
								 
								<h4>la liste des ATMs!</h4>
								<p>Our Solution is multi Vendor </p>
								</div>	
								</div>
			
								
				<div class="col-md-10">
				<button type="button" id="add" class="btn btn-rounded btn-primary pull-right font-montserrat all-caps  no-margin text-white bold"><i class="fa fa-plus">Add a new Atm</i>
				</button>
				 
				<br>
				
				<div class="padding-30 sm-padding-5">
				<table class="table table-responsive-block nowrap ">
				 <thead>
				 <tr>
				 <td class="v-align-middle">Type</td>
				 <td class="v-align-middle">Name</td>
				 <td class="v-align-middle">Connexion </td>
				 <td class="v-align-middle">Adresse IP</td>
				 <td class="v-align-middle">User </td>
				 <td class="v-align-middle">Password</td>
				 <td class="v-align-middle">Disque </td>
				 <td class="v-align-middle">Repository </td>
				 <td class="v-align-middle"> Tools</td>
				 
				 
				 </tr>
				 </thead>
				 <tbody>
				 
				 <c:forEach var="atm" items="${listAtms}">
				  <tr>
				 <td class="text-primary font-montserrat v-align-middle">${atm.vendor}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.nameAtm}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.typeConnexion}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.adressIp}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.userSession}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.passwordSession}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.readingDisuqeLetter}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.repositoryFile}</td>
				 <td class="text-primary font-montserrat v-align-middle">
				 
				 <div class="btn-group">
					 
					
					 <button type="button" id="Update"  class="btn btn-sm  btn-rounded btn-success"><i class="fa fa-pencil"></i>
					</button>
					 
					 <button type="button" id="delete" class="btn btn-sm  btn-rounded btn-danger"><i class="fa fa-trash-o"></i>
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
										<form:form  action="saveAtm" modelAttribute="atm" method="POST">
										<p>Infos ATM</p>
										 
										<div class="row clearfix">
										
										<div class="col-sm-3">
										<div class="form-group form-group-default form-group-default-select2">
										
										<label>Type Atm</label>
										
										<form:select path="vendor" cssClass="full-width"
																	id="TyepAtm" data-placeholder="Vendor"
																	cssStyle="width: 100%;" data-init-plugin="select2"
																	items="${ListVendors}" />
																	
										</div>
										</div>
										
										
										<div class="col-sm-3">
										<div class="form-group form-group-default">
										<label>Agence</label>
										<form:input path="" type="text" cssClass="form-control" />
										
										
										
										</div>
										</div>
										
										
										<div class="col-sm-3">
										<div class="form-group form-group-default required">
										<label>Name ATM</label>
										<input type="text" class="form-control" required>
										</div>
										</div>
										<div class="col-sm-3">
										<div class="form-group form-group-default">
										<label>N serie</label>
										<input type="text" class="form-control">
										</div>
										</div>
										</div>
										 
										 
										 <p>Host configuration</p>
										<div class="row clearfix">
										<div class="col-sm-6">
										<div class="form-group form-group-default form-group-default-select2">
										
										<label>Type Host</label>
										<select id="TyepHost" Class="full-width" Style="width: 100%;" >
										<option value="ncr">NDC/DDC</option>
										<option value="Dibl">SmartVista</option>
										<option value="win">other</option>
										</select>
										</div>
										</div>
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>Config</label>
										<input type="text" class="form-control" placeholder="Password Session" required>
										</div>
										</div>
										</div>    
										 
									 	
										
										<p>Local Connexion</p>
										<div class="row clearfix">
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>Connexion</label>
										<input type="text" class="form-control" placeholder="local" required>
										</div>
										</div>
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>Address</label>
										<input type="text" class="form-control" placeholder="repository" required>
										</div>
										</div>
										</div>    
										
										
										<p>Remote Connesion</p>
										
										
										
										<div class="row clearfix">
										<div class="col-md-3">
											<div class="form-group form-group-default input-group">
												<div class="form-input-group">
													<label class="inline">Remote Connexion</label>
												</div>
												<div class="input-group-append h-c-50">
													<span class="input-group-text transparent"> <input
														type="checkbox" data-init-plugin="switchery"
														id="ConnexionHandler" data-size="small" data-color="red" />
													</span>
												</div>
										</div>
										</div>
										<div class="col-sm-3">
										<div class="form-group form-group-default required">
										<label>Connexion</label>
										<input type="text" class="form-control" id="typeConnexion" placeholder="local" disabled="disabled">
										</div>
										</div>
										<div class="col-sm-3">
										<div class="form-group form-group-default required">
										<label>Disque</label>
										<input type="text" class="form-control" id ="readingDisuqeLetter" placeholder="repository" disabled="disabled">
										</div>
										</div>
										<div class="col-sm-3">
										<div class="form-group form-group-default required">
										<label>Address</label>
										<input type="text" class="form-control" id ="AdressIp" placeholder="repository" disabled="disabled">
										</div>
										</div>
										</div> 
										
										
										<p>Session Windows Infos</p>
										<div class="row clearfix">
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>User</label>
										<input type="text" class="form-control" placeholder="User Session" required>
										</div>
										</div>
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>Password</label>
										<input type="password" class="form-control" placeholder="Password Session" required>
										</div>
										</div>
										</div>    
										
										
										
										
										
										</form:form>
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
										<form role="form">
										<p>Infos ATM</p>
										 
										<div class="row clearfix">
										
										<div class="col-sm-3">
										<div class="form-group form-group-default form-group-default-select2">
										
										<label>Type Atm</label>
										<select id="TyepAtmUpdate" Class="full-width" Style="width: 100%;" >
										<option value="ncr">NCR</option>
										<option value="Dibl">Diebold</option>
										<option value="win">Wincor</option>
										</select>
										</div>
										</div>
										
										
										<div class="col-sm-3">
										<div class="form-group form-group-default">
										<label>Agence</label>
										<input type="text" class="form-control">
										</div>
										</div>
										
										
										<div class="col-sm-3">
										<div class="form-group form-group-default required">
										<label>Name ATM</label>
										<input type="text" class="form-control" required>
										</div>
										</div>
										<div class="col-sm-3">
										<div class="form-group form-group-default">
										<label>N serie</label>
										<input type="text" class="form-control">
										</div>
										</div>
										</div>
										 
										 
										 <p>Host configuration</p>
										<div class="row clearfix">
										<div class="col-sm-6">
										<div class="form-group form-group-default form-group-default-select2">
										
										<label>Type Host</label>
										<select id="TyepHostUpdate" Class="full-width" Style="width: 100%;" >
										<option value="ncr">NDC/DDC</option>
										<option value="Dibl">SmartVista</option>
										<option value="win">other</option>
										</select>
										</div>  
										</div>
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>Config</label>
										<input type="text" class="form-control" placeholder="Password Session" required>
										</div>
										</div>
										</div>    
										 
									 	
										
										<p>Local Connexion</p>
										<div class="row clearfix">
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>Connexion</label>
										<input type="text" class="form-control" placeholder="local" required>
										</div>
										</div>
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>Address</label>
										<input type="text" class="form-control" placeholder="repository" required>
										</div>
										</div>
										</div>    
										
										
										<p>Remote Connesion</p>
										
										
										
										<div class="row clearfix">
										<div class="col-md-3">
											<div class="form-group form-group-default input-group">
												<div class="form-input-group">
													<label class="inline">Remote Connexion</label>
												</div>
												<div class="input-group-append h-c-50">
													<span class="input-group-text transparent"> <input
														type="checkbox" data-init-plugin="switchery"
														id="ConnexionHandlerUpdate" data-size="small" data-color="red" />
													</span>
												</div>
										</div>
										</div>
										<div class="col-sm-3">
										<div class="form-group form-group-default required">
										<label>Connexion</label>
										<input type="text" class="form-control" id="typeConnexionUpdate" placeholder="local" disabled="disabled">
										</div>
										</div>
										<div class="col-sm-3">
										<div class="form-group form-group-default required">
										<label>Disque</label>
										<input type="text" class="form-control" id ="readingDisuqeLetterUpdate" placeholder="repository" disabled="disabled">
										</div>
										</div>
										<div class="col-sm-3">
										<div class="form-group form-group-default required">
										<label>Address</label>
										<input type="text" class="form-control" id ="AdressIpUpdate" placeholder="repository" disabled="disabled">
										</div>
										</div>  
										</div> 
										
										
										<p>Session Windows Infos</p>
										<div class="row clearfix">
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>User</label>
										<input type="text" class="form-control" placeholder="User Session" required>
										</div>
										</div>
										<div class="col-sm-6">
										<div class="form-group form-group-default required">
										<label>Password</label>
										<input type="password" class="form-control" placeholder="Password Session" required>
										</div>
										</div>
										</div>    
										
										
										
										
										
										</form>
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
 
$(function () {
	
	
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
 
 
 
document.getElementById("add").onclick = function () {

	document.getElementById('AddAnewAtm').click();
};
document.getElementById("Update").onclick = function () {
	
	document.getElementById('UpdateAtm').click();
};
document.getElementById("delete").onclick = function () {
     
	document.getElementById('DeleteAtm').click();
	 
};
 
 
 
 
 
 
 
 
 
 
} );
 
 
 
 
 
 
 
   
</script>

</body>
</html>