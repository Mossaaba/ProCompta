package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

 
import com.DieboldNixdorf.ProCompta.model.FileUpload;
 

public interface FileDao {
	
	

   List<FileUpload> findAllFiles();
    
   FileUpload findById(int idFile);
     
    void save(FileUpload file);
     
    List<FileUpload> findAllByAtmId(int idAtm);
     
    void deleteById(int idFile);
	
    void save(FileUpload file , int idAtm);
	
	
}
