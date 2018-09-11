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

import com.DieboldNixdorf.ProCompta.model.Incident;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;
 
 
 
 
@Repository("incidentDao")
public class IncidentDaoImpl implements IncidentDao {

	
	ToolsToUse toolToUse = new ToolsToUse();
	
	private JdbcTemplate jdbcTemplate;
	
	public IncidentDaoImpl(DataSource dataSource) 
	{
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	

	@Override
	public Incident findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Incident> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Incident> listIncidentByFilter(Date DebutIncidentDate, Date finIncidentDate, Time startingTimeIncident,
			Time fnisgingTimeIncident, String errorTransaction) {
		String query =    "  SELECT J.datejournal as DebutIncidentDate ,   "
						+ "  J.datejournal as fintransactionDate ,         "
						+ "  I.heureincidents , I.detailsincidents         "
						+ "  from incidents I                              "
						+ "  inner join journal J on J.idjournal = I.idjournal where (  "; 
		String subreq=""; 
		
		 if ( (!DebutIncidentDate.equals(null)) && (!finIncidentDate.equals(null))) 
		 {
			 subreq = subreq + " ( J.datejournal  BETWEEN  '"+DebutIncidentDate+"' and  '"+finIncidentDate+"' ) and "  ; 
		 }
		 
		 if ( (!startingTimeIncident.equals(null)) && (!fnisgingTimeIncident.equals(null))) 
		 {
			 subreq = subreq + " ( I.heureincidents  >=  '"+startingTimeIncident+"' and I.heureincidents <= '"+fnisgingTimeIncident+"' ) and "  ; 
		 }
		
		if ( (!errorTransaction.equalsIgnoreCase(""))  ) 
		 {
			 subreq = subreq + " (I.detailsincidents ='"+errorTransaction+"') and "  ; 
		 }
		
		query=query+subreq+" (1=1 ) ) ORDER bY J.datejournal ASC  ";
		System.out.println("requette : "+query);
		
		 return jdbcTemplate.query(query  ,new RowMapper<Incident>()
	 		{  
		    @Override  
		    public Incident mapRow(ResultSet rs, int rownumber) throws SQLException {
		    	 
		    	
		    	Incident incd=new Incident();
		    	
		    	incd.setDebutIncidentDate(rs.getString(1));
		    	incd.setFinIncidentDate(rs.getString(2));
		    	incd.setHeuredebutIncident(rs.getTime(3));
		    	incd.setDetailsincidents(rs.getString(4));
		      
		        return incd;  
		    }  
		    
		    });
	
		 
	}


	@Override
	public List<String> listTypeIncident() {
		
		String sqlQuery = "SELECT DISTINCT detailsincidents from incidents ORDER BY detailsincidents ASC ";
		List<String> listTypeIncident =jdbcTemplate.queryForList(sqlQuery,String.class);
		return listTypeIncident;
		 
	}

   
	}
	    
	
	
	
	
	
	
	



