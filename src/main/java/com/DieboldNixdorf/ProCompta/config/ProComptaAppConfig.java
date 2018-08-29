package com.DieboldNixdorf.ProCompta.config;

import java.beans.PropertyVetoException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.DieboldNixdorf.ProCompta.dao.IncidentDao;
import com.DieboldNixdorf.ProCompta.dao.IncidentDaoImpl;
import com.DieboldNixdorf.ProCompta.dao.TransactionDao;
import com.DieboldNixdorf.ProCompta.dao.TransactionDaoImpl;
import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages="com.DieboldNixdorf.ProCompta")
@PropertySource ({"classpath:/bdd/DataBase.properties" })
@ImportResource({"classpath:/config/DispatcherServelet.xml"})


public class ProComptaAppConfig  implements WebMvcConfigurer {
	
	  
	@Autowired
	private Environment env ; 
	
	
	
	private Logger logger = Logger.getLogger(getClass().getName());
	
	
	//define a bean for ViewResolver 
	@Bean
	public ViewResolver viewResolver() 
	{
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	} 
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry
	          .addResourceHandler("/resources/**")
	          .addResourceLocations("/resources/"); 
	}	
	
	
	
	//defin a bean for our data source 
	@Bean
	public DataSource securityDataSource() {
		
		// create connection pool
				ComboPooledDataSource securityDataSource
											= new ComboPooledDataSource();
		
		// set the jdbc driver class
		
		try {
			securityDataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException exc) {
			throw new RuntimeException(exc);
		}
		logger.info(">>> jdbc.url=" + env.getProperty("jdbc.url"));
		logger.info(">>> jdbc.user=" + env.getProperty("jdbc.user"));
		
		
		securityDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		securityDataSource.setUser(env.getProperty("jdbc.user"));
		securityDataSource.setPassword(env.getProperty("jdbc.password"));
		
		// set connection pool props
		
				securityDataSource.setInitialPoolSize(
						getIntProperty("connection.pool.initialPoolSize"));

				securityDataSource.setMinPoolSize(
						getIntProperty("connection.pool.minPoolSize"));

				securityDataSource.setMaxPoolSize(
						getIntProperty("connection.pool.maxPoolSize"));

				securityDataSource.setMaxIdleTime(
						getIntProperty("connection.pool.maxIdleTime"));
		
		
		
		return securityDataSource;
	}
	
    private int getIntProperty(String propName) {
		
		String propVal = env.getProperty(propName);
		
		// now convert to int
		int intPropVal = Integer.parseInt(propVal);
		
		return intPropVal;
	}
    
    
  //get Property of hibernate from the file hibernate.cfg.xml
    private Properties getHibernateProperties() {

		// set hibernate properties
		Properties props = new Properties();

		props.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
		props.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
		
		return props;				
	}
    
    //hibernate session factory 
    
    @Bean
	public LocalSessionFactoryBean sessionFactory(){
		
		// create session factorys
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		
		// set the properties
		sessionFactory.setDataSource(securityDataSource());
		sessionFactory.setPackagesToScan(env.getProperty("hibernate.packagesToScan"));
		sessionFactory.setHibernateProperties(getHibernateProperties());
		
		return sessionFactory;
	}
    
  //Transaction Manager of hibernate session factory 
    
    @Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		
		// setup transaction manager based on session factory
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}	
	
  //allow static resources 
    
   
    
    //Internazionaliation i18n 
    @Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
		rb.setBasenames(new String[] { "i18n/messages" });
		return rb;
	}
	
    
    //JDBC TEMPLATE
    
    @Autowired
	DataSource dataSource;
 
	@Bean
	public JdbcTemplate getJdbcTemplate() 
	{
		return new JdbcTemplate(dataSource);
	}
    
	
	@Bean
    public TransactionDao getTransactionDao() {
		return new TransactionDaoImpl(dataSource);
        
    }
	
	@Bean
    public IncidentDao getIncidentDao() {
		return new IncidentDaoImpl(dataSource);
        
    }
    
}
