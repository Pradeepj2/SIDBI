package com.sidbi.dao;

import java.util.List;

import com.sidbi.model.SidbiUserRegistration;

public interface LoanUserRegistrationDao {

	void createOrUpdate(SidbiUserRegistration sidbiUserRegistration);

	List<SidbiUserRegistration> loadAllUserApplication();

	SidbiUserRegistration getById(int id);

 public	List<Integer> loadAllBankApproved();

	void sendToSidbiPortal(SidbiUserRegistration user);

	List<Object[]> getAllSentSidbi();

	List<Object[]> getAllRegisteredBanks();

}
