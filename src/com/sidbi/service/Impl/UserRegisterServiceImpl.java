package com.sidbi.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sidbi.dao.UserRegistrationDao;
import com.sidbi.model.User;
import com.sidbi.service.UserRegistrationService;


@Service
public class UserRegisterServiceImpl  implements UserRegistrationService{
	
	
	@Autowired
	UserRegistrationDao userRegistrationDao;
	


	@Override
	public void create(User user) {
		userRegistrationDao.create(user);
	}


	@Override
	public boolean submitform(User user) {
		return userRegistrationDao.submitform(user);
	}

	@Override
	public String checkLogin(String usrname, String password) {
		return userRegistrationDao.loginCheck(usrname, password);
	}

	@Override
	public boolean validateEmail(String Email) {
		return userRegistrationDao.validateEmail(Email);
	}

	@Override
	public String getUserId(int refid) {
		return userRegistrationDao.getUserId(refid);
	}

	@Override
	public int getRefId(String emailId) {
		// TODO Auto-generated method stub
		return userRegistrationDao.getRefId(emailId);
	}
	
	@Override
	public int getUserRoleId(int userId) {
		// TODO Auto-generated method stub
		return userRegistrationDao.getUserRoleId(userId);
	}
	

	
	@Override
	public boolean validateusername(String username) {
		// TODO Auto-generated method stub
		return userRegistrationDao.validateusername(username);
	}


	@Override
	public User find(int id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String getroletype(String email) {
		return userRegistrationDao.getRoleType(email);
	}


	@Override
	public String getUsername(String email) {
		return userRegistrationDao.getUsername(email);
	}


}
