<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
 
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>ProCompta - DN - Login</title>
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
<body class="fixed-header menu-pin menu-behind">

<div class="login-wrapper ">

				<div class="bg-pic">
				
				<img src="<spring:url value="/resources/assets/img/demo/dn.png"/>"  width="130%" class="lazy">
				
								<div class="bg-caption pull-bottom sm-pull-bottom text-white p-l-20 m-b-20">
										<h2 class="text-white font-montserrat no-margin text-uppercase" style="font-size : 10px ; line-height: 10px;">
										Welcom to ProCompta V2</h2>
										<p class="small font-montserrat">
										© Diebold Nixdorf DZ 2018-2019 SBM.
								       </p>
								</div>
				
				</div>


     <div class="login-container bg-white">
		<div class="p-l-50 m-l-20 p-r-50 m-r-20 p-t-50 m-t-30 sm-p-l-15 sm-p-r-15 sm-p-t-40">
		
					<a href="<spring:url value="/home"/>"  >
								             <span class="font-montserrat" style="font-size :50px;"> ProCompta</span>  </a>
				      
		                  <p class="p-t-35">Sign into your ProCompta account</p>
		
		                    <c:url var="loginUrl" value="/login" />
		                
								<form:form id="form-login" class="p-t-15"  
								                   action="${loginUrl}"  method="POST"  >
								
			                   <!-- Check for login error -->

								<c:if test="${param.error != null}">
									
									<div class="alert alert-danger col-xs-offset-1 col-xs-10 ">
										Invalid username and password.
									</div>
	
								</c:if>
									
								<!-- Check for logout -->

								<c:if test="${param.logout != null}">
									            
									<div class="alert alert-success col-xs-offset-1 col-xs-10">
										You have been logged out.
									</div>
							    
								</c:if>
								
								<div class="form-group form-group-default required">
								 <i class="fa fa-user-circle-o" > <label>Login</label>  </i> 
									<div class="controls">
									
									<input type="text" id="username" name="ssoId" class="form-control" >
									</div>
								</div>
								
								
								<div class="form-group form-group-default required ">
									<i class="fa fa-key" > <label>Password</label></i> 
									<div class="controls">
									 
									<input type="password" class="form-control" id="password" name="password"  >
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-6 no-padding sm-p-l-10">
										<div class="checkbox check-primary">
										  <input type="checkbox" value="1" id="rememberme" name="remember-me"    >
										<label for="rememberme">Keep Me Signed in</label>
										</div>
									</div>
									
								<div class="col-md-6 d-flex align-items-center justify-content-end ">
								<a href="#" class="text-primary small"> Help ? Contact Support</a>
								</div>
								
								
								</div>
								
								<button class="btn btn-primary btn-cons m-t-10" type="submit" value="Log in"> <i class="fa fa-sign-in" ></i> Sign in</button>
												
								</form:form>
		
		                
						 
						 
		    </div>
    <br>

                
				 
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




<script>
    $(function()
    {
      $('#form-login').validate();
      
    })
    </script>
</body>

<!-- Mirrored from pages.revox.io/dashboard/4.0.0/html/corporate/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Aug 2018 17:23:33 GMT -->
</html>