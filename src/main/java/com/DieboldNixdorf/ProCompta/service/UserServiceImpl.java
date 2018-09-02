package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

 
import com.DieboldNixdorf.ProCompta.dao.UserDao;
import com.DieboldNixdorf.ProCompta.model.User;

@Service
public class UserServiceImpl implements UserService  {

	
	
    private UserDao userDao;
	
	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	@Transactional
	public void addUser(User u) {
		this.userDao.addUser(u);; 
		
	}

	@Override
	@Transactional
	public void updateUser(User u) {
		this.userDao.updateUser(u);;
		
	}

	@Override
	@Transactional
	public List<User> listUsers() {
		return this.userDao.listUsers();
	}

	@Override
	@Transactional
	public User getUserByName(String userName) {
		return this.userDao.getUserByName(userName);
	}

	@Override
	@Transactional
	public void removeUser(String userName) {
		 
	  this.userDao.removeUser(userName);
	}

}
