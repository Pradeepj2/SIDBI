package com.jci.dao_phase2;

import java.util.List;

import com.jci.model.SidbiUserRegistration;

public interface LoanUserRegistrationDao {

	void createOrUpdate(SidbiUserRegistration sidbiUserRegistration);

	List<SidbiUserRegistration> loadAllUserApplication();

	SidbiUserRegistration getById(int id);

	List<Integer> loadAllBankApproved();

	void sendToSidbiPortal(SidbiUserRegistration user);

	List<Object[]> getAllSentSidbi();

	List<Object[]> getAllRegisteredBanks();

}
