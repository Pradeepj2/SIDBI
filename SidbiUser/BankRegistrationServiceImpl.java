package com.jci.service.Impl_phase2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jci.dao_phase2.BankRegistrationDao;
import com.jci.dao_phase2.LoanUserRegistrationDao;
import com.jci.model.BankRegistrationModel;
import com.jci.model.SidbiUserRegistration;
import com.jci.service_phase2.BankRegistrationService;

@Service
public class BankRegistrationServiceImpl implements BankRegistrationService{

	@Autowired
	BankRegistrationDao bankRegistrationDao;

	@Override
	public void createOrUpdate(BankRegistrationModel bankRegistrationModel) {
		bankRegistrationDao.createOrUpdate(bankRegistrationModel);
	}

	@Override
	public List<BankRegistrationModel> loadAllBanksApplication() {
		return bankRegistrationDao.loadAllBanksApplication();
	}

	@Override
	public BankRegistrationModel getById(int id) {
		return bankRegistrationDao.getById(id);
	}

	@Override
	public List<String> getAllApprovedBanks() {
		return bankRegistrationDao.loadAllBanksApproved();
	}

	@Override
	public List<Object[]> getAllUserOfBank(String bank) {
	return bankRegistrationDao.getAllUserOfBank(bank);
	}

//	@Override
//	public List<Object[]> getAllApprovedBanks() {
//		// TODO Auto-generated method stub
//		return bankRegistrationDao.getAllApprovedBanks();
//	}

}
