package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.FileUpload;

public interface FileService {

	List<FileUpload> findAllFiles();

	FileUpload findById(int idFile);

	void save(FileUpload fileUpload);

	List<FileUpload> findAllByAtmId(int idAtm);

	void deleteById(int idFile);

	void save(FileUpload fileUpload, int idAtm);
}
