package com.sidbi.dao;

import java.util.List;

import com.sidbi.model.BankRegistrationModel;


public interface BankRegistrationDao {
	
	void createOrUpdate(BankRegistrationModel bankRegistrationModel);

	List<BankRegistrationModel> loadAllBanksApplication();

	BankRegistrationModel getById(int id);

	List<String> loadAllBanksApproved();
//
//	void sendToSidbiPortal(BankRegistrationModel user);

	List<Object[]> getAllUserOfBank(String bank);

	List<Long> countRequestofPfi();

}
