package com.sidbi.dao;

import java.util.List;

import com.sidbi.model.User;

public interface UserRegistrationDao {
	public void create(User userRegistration);
	public User find(int id);
	public boolean submitform(User user);
	public String loginCheck(String userName, String password);
	public boolean validateEmail(String Email);
	public String getUserId(int refid);
	public int getRefId(String emailId);
	public int getUserRoleId(int userId);
	public boolean validateUserMobile(String mobileNo);
	public boolean validateusername(String username);
	public String getroletypr(String usrname);
	public String getoldpassword(int id);
	public String getRoleType(String email);
	public String getUsername(String email);

}
