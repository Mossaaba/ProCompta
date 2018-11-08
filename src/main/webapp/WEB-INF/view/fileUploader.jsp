<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport"
       content="width=device-width, initial-scale=1">
<title>Spring MVC + Dropzone.js Example</title>

<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/assets/plugins/dropzone/css/dropzone.css"/>" />

<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/pages/css/hover.css"/>" />
	
	

</head>
<body class="fixed-header windows desktop pace-done" >
	<jsp:include page="../view/fragments/menu.jsp"></jsp:include>
       <div class="container">
       <jsp:include page="../view/fragments/header.jsp"></jsp:include>
       
       
       
       <br>   <br>   <br>   <br>
       <div class="page-content-wrapper content-builder active full-height"
			id="plainContent">

	<div class=" container-fluid container-fixed-lg ">

			<div class="page-content-wrapper">
				<div class="content ">
       
       
              <div class="panel panel-default">
                     <div class="panel-heading text-center">
                           <h3>Spring MVC + Dropzone.js Example</h3>
                     </div>
                     <div class="panel-body">
                           <div>
                                  <form:form id="dropzone-form" class="dropzone"
                                         enctype="multipart/form-data" action="uploadX?${_csrf.parameterName}=${_csrf.token}">

                                         <div class="dz-default dz-message file-dropzone text-center well col-sm-12">
                                                 <span class="glyphicon glyphicon-paperclip"></span> <span>
                                                       To attach files, drag and drop here</span><br>
                                                <span>OR</span><br>
                                                <span>Just Click</span>
                                         </div>

                                         <!-- this is were the previews should be shown. -->
                                         <div class="dropzone-previews"></div>
                                         <button id="upload-button" class="btn btn-primary">
                                         <span class="glyphicon glyphicon-upload"></span> Upload
                                  </button>
                                  </form:form>
                                  <hr>
                                  
                                  <a class="btn btn-primary pull-right" href="list"> <span
                                         class="glyphicon glyphicon-eye-open"></span> View All Uploads
                                  </a>
                           </div>
                     </div>
              </div></div></div></div></div>
       </div>
 	<script
		src="<spring:url value="/resources/assets/plugins/dropzone/dropzone.min.js"/>"></script>
       <script >
       Dropzone.options.dropzoneForm = {

    		  
              autoProcessQueue : false,
              uploadMultiple : true,
              maxFilesize : 256, // MB
              parallelUploads : 100,
              maxFiles : 100,
              addRemoveLinks : true,
               
              previewsContainer : ".dropzone-previews",

              // The setting up of the dropzone
              init : function() {

                     var myDropzone = this;

                     // first set autoProcessQueue = false
                     $('#upload-button').on("click", function(e) {

                           myDropzone.processQueue();
                     });

                     // customizing the default progress bar
                     this.on("uploadprogress", function(file, progress) {

                           progress = parseFloat(progress).toFixed(0);

                           var progressBar = file.previewElement.getElementsByClassName("dz-upload")[0];
                           progressBar.innerHTML = progress + "%";
                     });

                     // displaying the uploaded files information in a Bootstrap dialog
                     this.on("successmultiple", function(files, serverResponse) {
                           showInformationDialog(files, serverResponse);
                     });
              }
       }

       
       function showInformationDialog(files, objectArray) 
       {

              var responseContent = "";

              for (var i = 0; i < objectArray.length; i++) {

                     var infoObject = objectArray[i];

                     for ( var infoKey in infoObject) {
                           if (infoObject.hasOwnProperty(infoKey)) {
                             responseContent = responseContent + " " + infoKey + " -> " + infoObject[infoKey] + "<br>";
                           }
                     }
                     responseContent = responseContent + "<hr>";
              }

              // from the library bootstrap-dialog.min.js
              BootstrapDialog.show({
                     title : '<b>-----Server Response------</b>',
                     message : responseContent
              });
       }

 
    
          
       
       
       </script>
      
</body>
</html>