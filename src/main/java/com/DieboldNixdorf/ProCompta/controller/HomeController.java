package com.DieboldNixdorf.ProCompta.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.hibernate.mapping.Map;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.DieboldNixdorf.ProCompta.tools.FileBucket;

@Controller
public class HomeController {
	
	
	@GetMapping("/")
	public String GoHome ()
	{
		return "home";
	}

	@GetMapping("/dashboard")
	public String GoDashboard ()
	{
		return "Empty";
	}
	
	@GetMapping("/Empty")
	public String GoEmpty ()
	{
		return "Empty";
	}
	/*	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
    public @ResponseBody
    List<FileBucket> upload(MultipartHttpServletRequest request,
                  HttpServletResponse response) throws IOException {
/*
           // Getting uploaded files from the request object
           Map<String, MultipartFile> fileMap = request.getFileMap();

           // Maintain a list to send back the files info. to the client side
           List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();

           // Iterate through the map
           for (MultipartFile multipartFile : fileMap.values()) {

                  // Save the file to local disk
                  saveFileToLocalDisk(multipartFile);

                  UploadedFile fileInfo = getUploadedFileInfo(multipartFile);

                  // Save the file info to database
                  fileInfo = saveFileToDatabase(fileInfo);

                  // adding the file info to the list
                  uploadedFiles.add(fileInfo);
           }

           return uploadedFiles;
    }
*/
	
	
	
	
	
	
	
	
 


}
