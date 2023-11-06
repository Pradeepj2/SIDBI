package com.sidbi.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.deser.std.NumberDeserializers.IntegerDeserializer;
import com.sidbi.dao.BankRegistrationDao;
import com.sidbi.model.BankRegistrationModel;

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

	@Override
	public List<Object[]> getAllUserOfBank(String bank) {
		String sqlString = "select * from sidbiUserRegistration where bankName='" + bank + "'";
		List<Object[]> list = currentSession().createSQLQuery(sqlString).list();
		return list;
	}

	@Override
	public List<Long> countRequestofPfi() {
		String totelLoanDis = "select SUM(DesiredLoanAmount) from sidbiUserRegistration where BankStatus=1";
		String sqlStringforApproved = "select count(approved) from bankregistration where approved = 1";
		String sqlStringforunApproved = "select count(approved) from bankregistration where approved = 0";
		String sqlStringforPCG = "select count(applyFor) from bankregistration where applyFor = 'Onlanding'";
		String sqlStringforOnlendingString = "select count(applyFor) from bankregistration where applyFor = 'PCG'";
		long c1 = ((Number) currentSession().createSQLQuery(sqlStringforApproved).uniqueResult()).longValue();
		long c2 = ((Number) currentSession().createSQLQuery(sqlStringforunApproved).uniqueResult()).longValue();
		long c3 = ((Number) currentSession().createSQLQuery(sqlStringforPCG).uniqueResult()).longValue();
		long c4 = ((Number) currentSession().createSQLQuery(sqlStringforOnlendingString).uniqueResult()).longValue();
		long c5 = ((Number) currentSession().createSQLQuery(totelLoanDis).uniqueResult()).longValue();

		List<Long> list = new ArrayList<Long>();

		list.add(c1);
		list.add(c2);
		list.add(c3);
		list.add(c4);
		list.add(c5);

		return list;
	}

}
