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
		String sqlString = "select * from SidbiUserRegistration where bankName='" + bank + "' and BankStatus = 1";
		List<Object[]> list = currentSession().createSQLQuery(sqlString).list();
		return list; 
	}

	@Override
	public List<Long> countRequestofPfi() {
		String totelLoanDis = "select SUM(DesiredLoanAmount) from SidbiUserRegistration where BankStatus=1";
		String sqlStringforApproved = "select count(approved) from BankRegistration where approved = 1";
		String sqlStringforunApproved = "select count(approved) from BankRegistration where approved = 0";
		String sqlStringforPCG = "select count(applyFor) from BankRegistration where applyFor = 'Onlanding'";
		String sqlStringforOnlendingString = "select count(applyFor) from BankRegistration where applyFor = 'PCG'";

		Number c1 = ((Number) currentSession().createSQLQuery(sqlStringforApproved).uniqueResult());

		Number c2 = ((Number) currentSession().createSQLQuery(sqlStringforunApproved).uniqueResult());
		Number c3 = ((Number) currentSession().createSQLQuery(sqlStringforPCG).uniqueResult());
		Number c4 = ((Number) currentSession().createSQLQuery(sqlStringforOnlendingString).uniqueResult());
		Number c5 = ((Number) currentSession().createSQLQuery(totelLoanDis).uniqueResult());

		if (c1 == null) {
			c1 = 0;
		}
		if (c2 == null) {
			c2 = 0;
		}
		if (c3 == null) {
			c3 = 0;
		}
		if (c4 == null) {
			c4 = 0;
		}
		if (c5 == null) {
			c5 = 0;
		}

		List<Long> list = new ArrayList<Long>();

		list.add(c1.longValue());
		list.add(c2.longValue());
		list.add(c3.longValue());
		list.add(c4.longValue());
		list.add(c5.longValue());

		return list;
	}

}
