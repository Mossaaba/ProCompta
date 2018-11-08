package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.DieboldNixdorf.ProCompta.model.FileUpload;
 


@Repository
public class FileDaoImpl implements FileDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<FileUpload> findAllFiles() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<FileUpload> theQuery = currentSession.createQuery("from File ", FileUpload.class);
		List<FileUpload> Files = theQuery.getResultList();
		return Files;
		 
	}

	@Override
	public FileUpload findById(int idFile) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from FileUpload where idFile=:theFileId", FileUpload.class);
		theQuery.setParameter("theFileId", idFile);
		FileUpload fileUpload = (FileUpload) theQuery.getSingleResult();
		return fileUpload; 
	}

	@Override
	public void save(FileUpload fileUpload) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(fileUpload);

	}

	@Override
	public List<FileUpload> findAllByAtmId(int idAtm) {
		 
		return null;
	}

	@Override
	public void deleteById(int idFile) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from FileUpload where idFile=:theFileId");
		theQuery.setParameter("theFileId", idFile);
		theQuery.executeUpdate();

	}

	@Override
	public void save(FileUpload fileUpload, int idAtm) {
		 

	}

}
