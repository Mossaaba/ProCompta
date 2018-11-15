package com.DieboldNixdorf.ProCompta.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import java.util.List;
import java.util.Map;
 

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.DieboldNixdorf.ProCompta.model.Branch;
import com.DieboldNixdorf.ProCompta.model.FileUpload;
import com.DieboldNixdorf.ProCompta.model.UploadedFile;
import com.DieboldNixdorf.ProCompta.service.BranchService;
import com.DieboldNixdorf.ProCompta.service.FileUploadService;
import com.DieboldNixdorf.ProCompta.service.JounalService;

import org.apache.commons.io.FilenameUtils;
@CrossOrigin
@RestController
public class FileUploadController {

	@Autowired
	private FileUploadService uploadService;

	@Autowired
	private BranchService branchService;
	
	@Autowired
	private JounalService jounalService;
	
	

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView downloadFile() {
		ModelAndView mav = new ModelAndView("fileUpload");

		List<Branch> listBranches = branchService.getAllBranchs();
		mav.addObject("listBranches", listBranches);

		FileUpload fileUpload = new FileUpload();
		mav.addObject("fileUpload", fileUpload);

		return mav;

	}

	
	
	//MANUEL UPlOAD 
	@PostMapping("/upload")
	public @ResponseBody List<UploadedFile> upload(MultipartHttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("fileUpload") FileUpload fileUpload, @RequestParam String typeFile,
			@RequestParam Integer idAtm, @RequestParam String typeProcessingFile) throws IOException {

		Map<String, MultipartFile> fileMap = request.getFileMap();
		List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
		
		if (typeFile.equalsIgnoreCase("1"))
		{
			 
		
		for (MultipartFile multipartFile : fileMap.values())

		{
			 
			 String fileNameWithOutExt = FilenameUtils.removeExtension(multipartFile.getOriginalFilename());
             
             boolean ExisteJournal = jounalService.JounralExiste(fileNameWithOutExt); 
             @SuppressWarnings("unused")
			int ExistingJounral = 0;
              
			 
             if (!ExisteJournal) 
             {
            	List<String> listeSingleResultParsing= jounalService.ParseJournal(multipartFile, idAtm);  
            	
            	saveFileToLocalDisk(multipartFile);
     			
            	UploadedFile fileInfo = getUploadedFileInfo(multipartFile);
     			
            	fileInfo = saveFileToDatabase(fileInfo);
     			
            	uploadedFiles.add(fileInfo);
            	 
            
             
             }
             else 
             {
            	 System.out.println("Jounal : "+fileNameWithOutExt+ " existe");
            	 ExistingJounral++;
            	 
             }
			
		}
		}
		
		return uploadedFiles;
		
	}

	
	//AUTOMATIQUE 
	@GetMapping("/uploadAuto-{idAtm}-{typeFile}")
	public @ResponseBody List<UploadedFile> uploadAuto(@PathVariable("idAtm") Integer idAtm,
			@PathVariable("typeFile") String TyepFile) throws IOException {

		System.out.println("Geting " + idAtm);
		System.out.println("Geting " + TyepFile);

		List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
		return uploadedFiles;
	}

	
	
	
	
	
	
	
	private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException, FileNotFoundException {

		String outputFileName = getOutputFilename(multipartFile );

		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
	}

	private UploadedFile saveFileToDatabase(UploadedFile uploadedFile) {

		return uploadService.saveFile(uploadedFile);

	}

	private String getOutputFilename(MultipartFile multipartFile) {

		return getDestinationLocation() + multipartFile.getOriginalFilename();
	}

	private UploadedFile getUploadedFileInfo(MultipartFile multipartFile) throws IOException {

		UploadedFile fileInfo = new UploadedFile();
		fileInfo.setName(multipartFile.getOriginalFilename());
		fileInfo.setSize(multipartFile.getSize());
		fileInfo.setType(multipartFile.getContentType());
		fileInfo.setLocation(getDestinationLocation());

		return fileInfo;
	}

	private String getDestinationLocation() {
		return "C:/myProComptaTemp/";
	}

}
