<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
	
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


			<div class="page-content-wrapper content-builder active full-height" id="plainContent">
			
						<div class="content">
						
										<div class=" container-fluid   container-fixed-lg">
													<ul class="breadcrumb p-l-0">
													<li class="breadcrumb-item"><a href="#">Host</a>
													</li>
													<li class="breadcrumb-item active">Host File
													</li>
													</ul>
										            <h3 class="page-title">Page Title</h3>
										</div>
								
								
										<div class=" container-fluid   container-fixed-lg">
										
										
										
										
										
										</div>
						</div>
			
			
			
			       <jsp:include page="../view/fragments/footer.jsp"></jsp:include>  
			</div> 
	</div>
         
    
   
    <script src="<spring:url value="/resources/assets/js/card.js"/>"></script>
	<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/media/js/jquery.dataTables.min.js"/>"></script>
	<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/TableTools/js/dataTables.tableTools.min.js"/>"></script>
	<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/media/js/dataTables.bootstrap.js"/>"></script>
	<script src="<spring:url value="/resources/assets/plugins/jquery-datatable/extensions/Bootstrap/jquery-datatable-bootstrap.js"/>"></script>
	<script src="<spring:url value="/resources/assets/plugins/datatables-responsive/js/datatables.responsive.js"/>"></script>
	<script src="<spring:url value="/resources/assets/plugins/datatables-responsive/js/lodash.min.js"/>"></script>
	<script src="<spring:url value="/resources/assets/js/tables.js"/>"></script>
	<script src="<spring:url value="/resources/assets/jquery-confirm.min.js"/>"></script>
	<script src="<spring:url value="/resources/pages/js/Datepair.js"/>"></script>
	<script src="<spring:url value="/resources/pages/js/hostFile.js"/>"></script>
    </body>
    
</html>