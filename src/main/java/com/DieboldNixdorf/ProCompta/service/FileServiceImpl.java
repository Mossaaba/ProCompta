package com.DieboldNixdorf.ProCompta.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.DieboldNixdorf.ProCompta.dao.FileDao;
import com.DieboldNixdorf.ProCompta.model.FileUpload;

@Service
@Transactional
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDao fileDao;

	@Override
	public List<FileUpload> findAllFiles() {

		return fileDao.findAllFiles();
	}

	@Override
	public FileUpload findById(int idFile) {

		return fileDao.findById(idFile);
	}

	@Override
	public void save(FileUpload fileUpload) {
		fileDao.save(fileUpload);
	}

	@Override
	public List<FileUpload> findAllByAtmId(int idAtm) {

		return fileDao.findAllByAtmId(idAtm);
	}

	@Override
	public void deleteById(int idFile) {
		fileDao.deleteById(idFile);
	}

	@Override
	public void save(FileUpload fileUpload, int idAtm) {
		fileDao.save(fileUpload, idAtm);
	}

}
