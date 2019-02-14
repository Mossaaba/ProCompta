package com.DieboldNixdorf.ProCompta.Batch;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.DieboldNixdorf.ProCompta.model.ProComptaConfig;
import com.DieboldNixdorf.ProCompta.model.UploadedFile;
import com.DieboldNixdorf.ProCompta.service.AppConfigService;
import com.DieboldNixdorf.ProCompta.service.FileUploadService;
import com.DieboldNixdorf.ProCompta.service.HostFileService;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

@PropertySource({ "classpath:/Batch/batch.properties" })
@Component
public class HostFileBatch {
	
	

	@Value("${HostMin}")
	String HostMin;
	@Value("${HostHour}")
	String HostHour;
 
	@Autowired
	private FileUploadService uploadService;
	
    @Autowired 
    private AppConfigService appConfigService;
    
    @Autowired 
    private HostFileService hostFileService;
	
	 
	 
	@Scheduled(cron = "0 ${HostMin} ${HostHour} * * *")
		public void scheduleTaskUsingCronExpression() throws FileNotFoundException, IOException 
	{

		ProComptaConfig proComptaConfig =appConfigService.findById(1); 
		String FolderHostFilePath = proComptaConfig.getHostFileFolderPath();
		
		System.out.println("Parsing Host fILE  ");
		
		
		 File folder = new File(FolderHostFilePath);
         File[] listOfFiles = folder.listFiles();
         
         String hostFileName = "";
         String fileNameWithOutExt= "";
		
         for (int i = 0; i < listOfFiles.length; i++) {
       	  if (listOfFiles[i].isFile()) 
       	  {
       		   System.out.println(" iam here ");
       		    hostFileName = listOfFiles[i].getName();
       		    fileNameWithOutExt = FilenameUtils.removeExtension(hostFileName);
        		ToolsToUse toolsProCompta = new ToolsToUse();
        		
        		  boolean ExisteHostFile = hostFileService.HostFileExiste(fileNameWithOutExt); 
       	       
       	        if (!ExisteHostFile) 
                   {
       	        	
       	        	
       	        	 
       	        	    File file = new File(FolderHostFilePath+hostFileName);
       	        	    String name = hostFileName;
       	        	    String originalFileName = hostFileName;
       	        	    String contentType = "text/plain";
       	        	    Path pathjrn = Paths.get(FolderHostFilePath+"/"+hostFileName);
       	        	    byte[] content = null;
       	        	    try {
       	        	        content = Files.readAllBytes(pathjrn);
       	        	    } catch (final IOException e) {
       	        	    }
       	        	    
       	        	    MultipartFile multipartFile = new MockMultipartFile(name, originalFileName, contentType, content);   	    
       	        	    List<String> listeSingleResultParsingHostFile= hostFileService.ParseHostFile(multipartFile);   
       	        	    saveFileToLocalDisk(multipartFile);
       	                UploadedFile fileInfo = getUploadedFileInfo(multipartFile);
       	                fileInfo = saveFileToDatabase(fileInfo);
       	     			  
       	        	
                   }
       	        else 
       	        {
       	        	
       	        	System.out.println("Host File Existe ");
       	        	
       	        }
       	    
       	  }  
   	}
		

		
		
		    long now = System.currentTimeMillis() / 1000;
		    System.out.println(
		    "ProCompta schedule tasks using cron jobs Reading Host File - " + now);
	}

	//-------------------------- Copy file to disk ----------------------------------------------------------------\\
		private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException, FileNotFoundException {

			String outputFileName = getOutputFilename(multipartFile );

			FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
		}
		//-------------------------- Save File to date base  ------------------------------------------------------------\\
		private UploadedFile saveFileToDatabase(UploadedFile uploadedFile) {

			return uploadService.saveFile(uploadedFile);

		}
		//-------------------------- Save File to date base  -------------------------------------------------------------\\
		private String getOutputFilename(MultipartFile multipartFile) {

			return getDestinationLocation() + multipartFile.getOriginalFilename() + ".Done";
		}
		//-------------------------- Save File to date base  --------------------------------------------------------------\\
		private UploadedFile getUploadedFileInfo(MultipartFile multipartFile) throws IOException 
		{

			UploadedFile fileInfo = new UploadedFile();
			fileInfo.setName(multipartFile.getOriginalFilename());
			fileInfo.setSize(multipartFile.getSize());
			fileInfo.setType(multipartFile.getContentType());
			fileInfo.setLocation(getDestinationLocation());

			return fileInfo;
		}
		//-------------------------- Location saved journal repository   ----------------------------------------------------\\
		private String getDestinationLocation()
		{
			return "C:/myProComptaTemp/";
		}


}
