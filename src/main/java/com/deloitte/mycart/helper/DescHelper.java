package com.deloitte.mycart.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class DescHelper {
	public static String get10Words(String desc) {
		String[] strs=desc.split(" ");
		if(strs.length>10) {
			String res="";
			for(int i=0;i<10;i++) {
				res+=strs[i]+" ";
			}
			return res+"...";
		}else {
			return desc;
		}
		
	}
	
	public static Map<String, Long> getCounts(SessionFactory factory) {
		Session session=factory.openSession();
		String q="select count(*) from User";
		
		
		@SuppressWarnings("rawtypes")
		Query query=session.createQuery(q);
		Long userCount=(Long) query.list().get(0);
				
		Map<String, Long> cmap=new HashMap<String, Long>();
		cmap.put("userCount", userCount);
		session.close();
		
		return cmap;
	}
	
}
