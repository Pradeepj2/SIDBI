package com.jci.service_phase2;

import java.util.List;

import com.jci.model.BankRegistrationModel;
import com.jci.model.SidbiUserRegistration;

public interface BankRegistrationService {
	public void createOrUpdate(BankRegistrationModel bankRegistrationModel);
	public List<BankRegistrationModel> loadAllBanksApplication();
	public BankRegistrationModel getById(int id);
	public List<String> getAllApprovedBanks();
	public List<Object[]> getAllUserOfBank(String bank);
}
