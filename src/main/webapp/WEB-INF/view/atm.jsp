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
				 
				</ul>




       <div class="tab-content">
				<div class="tab-pane padding-20 sm-no-padding active slide-left" id="tab1">
				<div class="row row-same-height">
								 
			
								
				<div class="col-md-12">
				                                <div class="pull-right">
													<div class="col-xs-12">
													<button  id="show-modal" class="btn btn-primary btn-cons" ><i class="fa fa-microchip"></i> Add ATM
													</button>
													</div>
												</div>
				 
				<br>
				
				<div class=" ">
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
				 
				  <security:authorize access="hasRole('ADMIN')">
				                        <td class="v-align-middle"> Tools</td>
				  </security:authorize> 
				 
				 
				 
				 </tr>
				 </thead>
				 <tbody>
				 
				 <c:forEach var="atm" items="${listAtms}">
				 
				   <c:url var ="updateLink" value="/atm/edit-atm-${atm.idAtm}"></c:url>
			     	<c:url var ="deleteLink" value="/atm/delete-atm-${atm.idAtm}"></c:url> 
				
				
				  <tr>
				 <td class="text-primary font-montserrat v-align-middle">${atm.vendor}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.nameAtm}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.typeConnexion}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.adressIp}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.userSession}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.passwordSession}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.readingDisuqeLetter}</td>
				 <td class="text-primary font-montserrat v-align-middle">${atm.repositoryFile}</td>
				
				 <security:authorize access="hasRole('ADMIN')">
				 
				 <td class="text-primary font-montserrat v-align-middle">
				 
				 <div class="btn-group">
					 
					
					 <button type="button" id="Update"  class="btn btn-sm  btn-rounded btn-success"><i class="fa fa-pencil"></i>
					</button>
					 
					 <button type="button" id="delete" class="btn btn-sm  btn-rounded btn-danger"><i class="fa fa-trash-o"></i>
					</button>	
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
	                                            <c:if test="${!empty msg }">
												<script type="text/javascript">
												$(function () {
												$('#addNewAppModal').modal('show');
												});
												</script>
												
                                               </c:if>
	
	                                            <div class="modal fade  fill-in  " id="addNewAppModal" 
                                                  tabindex="-1" role="dialog" aria-labelledby="addNewAppModal" aria-hidden="true" data-backdrop="static">
													
										       <div class="modal-dialog modal-lg">
										       <div class="modal-content">
													
											<div class="modal-header clearfix ">
											<h4 class="p-b-5">
											<span class="semi-bold"> <i class="fa fa-plus"></i> ADD New</span> ATM</h4>
											</div>
												 
												        
													 
					           <form:form modelAttribute="atm" method="POST"  >
					           
					                   
					                    
										<form:select path="Vendor" items="${ListVendors}" cssClass="form-control" />
										<form:select path="branch.idBranch" items="${branches}" cssClass="form-control"  itemValue="idBranch" itemLabel="nomBranch"/>
										<form:select path="host.idHost" items="${hosts}" cssClass="form-control"  itemValue="idHost" itemLabel="nomHost"/>
										
										
										<form:input path="nameAtm" cssClass="form-control" />
										
										<form:input path="typeConnexion" cssClass="form-control" />
										
										<form:input path="AdressIp" cssClass="form-control" />
										
										<form:input path="userSession" cssClass="form-control" />
										
										<form:input path="passwordSession" cssClass="form-control" />
										
										<form:input path="readingDisuqeLetter" cssClass="form-control" />
										
										<form:input path="repositoryFile" cssClass="form-control" />
										
										<form:input path="NumeroSerie" cssClass="form-control" />
										 
									 
										
										  <button type="submit" class="btn btn-primary  btn-cons"><i class="fa fa-user-plus"></i> Add the User</button>
			                              <button type="button" class="btn btn-cons btn-danger" data-dismiss="modal"><i class="fa fa-times-circle" aria-hidden="true"></i> Close</button>
					         </form:form>
													
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
	
	
	
	$('#show-modal').click(function(){$('#addNewAppModal').modal('show');});
	
	
	$("#TyepAtm").select2();
	$("#host").select2();
	$("#branch").select2();
	
	$("#TyepAtmUpdate").select2();
	$("#TyepHostUpdate").select2();
	
	var countries = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        prefetch: "${pageContext.request.contextPath}/api/disque"
      });
	
	$('#readingDisuqeLetter').typeahead(null, {
        name: 'countries',
        source: countries
      });
	
	
	
	
	
var elems = Array.prototype.slice.call(document.querySelectorAll('#ConnexionLocalHandler'));
var elems2 = Array.prototype.slice.call(document.querySelectorAll('#ConnexionRemotHandler'));



elems.forEach(function(html) {
  var switchery = new Switchery(html);
});
 
elems2.forEach(function(html) {
	  var switchery = new Switchery(html);
	});
 
$("#ConnexionRemotHandler").on("change",function()
		
		{
	
	     var isDisabled = $('#AdressIp').prop('disabled');
	    
	    if (isDisabled == true)
		{	 
		     
		    $("#AdressIp").removeAttr("disabled");
		    $("#readingDisuqeLetter").removeAttr("disabled");
		    
		    $("#localDive").hide();
		    
		}
	    
	    else 
	    {
	     
	    	 
		    $("#AdressIp").prop('disabled', true);
		    $("#readingDisuqeLetter").prop('disabled', true);
		    $("#localDive").show();
		 }
	
 });
 
$("#ConnexionLocalHandler").on("change",function()
		
		{
	
	     var isDisabled = $('#repositoryFile').prop('disabled');
	     var x = document.getElementById("remotDive");
	    if (isDisabled == true)
		{	 
		     
		    $("#repositoryFile").removeAttr("disabled");
		   
		    
		    $("#remotDive").hide();
		    $("#windowsDiv").hide();
		    
		    
		     
		    
		}
	    
	    else 
	    {
		   
		    $("#repositoryFile").prop('disabled', true);
		    
		    
		    $("#remotDive").show();
		    $("#windowsDiv").show();
		    
		 }
	
 });
 
 

 
 
 
	

} );
 
 
 
 
 
 
 
   
</script>

</body>
</html>