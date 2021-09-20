package com.deloitte.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.mycart.entities.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) {
		boolean f=false;
		try {
			Session session=this.factory.openSession();
			Transaction txn=session.beginTransaction();
			
			session.save(product);
			
			txn.commit();
			session.close();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	
	public List<Product> getAllProducts(){
		Session session = this.factory.openSession();
		@SuppressWarnings("unused")
		Query<Product> query=session.createQuery("from Product",Product.class);
		
		List<Product> plist=query.getResultList();
		return plist;
	}
	
	public List<Product> getProductsById(int cId){
		Session session = this.factory.openSession();
		@SuppressWarnings("unused")
		Query<Product> query=session.createQuery("from Product as p where p.category.categoryId=: id",Product.class);
		query.setParameter("id", cId);
		
		List<Product> plist=query.getResultList();
		return plist;
	}
}
