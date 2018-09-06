<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
 <html>
 
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>ProCompta - DN - acces denied</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no" />

<link rel="apple-touch-icon"
	href="<spring:url value="/resources/pages/ico/60.png"/>" />
	
<link rel="apple-touch-icon"  
    href="<spring:url value="/resources/pages/ico/76.png"/>" />
<link rel="apple-touch-icon"  
	href="<spring:url value="/resources/pages/ico/120.png"/>" />
<link rel="apple-touch-icon"  
	href="<spring:url value="/resources/pages/ico/152.png"/>" />
<link rel="icon"  
	href="<spring:url value="/resources/pages/favicon.ico"/>" />

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta content="" name="description" />
<meta content="" name="author" />




<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/pace/pace-theme-flash.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap/css/bootstrap.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/font-awesome/css/font-awesome.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/jquery-scrollbar/jquery.scrollbar.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/switchery/css/switchery.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/pages/css/pages-icons.css"/>"
	type="text/css" />
<link class="main-stylesheet" rel="stylesheet"
	href="<spring:url value="/resources/pages/css/themes/corporate.css"/>"
	type="text/css" />


</head>
<body class="fixed-header error-page">
<div class="d-flex justify-content-center full-height full-width align-items-center">
<div class="error-container text-center">



<h1 class="error-number">Acces Denied ! </h1>
<h2 class="semi-bold">Sorry but we couldnt find this page</h2>
<p class="p-b-10"><span>Dear <strong>${loggedinuser}</strong>, You are not authorized to access this page.</span> <span class="floatRight"><a href="<c:url value="/logout" />">Logout</a></span>
</p>



<a href="${pageContext.request.contextPath}/home">Back to Home Page</a>
</div>
</div>


<script
	src="<spring:url value="/resources/assets/plugins/pace/pace.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery/jquery-3.2.1.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/modernizr.custom.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-ui/jquery-ui.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/popper/umd/popper.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>	
<script
	src="<spring:url value="/resources/assets/plugins/jquery/jquery-easy.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-unveil/jquery.unveil.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-ios-list/jquery.ioslist.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-actual/jquery.actual.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js"/>"></script>
<script 
      src="<spring:url value="/resources/assets/plugins/select2/js/select2.full.min.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/classie/classie.js"/>"></script>
<script
	src="<spring:url value="/resources/assets/plugins/switchery/js/switchery.min.js"/>"></script>
<script 
    src="<spring:url value="/resources/assets/plugins/jquery-validation/js/jquery.validate.min.js"/>"></script>
<script 
    src="<spring:url value="/resources/pages/js/pages.js"/>">
</script>
</body>

 