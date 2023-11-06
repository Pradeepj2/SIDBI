package com.sidbi.service;

import java.util.List;

import com.sidbi.model.BankRegistrationModel;

public interface BankRegistrationService {
	public void createOrUpdate(BankRegistrationModel bankRegistrationModel);

	public List<BankRegistrationModel> loadAllBanksApplication();

	public BankRegistrationModel getById(int id);

	public List<String> getAllApprovedBanks();

	public List<Object[]> getAllUserOfBank(String bank);

	public List<Long> countRequestofPfi();
}
