package com.DieboldNixdorf.ProCompta.dao;

import java.text.ParseException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import com.DieboldNixdorf.ProCompta.model.HostFile;
import com.DieboldNixdorf.ProCompta.service.HostFileService;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

@Repository
public class HostFileDaoImpl extends AbstractDao<Integer, HostFile> implements HostFileDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private HostFileService hostFileService;

	@SuppressWarnings("unchecked")
	@Override
	public List<HostFile> findAll() {

		Criteria crit = createEntityCriteria();
		return (List<HostFile>) crit.list();
	}

	@Override
	public HostFile findById(int idHostFile) {
		return getByKey(idHostFile);
	}

	@Override
	public int saveHostFile(HostFile hostFile) {
		Session currentSession = sessionFactory.getCurrentSession();
		Integer idHostFile = (Integer) currentSession.save(hostFile);
		return idHostFile;
	}

	@Override
	public void deleteById(int idHostFile) {
		HostFile hostFile = getByKey(idHostFile);
		delete(hostFile);

	}

	@Override
	public boolean HostFileExiste(String NameHostFile) {
		Session currentSession = sessionFactory.getCurrentSession();

		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from HostFile where NameHostFile=:theNameOfTheHostFile",
				HostFile.class);
		theQuery.setParameter("theNameOfTheHostFile", NameHostFile);
		if (theQuery.uniqueResult() != null) {

			return true;
		} else {

			return false;
		}
	}

	@Override
	public List<String> ParseHostFile(MultipartFile multipartFile) 
	{

		@SuppressWarnings("unused")
		Session currentSession = sessionFactory.getCurrentSession();
		HostFile hostFile = new HostFile();
		String HostFilelName = FilenameUtils.removeExtension(multipartFile.getOriginalFilename());
		ToolsToUse toolsProCompta = new ToolsToUse();

		Pattern pattern = Pattern.compile("TP(\\d+).*");
		Matcher matcher = pattern.matcher(HostFilelName);
		if (matcher.find()) {

			System.out.println("Date Host file +++++++++++++++++++++ " + matcher.group(1));

		}
		try 
		{

			hostFile.setDateUplaoded(toolsProCompta.convertStringToDateFileHost(matcher.group(1)));
		} catch (ParseException e2)
		{
			e2.printStackTrace();
		}

		hostFile.setNameHostFile(HostFilelName);

		@SuppressWarnings("unused")
		int idhostFile = hostFileService.saveHostFile(hostFile);

		return null;
	}

}
