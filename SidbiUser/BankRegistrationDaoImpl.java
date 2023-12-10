package com.jci.dao.impl_phase2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jci.dao_phase2.BankRegistrationDao;
import com.jci.model.BankRegistrationModel;
import com.jci.model.SidbiUserRegistration;

@Repository
@Transactional
public class BankRegistrationDaoImpl implements BankRegistrationDao {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	SessionFactory sessionFactory;

	protected Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void createOrUpdate(BankRegistrationModel bankRegistrationModel) {
		currentSession().saveOrUpdate(bankRegistrationModel);

	}

	@Override
	public List<BankRegistrationModel> loadAllBanksApplication() {
		Criteria c = currentSession().createCriteria(BankRegistrationModel.class);
		List<BankRegistrationModel> ll = c.list();
		return ll;
	}

	@Override
	public BankRegistrationModel getById(int id) {
		return (BankRegistrationModel) currentSession().get(BankRegistrationModel.class, id);

	}

	@Override
	public List<String> loadAllBanksApproved() {
		String sqlString = "select pfiName from BankRegistration where approved = 1";
		List<String> list = currentSession().createSQLQuery(sqlString).list();
		return list;
	}
//
//	@Override
//	public void sendToSidbiPortal(BankRegistrationModel user) {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public List<Object[]> getAllUserOfBank(String bank) {
		String sqlString = "select * from sidbiUserRegistration where bankName='" + bank + "'";
		List<Object[]> list = currentSession().createSQLQuery(sqlString).list();
		return list;
	}

}
