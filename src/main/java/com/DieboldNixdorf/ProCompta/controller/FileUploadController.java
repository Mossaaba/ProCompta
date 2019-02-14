package com.DieboldNixdorf.ProCompta.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
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
import com.DieboldNixdorf.ProCompta.model.HostFile;
import com.DieboldNixdorf.ProCompta.model.Journal;
import com.DieboldNixdorf.ProCompta.model.UploadedFile;
import com.DieboldNixdorf.ProCompta.service.BranchService;
import com.DieboldNixdorf.ProCompta.service.FileUploadService;
import com.DieboldNixdorf.ProCompta.service.HostFileService;
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

	@Autowired
	private HostFileService hostFileService;

	@Value("${jrnMin}")
	String jrnMin;

	@Value("${jrnHour}")
	String jrnHour;

	@Value("${typeUploadJrn}")
	String typeUpload;

	@Value("${typeUploadHost}")
	String typeUploadHost;

	@Value("${HostMin}")
	String HostMin;

	@Value("${HostHour}")
	String HostHour;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView downloadFile(Model model) {
		ModelAndView mav = new ModelAndView("fileUpload");

		// Show configuration
		model.addAttribute("typeUpload", typeUpload);
		model.addAttribute("jrnHour", jrnHour);
		model.addAttribute("jrnMin", jrnMin);

		model.addAttribute("typeUploadHost", typeUploadHost);
		model.addAttribute("HostHour", HostHour);
		model.addAttribute("HostMin", HostMin);

		// Populate the Modal
		List<Branch> listBranches = branchService.getAllBranchs();
		mav.addObject("listBranches", listBranches);

		FileUpload fileUpload = new FileUpload();
		mav.addObject("fileUpload", fileUpload);

		List<Journal> listJournal = jounalService.findAll();
		mav.addObject("listJournal", listJournal);

		List<HostFile> listHostFile = hostFileService.findAll();
		mav.addObject("listHostFile", listHostFile);

		return mav;

	}

	// MANUEL UPlOAD
	@PostMapping("/upload")
	public @ResponseBody List<UploadedFile> upload(MultipartHttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("fileUpload") FileUpload fileUpload, @RequestParam String typeFile,
			@RequestParam Integer idAtm, @RequestParam String typeProcessingFile, Model model) throws IOException {

		Map<String, MultipartFile> fileMap = request.getFileMap();
		List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();

		java.util.Date dateToday = new java.util.Date();

		/*------------------------------------------------------------------------------------------------*/
		/*-------------------------------------- Journal File ------------------------------------------- */
		/*------------------------------------------------------------------------------------------------*/

		if (typeFile.equalsIgnoreCase("1")) {

			for (MultipartFile multipartFile : fileMap.values())

			{

				String fileNameWithOutExt = FilenameUtils.removeExtension(multipartFile.getOriginalFilename());
				boolean ExisteJournal = jounalService.JounralExiste(fileNameWithOutExt);

				if (!ExisteJournal) {

					List<String> listeSingleResultParsing = jounalService.ParseJournal(multipartFile, idAtm);

					String nbrTransaction = listeSingleResultParsing.get(0);
					String nbrReplinshement = listeSingleResultParsing.get(1);
					String nbrIncidents = listeSingleResultParsing.get(2);
					String nbrErrrosATM = listeSingleResultParsing.get(3);

					saveFileToLocalDisk(multipartFile);

					UploadedFile fileInfo = getUploadedFileInfo(multipartFile);

					fileInfo.setType("Journal");
					fileInfo.setName(multipartFile.getOriginalFilename());
					fileInfo.setFileDateUploaded(dateToday);

					fileInfo = saveFileToDatabase(fileInfo);

					fileInfo.setNbrTransactions(Integer.parseInt(nbrTransaction));
					fileInfo.setNbrReplenishements(Integer.parseInt(nbrReplinshement));
					fileInfo.setNbrIncidents(Integer.parseInt(nbrIncidents));
					fileInfo.setNbrErrorsATM(Integer.parseInt(nbrErrrosATM));
					fileInfo.setInfos("New Journal File ");

					uploadedFiles.add(fileInfo);

				} else {

					UploadedFile fileInfo = getUploadedFileInfo(multipartFile);

					fileInfo.setName(multipartFile.getOriginalFilename());
					fileInfo.setNbrTransactions(0);
					fileInfo.setNbrReplenishements(0);
					fileInfo.setNbrIncidents(0);
					fileInfo.setNbrErrorsATM(0);
					fileInfo.setInfos("Journal File existe");
					uploadedFiles.add(fileInfo);

				}

			}
		}
		/*------------------------------------------------------------------------------------------------*/
		/*-------------------------------------- Host   File ------------------------------------------- */
		/*------------------------------------------------------------------------------------------------*/
		else {

			for (MultipartFile multipartFile : fileMap.values())

			{

				String fileNameWithOutExt = FilenameUtils.removeExtension(multipartFile.getOriginalFilename());

				boolean ExisteHostFile = hostFileService.HostFileExiste(fileNameWithOutExt);

				if (!ExisteHostFile) {

					@SuppressWarnings("unused")
					List<String> listeSingleResultParsing = hostFileService.ParseHostFile(multipartFile);
					saveFileToLocalDisk(multipartFile);
					UploadedFile fileInfo = getUploadedFileInfo(multipartFile);
					fileInfo.setType("Host File");
					fileInfo = saveFileToDatabase(fileInfo);
					uploadedFiles.add(fileInfo);
					fileInfo.setInfos("new Host File");

				} else {

					UploadedFile fileInfo = getUploadedFileInfo(multipartFile);
					fileInfo.setType("Host File");
					fileInfo.setInfos("Host File Existe");
					uploadedFiles.add(fileInfo);
				}

			}

		}

		return uploadedFiles;

	}

	// AUTOMATIQUE
	@GetMapping("/uploadAuto-{idAtm}-{typeFile}")
	public @ResponseBody List<UploadedFile> uploadAuto(@PathVariable("idAtm") Integer idAtm,
			@PathVariable("typeFile") String TyepFile) throws IOException {
		System.out.println("Geting " + idAtm);
		System.out.println("Geting " + TyepFile);
		List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
		return uploadedFiles;
	}

	// -------------------------- Copy file to disk
	// -------------------------------------------------------\\
	private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException, FileNotFoundException {

		String outputFileName = getOutputFilename(multipartFile);

		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
	}

	// -------------------------- Save File to date base
	// -------------------------------------------------------\\
	private UploadedFile saveFileToDatabase(UploadedFile uploadedFile) {

		return uploadService.saveFile(uploadedFile);

	}

	// -------------------------- Save File to date base
	// -------------------------------------------------------\\
	private String getOutputFilename(MultipartFile multipartFile) {

		return getDestinationLocation() + multipartFile.getOriginalFilename() + ".Done";
	}

	// -------------------------- Save File to date base
	// -------------------------------------------------------\\
	private UploadedFile getUploadedFileInfo(MultipartFile multipartFile) throws IOException {

		UploadedFile fileInfo = new UploadedFile();
		fileInfo.setName(multipartFile.getOriginalFilename());
		fileInfo.setSize(multipartFile.getSize());

		fileInfo.setLocation(getDestinationLocation());

		return fileInfo;
	}

	private String getDestinationLocation() {
		return "C:/myProComptaTemp/";
	}

	@GetMapping("/getjournal-{journalId}")
	public @ResponseBody Journal getJournalDetails(@PathVariable("journalId") int journalId) {
		Journal jrn = jounalService.findById(journalId);
		return jrn;
	}

}
