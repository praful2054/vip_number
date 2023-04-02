package com.techgate.listener;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.techgate.util.GeneralFunction;

public class CustomServletContextListener implements ServletContextListener {

	private static final Logger log=Logger.getLogger(CustomServletContextListener.class);
	
	private ClassPathXmlApplicationContext context = null;
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if(log.isDebugEnabled())log.debug("Destroying Selvlet Context");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		if(log.isDebugEnabled())log.debug("Intializing Selvlet Context");
		context=new ClassPathXmlApplicationContext("bean.xml");

		GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
		Map<String, String> map = null;
		try {
        	map = generfunc.getAllSubCategoriesFromProduct();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map = new ConcurrentHashMap<String, String>();
		}
		
		context.registerShutdownHook();
		
		if(log.isDebugEnabled())log.debug("Created Spring Context Object "+context);
		arg0.getServletContext().setAttribute("context", context);
		arg0.getServletContext().setAttribute("categoriesMap", map);
		
	}
}
