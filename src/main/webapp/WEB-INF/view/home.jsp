<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<html>

<head>

 
<title>ProCompta - DN | HOME</title>
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
	
</head>
     
    
    
    <body class="fixed-header windows desktop pace-done">
     
    <jsp:include page="../view/fragments/menu.jsp"></jsp:include>    
    
         
     <div class="page-container ">
         <jsp:include page="../view/fragments/header.jsp"></jsp:include> 
        <br>
		<br>
		<br>

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
								
								
								</div>
						</div>
			
			
			
			 <jsp:include page="../view/fragments/footer.jsp"></jsp:include>  
			
			</div>
			
			
			
			
			
			   
			</div>
         
    </body>
    
    
    
</html>