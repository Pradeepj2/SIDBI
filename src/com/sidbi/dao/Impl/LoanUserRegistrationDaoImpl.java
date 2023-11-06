package com.sidbi.dao.Impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sidbi.dao.LoanUserRegistrationDao;
import com.sidbi.model.SidbiUserRegistration;

@Repository
@Transactional
public class LoanUserRegistrationDaoImpl implements LoanUserRegistrationDao {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	SessionFactory sessionFactory;

	protected Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void createOrUpdate(SidbiUserRegistration sidbiUserRegistration) {
		currentSession().saveOrUpdate(sidbiUserRegistration);

	}

	@Override
	public List<SidbiUserRegistration> loadAllUserApplication() {
		Criteria c = currentSession().createCriteria(SidbiUserRegistration.class);
	      List<SidbiUserRegistration> ll = c.list();
			return ll;	
		}

	@Override
	public SidbiUserRegistration getById(int id) {
		return (SidbiUserRegistration) currentSession().get(SidbiUserRegistration.class, id);
		
	}

	@Override
	public List<Integer> loadAllBankApproved() {
		String sqlString = "select userId from sidbiUserRegistration where BankStatus = 1";
		 List<Integer> list =  currentSession().createSQLQuery(sqlString).list();
		 return list;
	}

	@Override
	public void sendToSidbiPortal(SidbiUserRegistration user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Object[]> getAllSentSidbi() {
		String sqlString = "select * from sidbiUserRegistration where sentToSidbiStatus = 1";
		 List<Object[]> list =  currentSession().createSQLQuery(sqlString).list();
		 return list;
	}

	@Override
	public List<Object[]> getAllRegisteredBanks() {
		String sqlString = "select refId , pfiName from BankRegistration where approved = 1";
		 List<Object[]> list =  currentSession().createSQLQuery(sqlString).list();		 
		 return list;
	}

 
}
