<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>Spring MVC + Dropzone.js Example</title>

<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/assets/dropzone/libs/bootstrap-3.1.1/css/bootstrap.min.css"/>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/assets/dropzone/libs/bootstrap-dialog/css/bootstrap-dialog.min.css"/>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/assets/dropzone/css/style.css"/>'>

<body class="fixed-header windows desktop pace-done">
<security:csrfMetaTags />
<jsp:include page="../view/fragments/menu.jsp"></jsp:include>
 
	 

	<div class="page-container ">
		<jsp:include page="../view/fragments/header.jsp"></jsp:include>




		<div class="page-content-wrapper content-builder active full-height"
			id="plainContent">
			<div class="page-content-wrapper">
				<div class="content ">


					<div class=" container-fluid   container-fixed-lg ">

						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">File Upload</li>
						</ol>

						<div class="row bg-white">


							<div class="col-md-5">

								<div class="card card-transparent">
									<div class="card-body">

										<form:form id="dropzone-form" class="dropzone"
											enctype="multipart/form-data">

											<div
												class="dz-default dz-message file-dropzone text-center well col-sm-12">

												<span class="glyphicon glyphicon-paperclip"></span> <span>
													To attach files, drag and drop here</span><br> <span>OR</span><br>
												<span>Just Click</span>
											</div>

											<!-- this is were the previews should be shown. -->
											<div class="dropzone-previews"></div>
										</form:form>
										<hr>
												<button id="upload-button" class="btn btn-primary">
													<span class="glyphicon glyphicon-upload"></span> Upload
												</button>
												<a class="btn btn-primary pull-right" href="list"> <span
													class="glyphicon glyphicon-eye-open"></span> View All Uploads
												</a>
										
										
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



    <script type="text/javascript"
		src='<c:url value="/resources/assets/dropzone/libs/jquery/jquery-2.1.1.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/assets/dropzone/libs/bootstrap-3.1.1/js/bootstrap.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/assets/dropzone/libs/bootstrap-dialog/js/bootstrap-dialog.min.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/assets/dropzone/libs/dropzone.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/assets/dropzone/js/app.js"/>'></script>


	 
	
	
</body>
</html>