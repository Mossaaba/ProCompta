package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class UploadingController {
	
	 @RequestMapping ("/uploading")
	 
	public String goUploadingController()
	{
		 
		return "uploading";
	}
	
	

}
 