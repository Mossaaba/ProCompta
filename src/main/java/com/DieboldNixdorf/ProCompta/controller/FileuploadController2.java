package com.DieboldNixdorf.ProCompta.controller;
 

 
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.stereotype.Controller;
 
import org.springframework.util.FileCopyUtils;
 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
 

@Controller
@RequestMapping("/fileuploadController")

public class FileuploadController2 {
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView getPage(){
		ModelAndView view =new ModelAndView("fileUpload");
		return view;
	}
	
	@RequestMapping(value="/fileUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> fileUpload(MultipartHttpServletRequest request, HttpServletResponse response){
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<String> fileUploadedList = new ArrayList<String>();
		Iterator<String> itr =  request.getFileNames();
		MultipartFile mpf = null;
		
		while(itr.hasNext()){
			mpf = request.getFile(itr.next()); 
			try{
//				FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(context.getRealPath("/resources")+"/"+mpf.getOriginalFilename().replace(" ", "-")));
				FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream("C:/myProComptaTemp"+"/"+mpf.getOriginalFilename().replace(" ", "-")));
				fileUploadedList.add(mpf.getOriginalFilename().replace(" ", "-"));
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
		map.put("Status", 200);
		map.put("SucessfulList", fileUploadedList);
		return map;
	}
	
}