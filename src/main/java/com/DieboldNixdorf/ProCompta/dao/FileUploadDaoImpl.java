package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

 

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.UploadedFile;

@Repository
public class FileUploadDaoImpl implements FileUploadDao {

  @Autowired
  private SessionFactory sessionFactory;

  @SuppressWarnings({ "unchecked", "deprecation" })
  public List<UploadedFile> listFiles() {
    return getSession().createCriteria(UploadedFile.class).list();
  }

  public UploadedFile getFile(Long id) {
    return (UploadedFile) getSession().get(UploadedFile.class, id);
  }

  private Session getSession() {
    Session sess = getSessionFactory().getCurrentSession();
    if (sess == null) {
      sess = getSessionFactory().openSession();
    }
    return sess;
  }

  public UploadedFile saveFile(UploadedFile uploadedFile) {
    return (UploadedFile) getSession().merge(uploadedFile);

  }

  private SessionFactory getSessionFactory() {
    return sessionFactory;
  }
}
