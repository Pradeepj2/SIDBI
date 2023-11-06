package com.sidbi.service;

import com.sidbi.model.User;

import antlr.collections.List;

public interface UserRegistrationService {
	public void create(User user);
	public User find(int id);
	public boolean submitform(User user);
	public String checkLogin(String username, String password);
	public boolean validateEmail(String Email);
	public String getUserId(int refid);
	public int getRefId(String emailId);
	public int getUserRoleId(int userId);
	public boolean validateusername(String username);
	public String getroletype(String username);
	public String getUsername(String email);
}