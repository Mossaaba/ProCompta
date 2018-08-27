package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


@Controller
public class UploadingSatimLogController {
	
	@RequestMapping ("/uploadingSatimLog")
	public String GoUploadingSatimLogController () {
		
		return "uploadingSatimLog";
	}
	

}
