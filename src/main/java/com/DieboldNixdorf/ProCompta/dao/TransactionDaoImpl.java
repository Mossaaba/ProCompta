package com.DieboldNixdorf.ProCompta.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;
 
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

 
 
@Repository("transactionDao")
public class TransactionDaoImpl implements TransactionDao {

	
	ToolsToUse toolToUse = new ToolsToUse();
	
	private JdbcTemplate jdbcTemplate;
	
	public TransactionDaoImpl(DataSource dataSource) 
	{
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	
	@Override
	public Transaction findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Transaction> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> listCardState() {
		 
		String sqlQuery = "select DISTINCT etatcarte from TRANSACTION ORDER BY etatcarte ASC ";
		List<String> listCardState =jdbcTemplate.queryForList(sqlQuery,String.class);
		return listCardState;
	}
	@Override
	public List<String> listCashState() {
		 
		String sqlQuery = "select DISTINCT etatcash from TRANSACTION ORDER BY etatcash ASC ";
		List<String> listCashState =jdbcTemplate.queryForList(sqlQuery,String.class);
		return listCashState;
	}

	@Override
	public List<String> listErreurs() {
		String sqlQuery = "select DISTINCT remarque from TRANSACTION ORDER BY remarque ASC ";
		List<String> listErreurs =jdbcTemplate.queryForList(sqlQuery,String.class);
		return listErreurs;
	}

	 
	

	 
	}
	    
	
	
	
	
	
	
	



