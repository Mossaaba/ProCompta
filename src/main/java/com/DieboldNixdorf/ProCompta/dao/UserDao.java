package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.User;

public interface UserDao 
{
	
	public void addUser(User u);
	public void updateUser(User u);
	public List<User> listUsers();
	public User getUserByName(String userName);
	public void removeUser(String userName);

}
