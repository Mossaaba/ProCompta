<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

      <nav class="page-sidebar" data-pages="sidebar">
				
				<div class="sidebar-overlay-slide from-top" id="appMenu">
					<div class="row">
					<div class="col-xs-6 no-padding">
					<a href="#" class="p-l-40"><img src="<spring:url value="/resources/assets/img/demo/social_app.svg"/>" alt="socail">
					</a>
					</div>
					<div class="col-xs-6 no-padding">
					<a href="#" class="p-l-10"><img src="<spring:url value="/resources/assets/img/demo/email_app.svg"/>" alt="socail">
					</a>
					</div>
					</div>
					
					<div class="row">
					<div class="col-xs-6 m-t-20 no-padding">
					<a href="#" class="p-l-40"><img src="<spring:url value="/resources/assets/img/demo/calendar_app.svg"/>" alt="socail">
					</a>
					</div>
					<div class="col-xs-6 m-t-20 no-padding">
					<a href="#" class="p-l-10"><img src="<spring:url value="/resources/assets/img/demo/add_more.svg"/>" alt="socail">
					</a>
					</div>
					</div> 
				</div>

				<div class="sidebar-header">
				       <span class=""><i class="pg-menu_justify"></i></span>
				        <a href="<spring:url value="/home"/>"  >
			             <span class="font-montserrat" style="font-size :20px;">ProCompta</span>
			            </a>
                        
						<div class="sidebar-header-controls">
						<button type="button" class="btn btn-link d-lg-inline-block d-xlg-inline-block d-md-inline-block d-sm-none d-none" data-toggle-pin="sidebar"><i class="fa fs-12"></i>
						</button>
						</div>
				</div>


      <div class="sidebar-menu">
            <ul class="menu-items">
			
			<li class="m-t-30 ">
			<a href="<spring:url value="/dashboard"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.Dashboard"></spring:message></span>
			</a>
			<span class="bg-success icon-thumbnail"><i class="pg-home" style="font-size :27px;"></i></span>
			</li>
			<li class="">
			<a href="<spring:url value="/incident"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.UplodingFile"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="fa fa-cloud-upload" style="font-size :27px;" ></i></span>
			</li>
			
			<li class="">
			<a href="<spring:url value="/day"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.Day"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="pg-calender" style="font-size :27px;" ></i></span>
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
			<a href="<spring:url value="/incident"/>"  >
			<span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.Replenishment"></spring:message></span>
			</a>
			<span class="icon-thumbnail"><i class="fa fa-plus-square" style="font-size :27px;" ></i></span>
			</li>
			
			<li>
			<a href="javascript:;"><span class="title font-montserrat no-margin text-uppercase"><spring:message code="label.Host"></spring:message></span>
			<span class=" arrow"></span></a>
			<span class="icon-thumbnail"><i class="pg-layouts2" style="font-size :27px;"></i></span>
			<ul class="sub-menu">
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="secondary_layout.html"><spring:message code="label.HostFile"></spring:message> </a>
			<span class="icon-thumbnail" style="font-size :27px;">FH</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="secondary_layout.html"><spring:message code="label.Tally"></spring:message></a>
			<span class="icon-thumbnail" style="font-size :27px;">PT</span>

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
			<a href="tables.html"><spring:message code="label.GlobalRapport"></spring:message></a>
			<span class="icon-thumbnail" style="font-size :27px;">GR</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="datatables.html"><spring:message code="label.DetailsRapport"></spring:message></a>
			<span class="icon-thumbnail" style="font-size :27px;">DR</span>
			</li>
			</ul>
			</li>
			
			<li>
			<a href="javascript:;"><span class="title font-montserrat  text-uppercase"><spring:message code="label.Administration"></spring:message></span></a>
			<span class="icon-thumbnail"><i class="pg-bag" style="font-size :25px;"></i></span>
			<ul class="sub-menu">
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="invoice.html">Invoice</a>
			<span class="icon-thumbnail">in</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="404.html">404 Page</a>
			<span class="icon-thumbnail">pg</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="500.html">500 Page</a>
			<span class="icon-thumbnail">pg</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="blank_template.html">Blank Page</a>
			<span class="icon-thumbnail">bp</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="login.html">Login</a>
			<span class="icon-thumbnail">l</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="register.html">Register</a>
			<span class="icon-thumbnail">re</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="lock_screen.html">Lockscreen</a>
			<span class="icon-thumbnail">ls</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="gallery.html">Gallery</a>
			<span class="icon-thumbnail">gl</span>
			</li>
			<li class="title font-montserrat no-margin text-uppercase">
			<a href="timeline.html">Timeline</a>
			<span class="icon-thumbnail">t</span>
			</li>
			</ul>
			</li>

           </ul>



 
        </div>
</nav>
