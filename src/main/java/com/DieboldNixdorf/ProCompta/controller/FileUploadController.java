package com.DieboldNixdorf.ProCompta.controller;

 
 
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
 
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Journal;
import com.DieboldNixdorf.ProCompta.service.AtmService;
import com.DieboldNixdorf.ProCompta.service.JounalService;
 
import com.DieboldNixdorf.ProCompta.tools.FileBucket;
import com.DieboldNixdorf.ProCompta.validator.FileValidator;
 
 
@Controller
@RequestMapping("/uploading")
public class FileUploadController {

	 
	@Autowired
	JounalService jounalService;
     
    @Autowired
    MessageSource messageSource;
 
    @Autowired
    FileValidator fileValidator;
    
    
    @Autowired
    AtmService atmService;
     
    @InitBinder("fileBucket")
    protected void initBinder(WebDataBinder binder) {
       binder.setValidator(fileValidator);
    }
    
    
    @RequestMapping(value = { "/add-JournalFile-{idAtm}" }, method = RequestMethod.GET)
    public String addDocuments(@PathVariable int idAtm, ModelMap model) {
    	
    	Atm atm = atmService.findById(idAtm);
        model.addAttribute("atm", atm);
        
        FileBucket fileModel = new FileBucket();
        model.addAttribute("fileBucket", fileModel);
        
        List<Journal> journals = jounalService.findAll();
        model.addAttribute("journals", journals);
         
        return "managedocuments";
    }
    
    @PostMapping (value= {"/add-JournalFile-{idAtm}"})
    public String addDocumenets (FileBucket fileBucket , @PathVariable int idAtm ,
    		                     Model model ,  HttpServletResponse response) throws IOException
    
    {
    	
    	
    	Atm atm= atmService.findById(idAtm);
    	model.addAttribute("atm",atm);
    
    	saveDocument(fileBucket, atm);
   
        return "managedocuments";
    	
    	
    	 
    }
    
    
    private void saveDocument(FileBucket fileBucket, Atm atm) throws IOException{
        
        Journal jrn = new Journal();
         
        MultipartFile multipartFile = fileBucket.getFile();
        jrn.setNomJournal(multipartFile.getOriginalFilename());
        jrn.setContent(multipartFile.getContentType().getBytes());
        jrn.setContent(multipartFile.getBytes());
        jrn.setAtm(atm);
        
        
        
        
        //Traitement 
        
        
        
        jounalService.save(jrn, atm.getIdAtm());
        
        
    }
    
    
    
    
    
    
	
}
