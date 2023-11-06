package com.sidbi.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sidbi.dao.BankRegistrationDao;
import com.sidbi.dao.Impl.BankRegistrationDaoImpl;
import com.sidbi.model.BankRegistrationModel;
import com.sidbi.service.BankRegistrationService;

@Service
public class BankRegistrationServiceImpl implements BankRegistrationService {

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

	@Override
	public List<Long> countRequestofPfi() {
		return bankRegistrationDao.countRequestofPfi();
	}

//	@Override
//	public List<Object[]> getAllApprovedBanks() {
//		// TODO Auto-generated method stub
//		return bankRegistrationDao.getAllApprovedBanks();
//	}

}
