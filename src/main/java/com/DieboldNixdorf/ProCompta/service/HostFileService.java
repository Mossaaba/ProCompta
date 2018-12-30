package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.DieboldNixdorf.ProCompta.model.HostFile;

public interface HostFileService {
	
	
    List<HostFile> findAll();
    
    HostFile findById(int idHostFile);
     
	int saveHostFile(HostFile hostFile);
  
    void deleteById(int idHostFile);
	
    boolean HostFileExiste(String NameHostFile);
    
    List<String> ParseHostFile(MultipartFile multipartFile);
    
    

}
