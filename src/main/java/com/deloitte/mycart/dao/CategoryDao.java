package com.deloitte.mycart.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.mycart.entities.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public int saveCategory(Category cat) {
		
//		try {
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		Session session=this.factory.openSession();
		Transaction txn=session.beginTransaction();
		
		int catId=(int) session.save(cat);
		
		txn.commit();
		session.close();
		
		return catId;
	}
	
	public List<Category> getCategories(){
		Session session=this.factory.openSession();
		Query<Category> query = session.createQuery("from Category", Category.class);
		
		List<Category> resultList = query.getResultList();
		session.close();
		return resultList;
	}
	
	public Category getCategoryById(int CatId) {
		Category category=null;
		try {
			Session session=this.factory.openSession();
			category = session.get(Category.class, CatId);
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return category;
	}
}
