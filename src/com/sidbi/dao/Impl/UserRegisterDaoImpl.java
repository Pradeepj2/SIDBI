package com.sidbi.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sidbi.dao.UserRegistrationDao;
import com.sidbi.model.User;


@Transactional
@Repository
public class UserRegisterDaoImpl implements UserRegistrationDao{
	
	
	@Autowired
	private HttpServletRequest request;

	@Autowired
	SessionFactory sessionFactory;

	protected Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void create(User user) {
		currentSession().save(user);
	}


	
	@Override
	public User find(int id) {
		return (User) currentSession().get(User.class, id);
	}

	/*
	 * @Override public List<UserRegistrationModel> getAll() { Criteria c =
	 * this.sessionFactory.getCurrentSession().createCriteria(UserRegistrationModel.
	 * class); List<UserRegistrationModel> ll=c.list(); return ll; }
	 */

	@Override
	public boolean submitform(User user) {
		this.sessionFactory.getCurrentSession().save(user);
		return false;
	}

	@Override
	public String loginCheck(String userName, String password) {
		List<Integer> result = new ArrayList<>();
		String querystr = "select * from users where email ='" + userName + "' and password ='" + password + "'";
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		SQLQuery query = session.createSQLQuery(querystr);
		List<Object[]> rows = query.list();

		boolean isPresent = rows.isEmpty();
		if (isPresent) {
			return null;
		}

		else if (rows.get(0)[1].toString().equalsIgnoreCase("Mobile User")) {
			return "mobile";
		}

		else {
			return rows.get(0)[4].toString();
		}

	}

	@Override
	public boolean validateEmail(String Email) {
		String querystr = "select * from users where email ='" + Email + "'";
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(querystr);
		List<Object[]> rows = query.list();
		boolean isPresent = rows.isEmpty();
		if (isPresent) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String getUserId(int refid) {
		String userrole = "";
		String querystr = "select roles_name from users where refid ='" + refid + "'";
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(querystr);
		List<String> userList = query.list();
		// System.out.println("userList==== "+userList);
		userrole = userList.get(0);
		return userrole;
	}


	

	@Override
	public int getUserRoleId(int userId) {
		// String querystr = "select regionId from jciumt where username ='"+userId+"'";
		// Session session = sessionFactory.getCurrentSession();

		String querystr = "select roleId from users where refid ='" + userId + "'";
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(querystr);
		List<Integer> userList = query.list();
		System.out.println(userList);
		int roleId = userList.get(0);
		return roleId;

	}






	@Override
	public int getRefId(String email) {
		// String querystr = "select dpcId from jciumt where refid ='"+userId+"'";
		String querystr = "select refid from users where email='" + email + "'";
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(querystr);
		List<Integer> userList = query.list();
		// System.out.println("refid===>>>>> "+userList);
		if (!userList.isEmpty()) {
			return userList.get(0);
			// return "0";
		} else {
			return 0;
		}
	}

	@Override
	public boolean validateUserMobile(String mobileNo) {
		List<Integer> result = new ArrayList<>();
		String querystr = "select * from users where mobileno ='" + mobileNo + "'";
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		SQLQuery query = session.createSQLQuery(querystr);
		List<Object[]> rows = query.list();
		boolean isPresent = rows.isEmpty();
		if (isPresent) {
			return true;
		} else {
			return false;
		}

	}

	

	@Override
	public boolean validateusername(String username) {
		List<String> result = new ArrayList<>();
		String querystr = "select * from users where email ='" + username + "'";
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		SQLQuery query = session.createSQLQuery(querystr);
		List<Object[]> rows = query.list();
		boolean isPresent = rows.isEmpty();
		if (isPresent) {
			return true;
		} else {
			return false;
		}

	}



	
	@Override
	public String getoldpassword(int id) {
		String querystr = "select password from users where refid='" + id + "'";
		Session session = sessionFactory.getCurrentSession();
		SQLQuery query = session.createSQLQuery(querystr);
		String password = (String)query.uniqueResult();

			return password;
	}

	@Override
	public String getroletypr(String usrname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getRoleType(String email) {
		String sqlString = "select role_type from users where email='"+email+"'";
		return (String) currentSession().createSQLQuery(sqlString).uniqueResult();
	
	}

	@Override
	public String getUsername(String email) {
		String sqlString = "select username from users where email='"+email+"'";
		return (String) currentSession().createSQLQuery(sqlString).uniqueResult();
	}
	
	
	
	
	
	

}
