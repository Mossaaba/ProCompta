<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

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
<link rel="stylesheet"
	href="<spring:url value="/resources/assets/plugins/bootstrap-datepicker/css/datepicker3.css"/>"
	type="text/css" />
<link class="main-stylesheet" rel="stylesheet"
	href="<spring:url value="/resources/pages/css/themes/corporate.css"/>"
	type="text/css" />
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
	
<link  
	href="<spring:url value="/resources/assets/pages/Font-css/all.css"/>" />
	
	<link rel="stylesheet" type="text/css"
	href="<spring:url value="/resources/pages/css/hover.css"/>" />

 


<script type="text/javascript">






	window.onload = function() {
		// fix for windows 8
		if (navigator.appVersion.indexOf("Windows NT 6.2") != -1)
			document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="pages/css/windows.chrome.fix.css" />'
	}
	
	
	 
	
	
</script>



      <nav class="page-sidebar" data-pages="sidebar">
				
				 

				    <div class="   sidebar-header">
				       <span class="fs-20"> <i class="humbnail-wrapper d32 circular inline  ">  
			           <img class="hvr-pulse-grow" src="<spring:url value="/resources/pages/ico/logo.png"/>"  width="40%"  >  
			           <a href="<spring:url value="/home"/>"  >
			            </a>
			           <i class="">
						<button type="button" class="btn btn-link " data-toggle-pin="sidebar"><i class="fa  fa-2x"></i>
						</button>
						</i>
			
			          </i>
			           
			          </span>     
						  
						  
				   </div>
				  


      <div class="sidebar-menu">
            <ul class="menu-items">
			
			<li class="m-t-30 ">
			<a href="<spring:url value="/home"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.Dashboard"></spring:message></span>
			</a>
			<span class="bg-success icon-thumbnail"><i class="fa fa-tachometer" style="font-size :27px;"></i></span>
			</li>
			<li class="">
			
			<a href="<spring:url value="/upload"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.UplodingFile"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="fa fa-cloud-upload" style="font-size :27px;" ></i></span>
			</li>
			
			
			
			<li class=" ">
			<a href="<spring:url value="/transaction"/>"  > 
			<span class="title font-montserrat no-margin text-uppercase "><spring:message code="label.Transactions"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="fa fa-exchange" style="font-size :25px;"></i></span>
			</li>
			
 
			<li class="">
			<a href="<spring:url value="/incident"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.Incidents"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="fa fa-bolt" style="font-size :27px;" ></i></span>
			</li>
			
			<li class="">
			<a href="<spring:url value="/errorsATM"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.errorsATM"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="fa fa-exclamation-triangle" style="font-size :27px;" ></i></span>
			</li>
			
			
			<li class="">
			<a href="<spring:url value="/replenishment"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.Replenishment"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="fa fa-plus-square" style="font-size :27px;" ></i></span>
			</li>
			<li class="">
			<a href="<spring:url value="/cashBalance"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.cashBalance"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="fa fa-money" style="font-size :27px;" ></i></span>
			</li>
			 
			 
			 
 
            
               
            
           <li>
			<a href="javascript:;" ><span class="  font-montserrat no-margin text-uppercase ">
			Reconciliation </span>
			 </a>
			
			<span class="icon-thumbnail"><i class="fa fa-link" style="font-size :27px;"></i></span>
			<ul class="sub-menu">
			
			 
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="<spring:url value="pointage"/>" >  Peeforme </a>
			<span class="icon-thumbnail" ><i class=" fa fa fa-play" style="font-size :27px;"></i></span>
			</li> 
			
			<li class="title font-montserrat no-margin text-uppercase fs-10">
			<a href="<spring:url value="/reconciliationTable"/>"   > Reconcilied </a>
			<span class="icon-thumbnail" ><i class=" fa fa-check-square-o" style="font-size :27px;"></i></span>
			</li> 
			
			<li class="title font-montserrat no-margin text-uppercase fs-10">
			<a  href="<spring:url value="reconciliationJournal"/>"  > Only in Journal </a>
			<span class="icon-thumbnail" ><i class=" fa fa-file-text-o" style="font-size :27px;"></i></span>
			</li>   
			  
			<li class="title font-montserrat no-margin text-uppercase fs-10">
			<a href="<spring:url value="/reconciliationHost"/>"  >  Only in Host File </a>
			<span class="icon-thumbnail" ><i class="fa fa-server" style="font-size :27px;"></i></span>

			</li>
			 
           </ul>
            </li>

			<li class="title font-montserrat no-margin text-uppercase">
			<a href="charts.html">
			
			<span class="title"><spring:message code="label.Statistics"></spring:message></span></a>
			<span class="icon-thumbnail"><i class="pg-charts" style="font-size :27px;"></i></span>
			</li>
			
				<li>
			<a href="javascript:;"><span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.Rapport"></spring:message></span>
			<span class=" arrow"></span></a>
			<span class="icon-thumbnail" ><i class="pg-tables" style="font-size :27px;"></i></span>
			<ul class="sub-menu">
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="tables.html" class="fs-13 bold"><spring:message code="label.GlobalRapport"></spring:message></a>
			<span class="icon-thumbnail" style="font-size :27px;">GR</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="datatables.html" class="fs-12 bold" ><spring:message code="label.DetailsRapport"></spring:message></a>
			<span class="icon-thumbnail" style="font-size :27px;">DR</span>
			</li>
			</ul>
			</li>
			
			<li>
			<a href="javascript:;"><span class="title font-montserrat  text-uppercase"><spring:message code="label.Administration"></spring:message></span></a>
			<span class="icon-thumbnail"> <i class="fa fa-wrench" aria-hidden="true" style="font-size :25px;"></i></span>
			<ul class="sub-menu">
			
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="<spring:url value="/bank/list"/>" >Banque</a>
			<span class="icon-thumbnail"><i class="fa fa-building" style="font-size :25px; "></i></span>
			</li> 
			
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="<spring:url value="/branch/list"/>" >Agence</a>
			<span class="icon-thumbnail"><i class="fa fa-thumb-tack" style="font-size :25px;"></i></span>
			</li>
			
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="<spring:url value="/host/list"/>">Host</a>  
			<span class="icon-thumbnail"><i class="fa fa-server" style="font-size :25px;"></i></span>
			</li>
			
			
			
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="<spring:url value="/Atm/list"/>">ATM</a>  
			
			
			<span class="icon-thumbnail">
			  <img
			width="30" height="30"
			src="<spring:url value="/resources/assets/img/atm-white.svg"/>">
		    </span>
																
															 
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="<spring:url value="/regeX/list"/>">RegeX</a>  
			<span class="icon-thumbnail"><i class="fa fa-etsy" style="font-size :25px;"></i></span>
			</li>
			
			
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="<spring:url value="/user/list"/>" >Users</a> 
			<span class="icon-thumbnail"><i class="fa fa-group" style="font-size :25px;"></i></span>
			</li>
			
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="<spring:url value="/config"/>" >Configuration</a>
			<span class="icon-thumbnail"><i class="fa fa-cog" style="font-size :25px;"></i></span>
			</li>	 
			</ul>
			</li>
           </ul>
        </div>
</nav>
