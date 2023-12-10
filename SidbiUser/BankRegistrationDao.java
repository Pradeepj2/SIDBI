package com.jci.dao_phase2;

import java.util.List;

import com.jci.model.BankRegistrationModel;
import com.jci.model.SidbiUserRegistration;

public interface BankRegistrationDao {
	void createOrUpdate(BankRegistrationModel bankRegistrationModel);

	List<BankRegistrationModel> loadAllBanksApplication();

	BankRegistrationModel getById(int id);

	List<String> loadAllBanksApproved();
//
//	void sendToSidbiPortal(BankRegistrationModel user);

	List<Object[]> getAllUserOfBank(String bank);

}
