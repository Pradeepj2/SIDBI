package com.jci.service_phase2;

import java.util.List;

import com.jci.model.SidbiUserRegistration;

public interface LoanUserRegistrationService {
	
	public void createOrUpdate(SidbiUserRegistration sidbiUserRegistration);
	public List<SidbiUserRegistration> loadAllLoanApplication();
	public SidbiUserRegistration getById(int id);
	public List<Integer> listOfAllBankApproved();
	public void sendToSidbiPortal(SidbiUserRegistration user);
	public List<Object[]> getAllSentSidbi();
	public List<Object[]> getAllRegisteredBanks();
}
