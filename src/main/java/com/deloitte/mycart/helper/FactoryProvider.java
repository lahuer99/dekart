package com.deloitte.mycart.helper;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
//	add session for user
	private static SessionFactory factory;
	
	private static final Logger logger= LogManager.getLogger(FactoryProvider.class);
	
	public static SessionFactory getFactory() {
		logger.info("start of getFactory()");
		
		try {
			PropertyConfigurator.configure("C:\\Users\\rbiji\\eclipse-workspace\\mycart\\src\\main\\resources\\log4j.properties");
			
			if(factory==null) {
				logger.info("factory is null");
				//so build sessionfactory
				factory= new Configuration().configure("hibernate.cfg.xml").buildSessionFactory(); //builder pattern
			}
		}catch(Exception e) {
			logger.error("Exception occured while init FactoryProvider");
			
			StringWriter sw=new StringWriter();
			e.printStackTrace(new PrintWriter(sw));
			logger.error(sw.toString());
		}
		
		logger.info("end getFactory()");
		return factory;
	}
}
