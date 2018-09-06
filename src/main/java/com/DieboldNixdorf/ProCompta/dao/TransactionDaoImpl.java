package com.DieboldNixdorf.ProCompta.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;
 
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

 
 

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

	 
	

	public List<Transaction> listTransactionByFilter(Date DebuttransactionDate , Date fintransactionDate ,
													Time startingTimeTransaction,  Time fnisgingTimeTransaction , 
													String cardNumber ,  String CradState , long montant , String etatcash , 
													String numberAuthorisatin  , String errorTransaction  , 
													long MinAmount  , long MaxAmount ) 
	{


		String query = " select t.idtransaction , t.idjournal , "
				+ "     j.datejournal as DebuttransactionDate ,    "
				+ "     j.datejournal as fintransactionDate ,      "
				+ "     j.datejournal , t.heuredebut ,             "
				+ "     t.heurefin , t.numerocarte , t.etatcarte , "
				+ "     t.montant , t.etatcash ,                    "
				+ "     t.cassette1 , t.cassette2 , t.cassette3 , t.cassette4 , "
				+ "     t.nauthorisation ,  t.remarque                          "
				+ "     from transaction t                                      "
				+ "     inner join journal j on t.idjournal = j.idjournal  where (   " ;
					
		 String subreq="";
		 if ( (!DebuttransactionDate.equals(null)) && (!fintransactionDate.equals(null))) 
		 {
			 subreq = subreq + " ( j.datejournal  BETWEEN  '"+DebuttransactionDate+"' and  '"+fintransactionDate+"' ) and "  ; 
		 }
		 if ( (!startingTimeTransaction.equals(null)) && (!fnisgingTimeTransaction.equals(null))) 
		 {
			 subreq = subreq + " ( t.heuredebut  >=  '"+startingTimeTransaction+"' and t.heurefin <= '"+fnisgingTimeTransaction+"' ) and "  ; 
		 }
		 if (!cardNumber.equalsIgnoreCase("")) { 
			subreq = subreq + " (t.numerocarte LIKE '%"+cardNumber+"' ) and "  ;	      
		 }
	     if (!CradState.equalsIgnoreCase("-")) {
	    	subreq = subreq + " (t.etatcarte = '"+CradState+"') and  "   ;
	     }
	     if (montant != 0) {
	    	subreq = subreq + " (t.montant = '"+montant+"') and  "   ;
	     }
	     if ((MaxAmount != 0)) 
	     {   
	    	 subreq = subreq + " (t.montant >= '"+MinAmount+"' and  t.montant <= '"+MaxAmount+"' ) and  " ; 
	     }
	     if (!etatcash.equalsIgnoreCase("-")) {	
	    	subreq = subreq + " (t.etatcash = '"+etatcash+"') and  "   ;
	     }
	     if (!numberAuthorisatin.equalsIgnoreCase("")) {	
		    	subreq = subreq + " (t.nauthorisation = '"+numberAuthorisatin+"') and  "   ;
		  }
	     if (!errorTransaction.equalsIgnoreCase("")) {	
		    	subreq = subreq + " (t.remarque  = '"+errorTransaction+"') and  " ;
		  }
	     
		
		query=query+subreq+" (1=1 ) ) ORDER BY   j.datejournal , t.heuredebut desc  ";
		
		System.out.println("requette : "+query);
	 
		
		
  
		 return jdbcTemplate.query(query  ,new RowMapper<Transaction>()
		 		{  
			    @Override  
			    public Transaction mapRow(ResultSet rs, int rownumber) throws SQLException {
			    	 
			    	
			    	Transaction trns=new Transaction();  
			    	
			    	trns.setIdtransaction(rs.getInt(1)); 
			    	trns.setIdjournal(rs.getInt(2));
			    	trns.setDebuttransactionDate(rs.getString(3));
			    	trns.setFintransactionDate(rs.getString(4));
			    	trns.setHeuredebut(rs.getTime(6));
			    	trns.setHeurefin(rs.getTime(7));
			    	trns.setNumerocarte(rs.getString(8));
			    	trns.setEtatcarte(rs.getString(9));
			    	trns.setMontant(rs.getLong(10));
			    	trns.setEtatcash(rs.getString(11));
			    	trns.setCassette1(rs.getInt(12));
			    	trns.setCassette2(rs.getInt(13));
			    	trns.setCassette3(rs.getInt(14));
			    	trns.setCassette4(rs.getInt(15));
			    	trns.setNauthorisation(rs.getString(16));
			    	trns.setRemarque(rs.getString(17));
			    	
  
			        return trns;  
			    }  
			    
			    }); 
		  
			}  
	}
	    
	
	
	
	
	
	
	



