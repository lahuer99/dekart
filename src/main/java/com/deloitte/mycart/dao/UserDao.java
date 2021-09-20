package com.deloitte.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.deloitte.mycart.entities.User;

public class UserDao {
	//need this to perform db ops
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public User getUserByEmailAndPassword(String email,String password){
		User user=null;
		try {
			String query = "from User where user_email = :e and user_password = :p";
			Session session = this.factory.openSession();
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			user = (User) q.uniqueResult();
			
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public List<User> getAllUsers(){
		Session session = this.factory.openSession();
		@SuppressWarnings("unused")
		Query<User> query=session.createQuery("from User",User.class);
		
		List<User> ulist=query.getResultList();
		return ulist;
	}
}
