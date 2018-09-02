package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;
import java.util.logging.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.DieboldNixdorf.ProCompta.model.User;


@Repository
public class UserDaoImp implements UserDao {
	
	private Logger logger = Logger.getLogger(getClass().getName());

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addUser(User u) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.persist(u);
		logger.info("User saved successfully, User Details="+u);
	}

	@Override
	public void updateUser(User u) {
		
		Session currentSession = this.sessionFactory.getCurrentSession();
		currentSession.update(u);
		logger.info("User updated successfully, User Details="+u);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		 
		Session currentSession = this.sessionFactory.getCurrentSession();
		List<User> usersList = currentSession.createQuery("from User ").list();
		for(User u : usersList){
			logger.info("User List::"+u);
		}
		return usersList;
	}

	
	@Override
	public User getUserByName(String userName) {
		
		Session currentSession = this.sessionFactory.getCurrentSession();		
		User u = (User) currentSession.load(User.class, new String(userName));
		logger.info("Person loaded successfully, Person details="+u);
		return u;
	}

	@Override
	public void removeUser(String userName) {
		
		Session currentSession = this.sessionFactory.getCurrentSession();
		User u = (User) currentSession.load(User.class, new String(userName));
		if(null != u){
			currentSession.delete(u);
		}
		logger.info("Person deleted successfully, person details="+u); 

	}

}
