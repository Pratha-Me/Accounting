/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package model;

import com.model.DummyModel;
import com.model.FiscalModel;
import java.util.Properties;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author pratha
 */
public class HibernateUtil {
	
	private static SessionFactory sessionFactory;
	private final static String username = "pratha";
	private final static String password = "frarb";
	private final static String database = "meims";
	
	public static void init() {
		try {
			final Properties property = new Properties();
			property.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
			property.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/" + database + "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&useSSL=false");
			property.setProperty("hibernate.connection.username", username);
			property.setProperty("hibernate.connection.password", password);
//			property.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
			property.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
			property.setProperty("hibernate.temp.use_jdbc_metadata_defaults", "false");
			property.setProperty("hibernate.hbm2ddl.auto", "update");
			property.setProperty("hibernate.show_sql", "true");
			sessionFactory = new Configuration()
					.addProperties(property)
					.addAnnotatedClass(DummyModel.class)
					.addAnnotatedClass(FiscalModel.class)
					.buildSessionFactory();
		} catch (Throwable ex) {
			throw new ExceptionInInitializerError(ex);
		}
	}
	
	public static SessionFactory getSessionFactory() {
		try {
			if (sessionFactory.isClosed() || sessionFactory == null) {
				init();
			}
		} catch (Exception e) {
			init();
		}
		return sessionFactory;
	}
	
	public static Session getSession() {
		return getSessionFactory().openSession();
	}
}
