<%@ page session="false"%>
<%@ page isELIgnored="false" %>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
 
<html>

<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/dropzone/css/dropzone.css"/>" />
     
    
    
    <body class="fixed-header windows desktop pace-done">
     <security:csrfMetaTags />
    <jsp:include page="../view/fragments/menu.jsp"></jsp:include>    
    
         
     <div class="page-container ">
         <jsp:include page="../view/fragments/header.jsp"></jsp:include> 


			<div class="page-content-wrapper content-builder active full-height" id="plainContent">
			
						<div class="content">
						
								<div class=" container-fluid   container-fixed-lg">
											<ul class="breadcrumb p-l-0">
											<li class="breadcrumb-item"><a href="#">Home</a>
											</li>
											<li class="breadcrumb-item active">Plain template
											</li>
											</ul>
								
								            <h3 class="page-title">Page Title</h3>
								</div>
								
								
								<div class=" container-fluid   container-fixed-lg">
								
								
								
						<div class="col-lg-6">
							
							<div class="card card-default">
							<div class="card-header ">
							<div class="card-title">
							Drag n' drop uploader
							</div>
							<div class="tools">
							<a class="collapse" href="javascript:;"></a>
							<a class="config" data-toggle="modal" href="#grid-config"></a>
							<a class="reload" href="javascript:;"></a>
							<a class="remove" href="javascript:;"></a>
							</div>
							</div>
							<div class="card-body no-scroll no-padding">
							
							
							<form:form action="/fileUpload" class="dropzone no-margin">
							<div class="fallback">
							 <input name="file" type="file" multiple />
							 
							 
							 
							</div>
							</form:form>
							</div>
							</div>

                       </div>
								
								</div>
						</div>
			
			</div>
			
			 <jsp:include page="../view/fragments/footer.jsp"></jsp:include>  
			
			</div>
			
			
			
			
			
			   
			</div>
         
  
    <script
	src="<spring:url value="/resources/assets/plugins/dropzone/dropzone.min.js"/>"></script>
   
    
 
    </body>
    
    
    
</html>