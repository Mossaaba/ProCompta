package com.DieboldNixdorf.ProCompta.model;

 
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name="account")
public class User {
	
	@Id
	@Column(name="username")
	private String userName;
	
	@Column(name="password")
	private String password;
	
	@Column(name="email")
	private String email;
	
	@Column(name="created_on")
	private Timestamp creationDate;
	
	@Column(name="last_login")
	private Timestamp lastLogin;
	
	@Column(name="enabled")
	private int state;

	
	
	
	public User() {
		 
	}

	 

	public Timestamp getCreationDate() {
		return creationDate;
	}



	public void setCreationDate(Timestamp creationDate) {
		this.creationDate = creationDate;
	}



	public Timestamp getLastLogin() {
		return lastLogin;
	}



	public void setLastLogin(Timestamp lastLogin) {
		this.lastLogin = lastLogin;
	}



	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	

	
	
	
}
 