package com.sidbi.service.Impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sidbi.dao.LoanUserRegistrationDao;
import com.sidbi.model.SidbiUserRegistration;
import com.sidbi.service.LoanUserRegistrationService;
 

@Service
public class LoanUserRegistrationServiceImpl implements LoanUserRegistrationService {
	
	@Autowired
	LoanUserRegistrationDao loanUserRegistrationDao;

	@Override
	public void createOrUpdate(SidbiUserRegistration sidbiUserRegistration) {
		loanUserRegistrationDao.createOrUpdate(sidbiUserRegistration);
	}

	@Override
	public List<SidbiUserRegistration> loadAllLoanApplication() {
		return loanUserRegistrationDao.loadAllUserApplication();
	}

	@Override
	public SidbiUserRegistration getById(int id) {
		return loanUserRegistrationDao.getById(id);
	}

	@Override
	public List<Integer> listOfAllBankApproved() {
		return loanUserRegistrationDao.loadAllBankApproved();
	}

	@Override
	public void sendToSidbiPortal(SidbiUserRegistration user) {
		loanUserRegistrationDao.sendToSidbiPortal(user);
		
	}

	@Override
	public List<Object[]> getAllSentSidbi() {
		return loanUserRegistrationDao.getAllSentSidbi();
	}

	@Override
	public List<Object[]> getAllRegisteredBanks() {
		return loanUserRegistrationDao.getAllRegisteredBanks();
	}

 

}
